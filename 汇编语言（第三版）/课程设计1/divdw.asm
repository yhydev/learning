assume cs:codesg


codesg segment

	start:mov ax,0ffffh
		  mov dx,0ffffh
		  mov bx,3
		  push bx
		  call divdw


		  mov ax,4c00h
		  int 21h



          divdw:push ax				;��������λ
		push dx 			;��������λ
		push bx				;��ʱ�洢
		push cx				;��ʱ����
		
		push ax				;���汻������λ

		;��λ�� �� dx ��cx
		mov ax,dx
		mov dx,0
		div bx
		mov cx,ax ;������
		
		;(���� * 010000h + ��λ(ax)) / ����(bx)
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