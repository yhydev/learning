assume cs:code

stack segment
	db 128 dup(0)
stack ends

data segment
	dd 0
data ends

code segment
	
	start:
	mov ax,stack
	mov ss,ax
	mov sp,128


	mov ax,data
	mov ds,ax

	;入栈 中断码为9 的数据
	mov ax,0
	mov es,ax

	push es:[9*4+2]
	push es:[9*4]
	pop ds:[0]
	pop ds:[2]

	;修改 中断码为9 的数据
	mov word ptr es:[9*4],offset int9
	mov es:[9*4+2],cs


	;显示字符
	mov ax,0b800h
	mov es,ax
	mov ah,'a'

	s:
	mov es:[160*12+40*2],ah
	call delay
	inc ah
	cmp ah,'z'
	jna s


	;出栈 中断码为9 的数据
	mov ax,0
	mov es,ax

	push ds:[0]
	push ds:[2]
	pop es:[9*4+2]
	pop es:[9*4]



	mov ax,4c00h
	int 21h



	;休眠
	delay:
	push ax
	push dx
	mov ax,0
	mov dx,1000h

	delay_s:
	sub ax,1
	sbb dx,0
	cmp ax,0
	jne delay_s
	cmp dx,0
	jne delay_s

	pop dx
	pop ax
	ret



	;修改控制台中心颜色
	int9:
	push ax
	push es
	
	pushf
	; pushf
	; pop ax
	; and ah,11111100B
	; push ax
	; popf
	call dword ptr ds:[0]


	;获取按下的键盘标识,判断是否更改颜色
	in al,60h
	cmp al,1
	jne int9_ret
	;修改颜色
	mov ax,0b800h
	mov es,ax
	inc byte ptr es:[160*12+40*2+1]

	int9_ret:
	pop es
	pop ax
	iret

code ends

end start