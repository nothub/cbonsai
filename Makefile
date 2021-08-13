.POSIX:
CC	= cc
PKG_CONFIG	?= pkg-config
CFLAGS	+= -Wall -Wextra -Wshadow -Wpointer-arith -Wcast-qual -pedantic $(shell $(PKG_CONFIG) --cflags ncursesw panelw)
LDLIBS	= $(shell $(PKG_CONFIG) --libs ncursesw panelw || echo "-lncursesw -ltinfo -lpanelw")
PREFIX	= /usr/local
MANDIR	= $(PREFIX)/share/man

cbonsai: cbonsai.c

install: cbonsai
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	mkdir -p $(DESTDIR)$(MANDIR)/man1
	install -m 0755 cbonsai $(DESTDIR)$(PREFIX)/bin/cbonsai
	install -m 0644 cbonsai.1 $(DESTDIR)$(MANDIR)/man1/cbonsai.1

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/cbonsai
	rm -f $(DESTDIR)$(MANDIR)/man1/cbonsai.1

clean:
	rm -f cbonsai

.PHONY: install uninstall clean
