##
##  Makefile -- Build procedure for ngx_mruby for nginx module
##	  MATSUMOTO, Ryosuke
##

MAKE="make"

HTTPD_SRC_ROOT=./httpd
MRUBY_ROOT=./mruby
LIBS=-lapr-1 -lssl -lcrypto -laprutil-1 -lm $(MRUBY_ROOT)/build/host/lib/libmruby.a 
CFLAGS=-I/usr/include/apr-1 -I./include -I$(MRUBY_ROOT)/include

#   the default target
all: 
		gcc ab-mruby.c -o ab-mruby $(CFLAGS) $(LIBS)

#   cleanup
clean:
	-rm -rf ab-mruby

