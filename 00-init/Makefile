CFLAGS = -Wall -O0 -mcpu=cortex-a53+nosimd

all: clean main

main.o: main.s
	clang --target=aarch64-elf $(CFLAGS) -g -c main.s -o main.o
	llvm-objdump-11 -d -s main.o > main.assembled.dump
	readelf -a main.o > main.assembled.readelf.dump

main: main.o
	ld.lld -m aarch64elf -nostdlib main.o -o main
	llvm-objdump-11 -d -s main > main.linked.dump
	readelf -a main > main.linked.readelf.dump

.PHONY: clean
clean:
	rm main *.o *.dump >/dev/null 2>/dev/null || true

.PHONY: run
run:
	./main