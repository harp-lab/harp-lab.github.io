.PHONY: build clean

# Build the site and output it to the docs folder
build:
	jekyll build --destination docs

deploy: build
	git add docs
	git commit -m "website push"
	git push

# Clean the docs folder (optional)
clean:
	rm -rf docs/*
