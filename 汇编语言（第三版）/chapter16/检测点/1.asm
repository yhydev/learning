assume cs:code

code segment
	a dw 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
	b dd 0


	start:
	mov si,0
	mov cx,8
	s:
	mov ax,a[si]
	add word ptr b,ax
	adc word ptr b[2],0
	add si,2
	loop s

	mov ax,4c00h
	int 21h


code ends

end start