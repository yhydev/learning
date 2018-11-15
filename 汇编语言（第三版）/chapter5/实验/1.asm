assume cs:code

code segment
	
	mov ax,200h
	mov ds,ax
	mov cx,63
	mov bx,0

     s: mov [bx],bl
	inc bx
	loop s
     

	mov ax,4c00h
	int 21

code ends
end
