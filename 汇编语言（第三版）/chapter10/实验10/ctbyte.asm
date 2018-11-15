assume cs:codesg
data segment
    db 1,2,3,4,5,6,0,0,0,0,0
data ends

codesg segment


    start:
    mov ax,data
    mov ds,ax
    mov bp,0
    call count_str


    nop
    mov ax,4c00h
    int 21h


    ;des:
    ;计算长度，0 作为结束
    ;
    ;require: bp 起始偏移地址
    ;require: ds 段地址
    ;
    ;ret:
    ;dx 为计算结果
    count_str:
    push si
    push cx
    mov ch,0
    mov si,0

    cs_s:
    mov cl,[si+bp]
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