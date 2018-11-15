assume cs:codesg,ds:datasg

datasg segment
    db 'ibm             '
    db 'dec             '
    db 'dos             '
    db 'vax             '
    dw 0
datasg ends

codesg segment
    start: mov ax,datasg
           mov ds,ax

           mov bx,0
           mov cx,4

        s: mov ds:[40],cx            
	   mov si,0        
           mov cx,3
           
       s0: mov al,[bx+si]
           and al,11011111b
           mov [bx+si],al
           inc si
           loop s0
           
           add bx,10h
           mov cx,ds:[40]
           loop s

           mov ax,4c00h;
           int 21h

codesg ends

end start