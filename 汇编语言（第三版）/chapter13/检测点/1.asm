assume cs:codesg

data segment
	db 'conversation',0
data ends

codesg segment
	



	start:
	;安装中断程序
	call install_lp
	mov ax,0
	mov ds,ax
	;mov word ptr ds:[0],200h
	;mov word ptr ds:[2],0

	mov word ptr ds:[1F0h],200h
	mov word ptr ds:[1F2h],0

	; mov ds:[0],200h
	; mov byte ptr ds:[2],0



	;输出内容
	mov ax,data
	mov ds,ax
	mov si,0
	
	mov ax,0b800h
	mov es,ax
	mov di,12*160

	mov bx,offset s - offset s_exit

	s:
	cmp byte ptr [si],0
	je s_exit
	mov al,[si]
	mov ah,00000100B
	mov  es:[di],ax
	inc si
	inc di
	inc di
	int 7ch
	s_exit:
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
	
;	dec bx
	
;	jcxz lpret
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