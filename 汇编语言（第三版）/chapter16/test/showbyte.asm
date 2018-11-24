assume cs:code

code segment

	start:

	mov ax,2fh
	call showbyte
	mov ax,4c00h
	int 21h

	;desc
	;显示一个十六进制字节形数据
	;params
	;al: 为显示的数据 
	showbyte:
	jmp short showbyte_code
	hex db '0123456789ABCDEH'
	showbyte_code:
	push ax
	push es
	push bx

	mov ah,al
	shr ah,1
	shr ah,1
	shr ah,1
	shr ah,1
	and al,00001111B

	mov bx,0b800h
	mov es,bx

	mov bh,0
	mov bl,ah
	mov ah,hex[bx]
	mov es:[160*12+80],ah

	mov bh,0
	mov bl,al
	mov ah,hex[bx]
	mov es:[160*12+82],ah

	pop bx
	pop es
	pop ax
	ret
code ends

end start