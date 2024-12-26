# modules=("01_sociedade_em_rede_e_educacao_digital" "03_pedagogia_e_aprendizagem_digital" "05_praticas_de_avaliacao_digital" "02_ambientes_educativos_emergentes" "04_tecnologias_e_recursos_audiovisuais" "06_projeto_de_formacao_em_contexto_digital")
modules=("01_sociedade_em_rede_e_educacao_digital")
mkdir -p "02 Output"
for module in $modules; do
	cd "01 Módulos"/$module
	for x in *.md; do pandoc "$x" -o "../../02 Output/${x%.md}.pdf" -H ../../preamble.tex; done
	cd ..
done

