assume cs:code
;用中断码7c 打印data 段中内容，0为结尾
data segment
	db 'hello Asm',0
data ends

code segment
	
	start:
	;安装中断程序
	call install_7ch
	
	;注册到中断向量表
	mov ax,0
	mov ds,ax
	mov word ptr ds:[1F0h],200h
	mov word ptr ds:[1F2h],0




	;开始程序
	mov ax,data
	mov ds,ax
	mov dh,6
	mov dl,72
	mov cl,00000100B
	int 7ch

	mov ax,4c00h
	int 21h




	install_7ch:
	mov ax,cs
	mov ds,ax
	mov si,offset _7ch

	mov ax,0
	mov es,ax
	mov di,200h

	mov cx,offset _7ch_end - offset _7ch

	cld
	rep movsb
	ret



	_7ch:
	push ds
	push si
	push ax
	push bx
	push es
	push di

	;设置待打印数据偏移地址
	mov si,0

	;设置显存地址
	mov ax,0b800h
	mov es,ax

	;di 为打印的位置
	mov ax,0a0h
	mul dh
	mov dh,0
	add ax,dx
	mov di,ax
	
	mov ah,cl; 打印样式

	_7ch_s:
	cmp byte ptr [si],0
	je _7ch_ret
	mov al,[si]
	mov es:[di],ax
	inc si
	add di,2
	jmp _7ch_s
	_7ch_ret:
	pop di
	pop es
	pop bx
	pop ax
	pop si
	pop ds
	iret
	_7ch_end:
	nop






code ends
end start