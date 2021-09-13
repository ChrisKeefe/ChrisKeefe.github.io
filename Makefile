.PHONY: serve serve-drafts clean

JEKYLL = bundle exec jekyll

serve:
	$(JEKYLL) serve --incremental

serve-drafts:
	$(JEKYLL) serve --incremental --drafts

clean:
	$(JEKYLL) clean
