assume cs:code

code segment
	
	
	nop
	nop
	start:
	nop
	nop
	mov ax,offset start

	mov ax,4c00h
	int 21h

code ends

end start

