assume cs:code

code segment


	start:
	mov ax,0
	mov es,ax
	mov word ptr es:[7*4],offset int7
	mov word ptr es:[7*4+2],cs

	mov ax,202h
	int 7



	mov ax,4c00h
	int 21h




	int7:
	jmp short int7_start
	int7_func dw  clearPrint, setRgColor, setBgColor, rollTopLine

	int7_start:
	push bx
	mov bh,0
	mov bl,ah
	add bx,bx
	call int7_func[bx]
	jmp int7_ret


	clearPrint:
	push es
	push di
	push cx

	mov di,0
	mov cx,0b800h
	mov es,cx
	mov cx,2000

	clearPrint_s1:
	mov byte ptr es:[di],' '
	add di,2
	loop clearPrint_s1


	pop cx
	pop di
	pop es
	ret


	setRgColor:
	push es
	push di
	push cx

	mov di,0
	mov cx,0b800h
	mov es,cx
	mov cx,2000

	setRgColor_s1:
	and byte ptr es:[di+1],11111000B
	or es:[di+1],al
	add di,2
	loop setRgColor_s1


	pop cx
	pop di
	pop es
	ret



	setBgColor:
	push es
	push di
	push cx

	mov di,0
	mov cx,0b800h
	mov es,cx
	mov cx,2000

	setBgColor_s1:
	and byte ptr es:[di+1],10001111B
	or es:[di+1],al
	add di,2
	loop setBgColor_s1


	pop cx
	pop di
	pop es
	ret

	rollTopLine:
	push es
	push di
	push cx
	push ax

	mov di,0
	mov cx,0b800h
	mov es,cx
	mov cx,1920

	rollTopLine_s1:
	mov ax,es:[di+160]
	mov es:[di],ax
	add di,2
	loop rollTopLine_s1

	mov cx,80

	rollTopLine_s2:
	mov es:[di],720h
	add di,2
	loop rollTopLine_s2


	pop ax
	pop cx
	pop di
	pop es
	ret

	int7_ret:
	pop bx
	iret
	int7_end:
	nop

code ends

end start