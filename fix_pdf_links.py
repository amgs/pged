import pypdf
import sys

# get filename from args
filename = sys.argv[1]

pdf_reader = pypdf.PdfReader(filename)
pdf_writer = pypdf.PdfWriter()

for i in range(pdf_reader.get_num_pages()):
    page = pdf_reader.get_page(i)
    
    # if '/Annots' not in page: continue
    # for annot in page['/Annots']:
    #     annot_obj = annot.get_object()
    #     if '/A' not in annot_obj: continue  # not a link
    #     # you have to wrap the key and value with a TextStringObject:
    #     key   = pypdf.generic.TextStringObject("/URI")
    #     original_link = annot_obj['/A'][key]
    #     new_link = original_link.replace(".md", ".pdf")
    #     value = pypdf.generic.TextStringObject(new_link)
    #     annot_obj['/A'][key] = value
    if '/Annots' in page: del page['/Annots']
    pdf_writer.add_page(page)

pdf_reader.stream.close()

with open(filename, 'wb') as f:
    pdf_writer.write(f)