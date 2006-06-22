SRC_DIR = .
OUTPUT_DIR = .
BASENAME = wabi2006
MAINTEX = ${BASENAME}.tex
INPUT = ${MAINTEX}
DVI_FILE = ${OUTPUT_DIR}/${BASENAME}.dvi
PDF_FILE = ${OUTPUT_DIR}/${BASENAME}.pdf

.PHONY: ${PDF_FILE}

dvi: ${MAINTEX}
	latex ${INPUT}
	latex ${INPUT}

ps: dvi
	dvips ${BASENAME}

pdf: dvi
	dvipdfm -o ${BASENAME}.pdf  ${BASENAME}

${DVI_FILE}: ${OUTPUT_DIR}
	latex ${INPUT}

${PDF_FILE}: ${DVI_FILE}
	dvipdfm -o $@ $^

tgz: ps
	tar czvf final-136.tgz  ${BASENAME}.tex ${BASENAME}.ps position_weights.eps chip.eps