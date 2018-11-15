assume cs:codesg

data segment
    db 00000010b,00010100b,01110001b
    db 13 dup(0)

    dw 680h,1824,1984
    dw 5 dup(0)

    db 'webcome to masm!'
data ends

stacksg segment
    db 20h dup(0)

stacksg ends


codesg segment
     start:mov ax,0b800h
           mov es,ax

           mov ax,stacksg
           mov ss,ax
           mov sp,10h

           mov ax,data
           mov ds,ax

           mov si,0
           
           mov cx,3
           mov bx,0         
        s0:mov ah,[si+bx];set rgb
           push bx
           add bx,bx
           mov di,[si+16+bx] ;set address
           pop bx
           inc bx


    putstr:push bx
           push cx
           
           mov bx,0
           mov cx,10h
         s:mov al,[bx+20h] ;set charset
           mov bp,bx
           add bp,bx
           mov es:[di+bp],ax
           inc bx
           loop s
           
           pop cx
           pop bx
           loop s0          

           mov ax,4c00h
           int 21h
         
codesg ends

end start