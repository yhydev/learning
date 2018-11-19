assume cs:codesg

codesg segment
	
	start:
	;安装中断程序
	call install_lp
	mov ax,0
	mov ds,ax

	mov word ptr ds:[1F0h],200h
	mov word ptr ds:[1F2h],0


	;主程序
	mov ax,0b800h
	mov es,ax
	mov di,160*12
	mov bx,offset s - offset se
	mov cx,80

	s:
	mov byte ptr es:[di],'!'
	mov byte ptr es:[di+1],00000100B
	add di,2
	int 7ch
	se:
	nop


	mov ax,4c00h
	int 21h



	install_lp:
	mov ax,cs
	mov ds,ax
	mov si,offset lp

	mov ax,20h
	mov es,ax
	mov di,0

	mov cx,offset lp_end - offset lp
	cld
	rep movsb
	ret


	lp:
	
	dec cx
	
	jcxz lpret
	push bp
	mov bp,sp
	add [bp+2],bx
	pop bp

	lpret:
	iret
	lp_end:
	nop


codesg ends
end start