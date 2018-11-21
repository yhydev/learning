assume cs:code

stack segment
	db 128 dup(0)
stack ends


code segment
	
	start:
	mov ax,stack
	mov ss,ax
	mov sp,128


	;安装新中断程序
	mov ax,cs
	mov ds,ax
	mov si,offset int9
	mov ax,0
	mov es,ax
	mov di,204h
	mov cx,offset int9_ret_end - offset int9
	cld
	rep movsb


	;替换原中断地址为新中断地址
	push es:[9*4+2]
	push es:[9*4]
	pop es:[200h]
	pop es:[202h]
	
	cli 
	mov word ptr es:[9*4],204h
	mov word ptr es:[9*4+2],0
	sti



	mov ax,4c00h
	int 21h





	;修改控制台中心颜色
	int9:
	push ax
	push es
	push di
	push cx
	
	pushf
	call dword ptr cs:[200h]


	;获取按下的键盘标识,判断是否更改颜色
	in al,60h
	cmp al,3bh
	jne int9_ret
	
	;修改颜色
	mov ax,0b800h
	mov es,ax
	mov di,1
	mov cx,2000
	int9_s1:
	inc byte ptr es:[di]
	add di,2
	loop int9_s1

	int9_ret:
	pop cx
	pop di
	pop es
	pop ax
	iret
	int9_ret_end:
	nop



code ends

end start