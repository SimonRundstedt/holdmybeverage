#!/usr/bin/make -f
prefix = /usr/bin

install:
	mkdir -p $(DESTDIR)$(prefix)
	install -D scripts/holdmyb* $(DESTDIR)$(prefix)

.phony: install
