PREFIX  ?= /usr/local

all:
	@echo nothing to build

install:
	install -m 755 scripts/analizo-metrics-multi-project $(DESTDIR)$(PREFIX)/bin
	install -m 755 scripts/analizo-metrics-history       $(DESTDIR)$(PREFIX)/bin

uninstall:
	rm $(DESTDIR)$(PREFIX)/bin/analizo-metrics-multi-project
	rm $(DESTDIR)$(PREFIX)/bin/analizo-metrics-history

clean:
	@echo nothing to clean
