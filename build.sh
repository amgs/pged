modules="01_sociedade_em_rede_e_educacao_digital 02_ambientes_educativos_emergentes 03_pedagogia_e_aprendizagem_digital 04_tecnologias_e_recursos_audiovisuais 05_praticas_de_avaliacao_digital 06_projeto_de_formacao_em_contexto_digital"
mkdir -p "02 Output"
source .venv/bin/activate
for module in $modules; do
	cd "01 Módulos"/$module
	for x in *.md; do
		pandoc -f markdown --template=../../template.tex -H ../../preamble.tex -s -o "../../02 Output/${x%.md}.pdf" "$x"
		python ../../fix_pdf_links.py "../../02 Output/${x%.md}.pdf"
	done
	cd ../..
done

