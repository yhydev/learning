assume cs:codesg

codesg segment

	mov ax,0ffffh;
	mov ds,ax
	mov bx,6
	mov ax,[bx]
	mov ah,0
	mov dx,0
	mov cx,123

     s: add dl,al
	loop s
	
	
	


        mov ax,4c00h
        int 21h
codesg ends
end

       
        
        
