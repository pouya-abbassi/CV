cv.pdf:
	latexmk -f -xelatex -interaction=nonstopmode -output-directory=$(PWD)/build/ cv.tex

.PHONY: build
build: cv.pdf

.PHONY: clean
clean:
	rm -rf build
	rm -f *~
all: build
