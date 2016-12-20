
;********Code-Segment********
section .text

extern printf


global addsub

addsub:	
	push ebp
	mov ebp, esp
	sub esp, 4
	mov eax, 0; muss in eax
	add ax, word [ebp + 16]
	cmp ax, 43
	jnz _sub
	
_add:	mov eax, 0	
	add ax, word [ebp + 8]
	add ax, word [ebp + 12]
	push eax
	pushfd
	jmp _printControl
	
	
	
_printControl:	
    push dword fmt0
	call printf


_getReg:
    mov bx, 0800h
	add esp, 4
	pop eax
	test bx,ax	
	jz _0
	jmp _1
	 
_printReg:

    push dword fmt1
	call printf
    add esp, 8
	shr bx, 1
	cmp bx, 0
	jnz _getreg
	
	;push dword fmt2
	;call printf
;	pop eax; loeschen

	;pushfd
	;mov eax, dword [ebp + 20]
	;mov eax, dword [eax]
	;pop eax
	;pop ebx
	
	;add esp, 12;aufraeumen, 8 12 16
	pop eax
	mov esp, ebp
	pop ebp
	ret
	
_sub:	mov eax, 0
	add ax, word [ebp + 8]
	sub ax, word [ebp + 12]
	push eax
	pushfd
	jmp _printControl
_0 :	push dword 0
	jmp _printReg
_1 :	push dword 1
	jmp _printReg

	
;********Daten-Segment********
section .data

fmt0: dw "O D I T S Z   A   P   C ",10,0
fmt1: dw "%d "
fmt2: dw "  ",10,0

