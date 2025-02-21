# HARP Lab Research Website

This is a jekyll site--you'll need Jekyll. You can test locally via:

jekyll serve

## To rebuild the site

`make` will rebuild the site using Jekyll.

## Students

Students should go in _data/students.json.

## Papers 

Papers go in _data/papers.json.

**NOTE**: You need to fill out a "plaintext" attribute (the paper description that will be displayed on the website) and also a "bibtex" attribute. The "bibtex" attribute **has** to be `base64` encoded. Make sure you do this whenever you add a paper.

[ ] TODO: Automate this process using a `.bib`?



