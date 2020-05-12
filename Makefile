SCHEMEH=/usr/lib/csv9.5.3/ta6le

install := install

PREFIX ?= /usr/lib/csv9.5.3

libdir := $(DESTDIR)$(PREFIX)/ffi/
scmdir := $(DESTDIR)$(PREFIX)/lib/arcfide/

.SUFFIXES: .c .so

all: sockets sockets-stub.so socket-ffi-values.so

sockets: sockets.w
	cheztangle sockets.w
	chezweave sockets.w
	pdftex sockets

.c.so:
	gcc -fPIC -shared -I${SCHEMEH} -o $@ $<

install:
	$(install) sockets-stub.so socket-ffi-values.so $(libdir)/
	$(install) sockets.ss  $(scmdir)/
	$(install) sockets.sls $(scmdir)/sockets.chezscheme.sls

