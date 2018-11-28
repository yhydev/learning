assume cs:code

code segment	

	start:
	mov ax,0
	int 16h

	mov ah,1
	cmp al,'r'
	je red
	cmp al,'g'
	je green
	cmp al,'b'
	je black


	red:
	shl ah,1
	green:
	shl ah,1
	black:
	call setRgColor

	mov ax,4c00h
	int 21h


	setRgColor:
	push es
	push di
	push cx

	mov di,0
	mov cx,0b800h
	mov es,cx
	mov cx,2000

	setRgColor_s1:
	and byte ptr es:[di+1],ah
	add di,2
	loop setRgColor_s1


	pop cx
	pop di
	pop es
	ret

code ends

end start