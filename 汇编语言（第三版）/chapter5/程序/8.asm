assume cs:code

code segment

        mov bx,0   ;loop count unit
        mov cx,12  ;loop 

     s: mov ax,0ffffh
        mov ds,ax
        mov dl,[bx]

        mov ax,020h
        mov ds,ax
        mov [bx],dl

        inc bx
        loop s



        mov ax,4c00h
        int 21h

code ends
end
