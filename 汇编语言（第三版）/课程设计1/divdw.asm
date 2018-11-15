assume cs:codesg


codesg segment

	start:mov ax,0ffffh
		  mov dx,0ffffh
		  mov bx,3
		  push bx
		  call divdw


		  mov ax,4c00h
		  int 21h



          divdw:push ax				;被除数低位
		push dx 			;被除数高位
		push bx				;临时存储
		push cx				;临时储存
		
		push ax				;保存被除数低位

		;高位除 余 dx 商cx
		mov ax,dx
		mov dx,0
		div bx
		mov cx,ax ;保存商
		
		;(余数 * 010000h + 低位(ax)) / 除数(bx)
		pop ax
		div bx

		
		mov dx,cx

		pop cx
		pop bx
		pop dx
		pop ax
		ret
codesg ends

end start