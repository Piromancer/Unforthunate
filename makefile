all: build

build: clean yaf.o
	ld -o yaf yaf.o

yaf.o: yaf.asm
	nasm -f elf64 -g -F dwarf yaf.asm -o yaf.o

clean:
	rm -f *.o
	rm -f yaf

run: build
	./yaf

test_third_part: build
	./yaf < third_part_script.yaf
