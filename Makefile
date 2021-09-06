.PHONY: serve clean

JEKYLL = bundle exec jekyll

serve:
	$(JEKYLL) serve --incremental

clean:
	$(JEKYLL) clean
