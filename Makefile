SRC = $(wildcard nbs/*.ipynb)

all: fastgpu docs

fastgpu: $(SRC)
	nbdev_build_lib
	touch fastgpu

docs_serve: docs
	cd docs && bundle exec jekyll serve

docs: $(SRC)
	nbdev_build_docs
	touch docs

test:
	nbdev_test_nbs

release: pypi
	fastrelease_conda_package --upload_user fastai
	nbdev_bump_version

pypi: dist
	twine upload --repository pypi dist/*

dist: clean
	python setup.py sdist bdist_wheel

clean:
	rm -rf dist

