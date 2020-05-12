SCHEMEH=/usr/lib/csv9.5.3/ta6le

.SUFFIXES: .c .so

all: sockets sockets-stub.so socket-ffi-values.so

sockets: sockets.w
	cheztangle sockets.w
	chezweave sockets.w
	pdftex sockets

.c.so:
	gcc -fPIC -shared -I${SCHEMEH} -o $@ $<
	
