VERSION = 0.1.0
PREFIX  ?= /usr/local

all:
	@echo nothing to build

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	install -m 755 scripts/analizo-metrics-multi-project $(DESTDIR)$(PREFIX)/bin
	install -m 755 scripts/analizo-metrics-history       $(DESTDIR)$(PREFIX)/bin

uninstall:
	rm $(DESTDIR)$(PREFIX)/bin/analizo-metrics-multi-project
	rm $(DESTDIR)$(PREFIX)/bin/analizo-metrics-history

release: AUTHORS checkrepo checktag
	git tag $(VERSION)
	@echo "Don't' forget to upload the tarball and `git push --tags`"

AUTHORS:
	git log --format='%aN <%aE>' | sort | uniq > $@

checkrepo:
	@(git status | grep 'nothing to commit') || (echo "There are uncommited changes; cannot continue with release"; false)

clean:
	@echo nothing to clean
