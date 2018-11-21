assume cs:code



code segment
	
	start:
	mov ax,0ffh

	;移位计算
	shl ax,1
	mov dx,ax
	mov cx,
	shl ax,2
	add ax,dx

	mov ax,4c00h
	int 21h
	





	nop

	mov ax,4c00h
	int 21h
code ends

end start

