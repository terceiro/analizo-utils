SUBDIRS = scripts
EXTRA_DIST = README.rst

AUTHORS:
	@echo "Updating AUTHORS file ..."
	@git log --format='%aN <%aE>' | sort | uniq > $@

checkrepo:
	@echo "Checking for uncommited changes ..."
	@(git status | grep 'nothing to commit') || (echo "**** There are uncommited changes in the repository; cannot continue with release"; false)

checktag:
	@echo "Checking existance of $(VERSION) tag ..."
	@if (git tag | grep "^$(VERSION)" > /dev/null); then echo "**** There is already a tag for version $(VERSION); cannot continue with release" ; false; fi

release: AUTHORS checkrepo checktag dist
	@echo "Tagging version $(VERSION) ..."
	@git tag $(VERSION)
	@echo "DONE! Don't' forget to upload the tarball and `git push --tags`"
