.DEFAULT_GOAL := build

build:
	./build.sh

clean:
	rm -rf /Applications/Camp
	cd tmp && ls | grep -v .gitignore | xargs rm -fr