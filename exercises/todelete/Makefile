CFLAGS = -Wall -O0 -mcpu=cortex-a53+nosimd

all: clean main

%.o: %.s
	clang --target=aarch64-elf $(CFLAGS) -g -c $< -o $@
	llvm-objdump-11 -d -s $@ > $@.assembled.dump
	readelf -a $@ > $@.assembled.readelf.dump

%.o: %.c
	gcc -I./ -O3 -lrt -ansi -pedantic -Wno-unused-result -c $< -o $@
	llvm-objdump-11 -d -s $@ > $@.assembled.c.dump

main: main.o utils.o
	ld.lld -m aarch64elf main.o utils.o -o main
	llvm-objdump-11 -d -s $@ > $@.linked.dump
	readelf -a $@ > $@.linked.readelf.dump

.PHONY: clean
clean:
	rm main *.o *.dump  >/dev/null 2>/dev/null || true

