
documentName = draft-inacio-sacm-infomodel-00

all: ${documentName}.txt

${documentName}.txt : ${documentName}.xml

${documentName}.xml : ${documentName}.md




%.xml : %.md
	mmark -2 $< > $@

%.txt : %.xml
	gsed -i -e 's/<rfc ipr="trust200902"/<rfc ipr="trust200902" docName="${documentName}"/' $<
	xml2rfc $<


