################################################################################
# Makefile                                                                     #
#                                                                              #
# Description: This file contains the make rules for liso                      #
#                                                                              #
# Authors: Pooja Mangla                                      #
#                                                                              #
################################################################################

CFLAGS = -Wall -g
CC = gcc
LDFLAGS = -lssl

objects = loglib.o lisoio.o cgi.o lisod.o


default: lisod

.PHONY: default clean clobber handin

lisod: $(objects)
	$(CC) -o $@ $^ $(LDFLAGS)

lisod.o: lisod.c lisoio.h loglib.h cgi.h
lisoio.o: lisoio.c lisoio.h
cgi.o: cgi.c cgi.h lisoio.h
loglib.o: loglib.c loglib.h lisoio.h
loglib_test.o: loglib_test.c loglib.h lisoio.h

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<


loglib_test: loglib_test.o loglib.o loglib.h lisoio.o lisoio.h
	${CC} loglib.o loglib_test.o lisoio.o -o $@ $(LDFLAGS)


clean:
	rm -f  loglib.o lisoio.o lisod.o echo_client.o loglib_test.o lisod loglib_test echo_client log cgi.o liso_ssl.o *.tar

clobber: clean
	rm -f lisod

handin:
	(make clean; cd ..; tar cvf handin.tar 15-441-project-1 --exclude test --exclude cp1_checker.py --exclude README --exclude static_site --exclude dumper.py --exclude liso_prototype.py --exclude http_parser.h)



