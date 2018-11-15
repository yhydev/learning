assume cs:code

code segment

        mov bx,0   ;loop count unit
        mov cx,12  ;loop 

        mov ax,0ffffh
        mov ds,ax

        mov ax,20h
        mov es,ax

      
     s: mov dl,[bx]
        mov es:[bx],dl

        inc bx
        loop s



        mov ax,4c00h
        int 21h

code ends
end
