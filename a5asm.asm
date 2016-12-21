
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
	jmp _printFormat
	
_printFormat:	
	push dword fmt3; "Flags:"
	call printf
	add esp, 4
	push dword fmt2; "\n"
	call printf
	add esp, 4
	
    	push dword fmt0
	call printf
	add esp, 4
	mov bx, 0800h
	

    	
_getReg:pop eax	
	test bx,ax
	push eax	
	jz _0
	jmp _1 
	
_printReg:
    	push dword fmt1
	call printf
	
    	add esp, 8
	shr bx, 1
	cmp bx, 0
	jnz _getReg
	
	push dword fmt2
	call printf
	add esp, 4


	mov eax, dword [ebp + 20]
	pop word [eax]
	add esp, 2; 4 byte mit pop zusammenrechen
	
	
	
	pop eax
	mov esp, ebp
	pop ebp
	ret
	
_sub:	mov eax, 0
	add ax, word [ebp + 8]
	sub ax, word [ebp + 12]
	push eax
	pushfd
	jmp _printFormat
	
_0 :	push dword 0
	jmp _printReg
	
_1 :	push dword 1
	jmp _printReg

	
;********Daten-Segment********
section .data
fmt0: dw "O D I T S Z   A   P   C ",10,0
fmt1: dw "%d "
fmt2: dw "  ",10,0;"\n"
fmt3: dw "Flags: ",10
