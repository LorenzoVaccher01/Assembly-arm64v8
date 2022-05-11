CFLAGS = -Wall -O0 -mcpu=cortex-a53+nosimd

all: clean main

%.o: %.s
	clang --target=aarch64-elf $(CFLAGS) -g -c $< -o $@
	llvm-objdump-11 -d -s $@ > $@.assembled.dump
	readelf -a $@ > $@.assembled.readelf.dump

main: main.o exit.o
	ld.lld -m aarch64elf -nostdlib main.o exit.o -o main
	llvm-objdump-11 -d -s $@ > $@.linked.dump
	readelf -a $@ > $@.linked.readelf.dump


.PHONY: clean
clean:
	rm main *.o *.dump  >/dev/null 2>/dev/null || true

