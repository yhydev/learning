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
    ;�滻�ֽ�
    ;
    ;use:
    ;require: dx ��λ�滻���ֽڣ���λ�滻Ϊ���ֽ�
    ;require: cx �ֽڳ���
    ;require: ds ���ݶε�ַ
    ;require: bp �滻��ʼλ��
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