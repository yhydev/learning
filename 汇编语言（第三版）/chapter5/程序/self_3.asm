assume cs:codesg

codesg segment

	mov ax,0ffffh;
	mov ds,ax
	mov ax,ds:[6]
	mov dx,0
	mov cx,3

     s: add dl,al
	loop s
	
	
	


        mov ax,4c00h
        int 21h
codesg ends
end

       
        
        
