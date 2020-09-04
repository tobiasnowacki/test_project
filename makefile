# Makefile for UK Careers Project
R_OPTS=--vanilla
# Directories
TEXFILE = test_project
HEADER = header
OUT_FILES = 


all: $(TEXFILE).pdf 

modified_data/mt_agg.csv : original_data/mt_cars.csv code/data_agg.R
	R CMD BATCH $(R_OPTS) code/data_agg.R

output/plot1.pdf: modified_data/mt_agg.csv code/plot1.R
	R CMD BATCH $(R_OPTS) code/plot1.R

# Make .tex file
$(TEXFILE).pdf: $(TEXFILE).tex output/plot1.pdf header.tex
	pdflatex $(TEXFILE) 

# View main tex file
view: $(TEXFILE).pdf $(TEXFILE).tex
	open $(TEXFILE).pdf

# Clean up stray files
clean:
	rm -fv $(OUT_FILES) 
	rm -fv $(CROP_FILES)
	rm -fv *.aux *.log *.toc *.blg *.bbl *.synctex.gz
	rm -fv *.out *.bcf *blx.bib *.run.xml
	rm -fv *.fdb_latexmk *.fls
	rm -fv $(TEXFILE).pdf

.PHONY: all clean
