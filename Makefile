# Makefile zum Verlinken eines ASM-Moduls mit einem C-Programm
# HS Emden/Leer | C.Koch 
# 11.06.2012	initial version
# 11.12.2014	update 64-bit. Ubuntu 14.04 -> to compile 32-bit code on 64-bit environment:
#		$ sudo apt-get install gcc-multilib

# C-Quellcode kompilieren und mit ASM-Modul linken
a5: a5asm.o a5.o 	
	gcc -m32 -o a5 a5.o a5asm.o 	# linken

a5.o: a5.c
	gcc -m32 -c -o a5.o a5.c 	# compilieren 

# ASM-Modul assemblieren
a5asm.o: a5asm.asm
	nasm -f elf -o a5asm.o a5asm.asm

# Projekt aufraemen 
clean:
	@echo 'Ausgabedateien loeschen' 
	rm -f a5.o a5asm.o		#clean





