#!/bin/bash

rm -f *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.log *.out *.run.xml *.4ct *.4tc *.tmp *.xref *.dvi *.idv *.lg
latexmk -xelatex cv

htlatex web
biber web
htlatex web

rm -f *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.log *.out *.run.xml *.4ct *.4tc *.tmp *.xref *.dvi *.idv *.lg

