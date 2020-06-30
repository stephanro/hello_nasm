hello_nasm: hello_nasm.o 
	ld -o hello_nasm hello_nasm.o

hello_nasm.o: ./src/hello_nasm.asm
	nasm -f elf64 -gdwarf -i src/ -l hello_nasm.lst -o hello_nasm.o ./src/hello_nasm.asm

reset:
	touch ./src/hello_nasm.asm

clear:
	(test -f ./hello_nasm && rm hello_nasm) || true
	(test -f hello_nasm.o && rm hello_nasm.o) || true
	touch ./src/hello_nasm.asm
