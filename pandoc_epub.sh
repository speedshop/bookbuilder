pandoc $@ --metadata-file pandoc/metadata.yaml \
  --toc --toc-depth=1 --fail-if-warnings --data-dir pandoc \
  pandoc/epub_metadata.md \
  contents/**/*.md
