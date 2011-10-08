# makefile for crclib
# based on bitlib's makefile

CFLAGS += -W -Wall -O2 -I/c/Lua/include #-I/usr/local/include

OBJS = lcrc.o crc.o
SRCS = lcrc.c crc.c
AR = ar rcu
EXT = dll

T = libluacrc.a

all: $T

# shared libraries (for Linux)

shared: $T
	$(CC) $(CFLAGS) -o libluacrc.$(EXT) -shared *.o /c/Lua/lib/liblua.a /c/Lua/lib/liblualib.a #-llua -llualib

$T: $(OBJS)
	$(AR) $@ $(OBJS)

clean:
	rm -f $(OBJS) $T *.$(EXT)
