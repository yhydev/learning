assume cs:code



code segment
	
	start:

	mov ax,20h
	mov es,ax
	mov di,0

	mov ax,cs
	mov ds,ax
	mov si,offset divIntercept

	mov cx,offset  divInterceptEnd - offset divIntercept
	cld
	rep movsb



	mov ax,0
	mov ds,ax
	mov ds:[0],200h
	mov ds:[2],ax

	mov ax,0ffffh
	mov dx,0ffffh
	mov bx,1
	div bx

	mov ax,4c00h
	int 21h
	


	divIntercept:
	jmp short divInterceptPrintError
	divInterceptErrorMSG:
	db 'overflow!!!!'
	divInterceptPrintError:
	push es
	push si
	push ds
	push di
	push ax


	mov ax,20h
	mov ds,ax
	mov si,2

	mov ax,0b800h
	mov es,ax
	mov di,160 * 12 + 68

	mov cx,12
	divInterceptPrint:
	mov al,[si]
	mov ah,00000100B
	mov es:[di],ax
	inc si
	add di,2
	loop divInterceptPrint

	push ax
	push di
	push ds
	push si
	push es

	mov ax,4c00h
	int 21h
	divInterceptEnd:
	nop



code ends

end start

