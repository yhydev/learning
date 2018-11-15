assume cs:codesg
data segment
    db 1,2,3,4,0,0,1,2,0,0
data ends

codesg segment


    start:
    mov ax,data
    mov ds,ax
    mov bp,6
    call reverse_byte


    nop
    mov ax,4c00h
    int 21h


    ;des:
    ;倒置byte
    ;
    ;use:
    ;require: ds 段地址
    ;require: dp byte 起始位置
    ;
    reverse_byte:
    push ax;temp data
    push cx;loop count
    push bx;ds index 0 step
    push dx;return str length
    push si;ds index 
    push di

    ;如果要转换的byte 长度为0 的话，就直接返回
    call count_byte

    ;cx = 字节长度 / 2，bx = 字节起始偏移地址，si = byte 字节末尾偏移地址
    mov cx,dx
    mov si,cx
    mov dx,0
    mov ax,cx
    mov cx,2
    div cx
    
    mov cx,ax
    mov bx,0
    mov di,bp
    jcxz reverse_str_ret
    reverse_str_s1:
    dec si
    mov al,ds:[bx+di]       ;
    mov ah,ds:[si+bp]
    mov ds:[bx+di],ah             
    mov ds:[si+bp],al
    inc bx
    loop reverse_str_s1


    reverse_str_ret:
    pop di
    pop si
    pop dx
    pop bx
    pop cx
    pop ax
    ret
    ;des:
    ;计算长度，0 作为结束
    ;
    ;require: bp 起始偏移地址
    ;require: ds 段地址
    ;
    ;ret:
    ;dx 为计算结果
    count_byte:
    push si
    push cx
    mov ch,0
    mov si,0

    cs_s:
    mov cl,ds:[si+bp]
    jcxz cs_ret
    inc si
    jmp cs_s           

    cs_ret:
    mov dx,si
    pop cx
    pop si
    ret


codesg ends

end start