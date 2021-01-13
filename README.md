# A Simple Book Build Pipeline with Pandoc 

This repository is a simple build process for making books with Pandoc. It was used 
to publish [The Complete Guide to Rails Performance and The Ruby on Rails Performance Apocrypha.](https://gumroad.com/nateberk)

This configuration creates PDF, EPUB, TXT, and HTML build artifacts.

## Usage 

Put contents (I use Markdown, but because it's Pandoc, you can use [almost any format](https://pandoc.org/MANUAL.html) for input) inside the `/content` directory. They will be concatenated in alphabetical order to form the book, so I typically use something like the following structure:

```
content/00_introduction.md 
content/01_first_chapter.md 
content/02_second_chapter.md
...
```

`h1` and `h2` will cause a page break, using the CSS I have in the `pandoc` folder. I like to have "sub sections" in my books, so I use `h1` for the section headers and `h2` for chapter headers. `h3` and below can be used for emphasis but do not appear in the table of contents. 

Images go in the `img` folder. 

The `pandoc/epub_metadata.md` file is a special place for putting epub-specific metadata.

`$ make` and `$ make clean` build and delete the build artifacts, respectively. 

`$ make wordcount` will count the words in the content folder.

