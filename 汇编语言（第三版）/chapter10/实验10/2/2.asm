assume cs:code

code segment
    start:
    mov ax,0ffffh
    mov dx,0ffffh
    mov bx,1
    call divdw
    nop
    mov ax,4c00h
    int 21h


    ;des:
    ;避免溢出的除法计算
    ;use:
    ;require ax     被除数（低位）
    ;require dx     被除数（高位）
    ;require bx     除数
    ;cx     计数器
    ;ret:
    ;ax 商（低位)
    ;dx 商（高位）
    ;bx 余数
    ;cx 临时
    divdw:
    push cx

    mov cx,ax                         ;保存被除数（低位）

    ;被除数 high / 除数
    mov ax,dx
    mov dx,0
    div bx
    
    push ax                   ;保存商(高位 / 低位)
    mov ax,cx
    div bx

    mov bx,dx
    pop dx


    pop cx              

    ret



   
code ends

end start