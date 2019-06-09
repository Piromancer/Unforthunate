all: build

build: clean unforthunate.o
	ld -o unforthunate unforthunate.o

unforthunate.o: unforthunate.asm
	nasm -f elf64 -g -F dwarf unforthunate.asm -o unforthunate.o

clean:
	rm -f *.o
	rm -f unforthunate

run: build
	./unforthunate

test_third_part: build
	./unforthunate < third_part_script.unforthunate
