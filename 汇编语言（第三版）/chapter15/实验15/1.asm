assume cs:code

code segment
	
	start:
	; mov ax,stack
	; mov ss,ax
	; mov sp,128


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




	;输出程序
	int9:
	nop
	push ax
	push es
	push di
	push cx
	push bx
	
	pushf
	call dword ptr cs:[200h]
	mov bh,0
	mov bl,offset int9
	
	in al,60h

	;判断是否是1
	cmp al,1eh
	jne is_shift_down
	cmp byte ptr cs:[bx],1
	jne is_shift_down

	;填充满屏满屏数据
	mov ax,0b800h
	mov es,ax
	mov di,0
	mov cx,2000
	int9_s1:
	mov byte ptr es:[di],"A"
	add di,2
	loop int9_s1
	jmp int9_ret

	is_shift_down:
	cmp al,2ah
	je shift_down
	cmp al,36h
	jne is_shift_up
	shift_down:
	mov byte ptr cs:[bx],1
	jmp int9_ret
	

	is_shift_up:
	cmp al,2ah + 80h
	je shift_up
	cmp al,36h + 80h
	jne int9_ret
	shift_up:
	mov byte ptr cs:[bx],0

	int9_ret:
	pop bx
	pop cx
	pop di
	pop es
	pop ax
	iret
	int9_ret_end:
	nop



code ends

end start