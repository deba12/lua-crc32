# makefile for crclib
# based on bitlib's makefile

CFLAGS += -mtune=core2 -fPIC -W -Wall -O2 -I/usr/include/lua5.1 #-I/usr/local/include

OBJS = lcrc.o crc.o
SRCS = lcrc.c crc.c
AR = ar rcu
EXT = so 

T = crc.a

all: $T

# shared libraries (for Linux)

shared: $T
	$(CC) $(CFLAGS) -o crc.$(EXT) -shared *.o -llua5.1
	strip crc.$(EXT)
$T: $(OBJS)
	$(AR) $@ $(OBJS)

clean:
	rm -f $(OBJS) $T *.$(EXT)
