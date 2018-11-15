assume cs:code

code segment
        mov ax,0ffffh
        mov ds,ax
        mov ax,[6]
        mov bx,[6]
        mov cx,[6]
        mov dx,[6]

code ends

end
