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
    ;���㳤�ȣ�0 ��Ϊ����
    ;
    ;require: bp ��ʼƫ�Ƶ�ַ
    ;require: ds �ε�ַ
    ;
    ;ret:
    ;dx Ϊ������
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