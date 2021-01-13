VERSION := 0.0.1
FILENAME := my_book_filename

_release:
	mkdir _release _release/$(VERSION)
	./pandoc_epub.sh -o _release/$(VERSION)/$(FILENAME).epub
	epubcheck _release/$(VERSION)/$(FILENAME).epub
	./pandoc.sh --self-contained --css='pandoc/pdf.css' --template='pandoc/pdf.html' | wkhtmltopdf -s B5 -L 20mm -R 20mm -T 15mm -B 15mm - _release/$(VERSION)/$(FILENAME).pdf
	./pandoc.sh -o _release/$(VERSION)/$(FILENAME).html --self-contained --css='pandoc/html.css' --template='pandoc/book.html'
	./pandoc.sh -o _release/$(VERSION)/$(FILENAME).txt
	tar -zcvf _release/$(FILENAME)-$(VERSION).tar.gz _release/$(VERSION)
	zip -r _release/$(FILENAME)-$(VERSION).zip _release/$(VERSION)

clean:
	rm -rf _release

wordcount:
	wc -w `find . -name "contents/**/*.md"`
