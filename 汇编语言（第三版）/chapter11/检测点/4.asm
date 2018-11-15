assume cs:code

code segment
	mov ax,0
	push ax		;sp = 00 00
	popf		;flag = 00 00
	mov ax,0fff0h
	add ax,0010h	;(00000000 01000101)
	pushf 		;sp = 45 00
	pop ax
	and al,11000101b
	and ah,00001000b



	mov ax,4c00h
	int 21h
code ends

end

