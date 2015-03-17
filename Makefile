TARGET_PLATFORM=c64
VICE_BASE=C:/Users/usucuha/retrocomputing/C64/WinVICE-2.4-x64
VICE_TARGET=$(VICE_BASE)/x64

CC65BASE=C:/Users/usucuha/retrocomputing/C64/cc65

CC=$(CC65BASE)/bin/cc65
CA=$(CC65BASE)/bin/ca65
LD=$(CC65BASE)/bin/ld65
CO=$(CC65BASE)/bin/co65

CURRDIR=$(shell pwd)

all: mkdisk

c64life: c64life.o math.o screen.o
	$(LD) -o c64life -t $(TARGET_PLATFORM) c64life.o math.o screen.o $(TARGET_PLATFORM).lib

#tribal.o: tribal.c
#	$(CC) -O -t $(TARGET_PLATFORM) tribal.c
#	$(CA) tribal.s

c64life.o: c64life.s
	$(CA) -t $(TARGET_PLATFORM) c64life.s

math.o: math.s
		$(CA) -t $(TARGET_PLATFORM) math.s

screen.o: screen.s
		$(CA) -t $(TARGET_PLATFORM) screen.s

clean:
	rm -f *.o
	rm -f c64life
	rm -f c64life.d64

mkdisk: c64life
		rm -f c64life.d64
		$(VICE_BASE)/tools/c1541 -format C64Life,1 d64 c64life.d64 8 -write c64life

run: mkdisk
	$(VICE_TARGET) $(CURRDIR)/c64life.d64
