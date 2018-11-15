assume cs:codesg
data segment
    db 0,0,0,0,0,0,0,0,0,0
data ends

codesg segment


    start:
    mov ax,data
    mov ds,ax
    mov bp,0
    mov cx,10h
    mov dx,1
    call replace_bytes


    nop
    mov ax,4c00h
    int 21h


    

    ;des:
    ;替换字节
    ;
    ;use:
    ;require: dx 高位替换的字节，低位替换为的字节
    ;require: cx 字节长度
    ;require: ds 数据段地址
    ;require: bp 替换起始位置
    replace_bytes:
    push cx
    push dx
    push bx
    push bp

    replace_bytes_s1:
    push cx
    mov ch,0
    mov cl,ds:[bp]
    sub cl,dh
    jcxz replace_byte

    replace_bytes_s2:
    inc bp
    pop cx
    loop replace_bytes_s1


    pop bp
    pop bx
    pop dx
    pop cx
    ret
    replace_byte:
    mov ds:[bp],dl
    jmp replace_bytes_s2




codesg ends

end start