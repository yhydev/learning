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
    ;����byte
    ;
    ;use:
    ;require: ds �ε�ַ
    ;require: dp byte ��ʼλ��
    ;
    reverse_byte:
    push ax;temp data
    push cx;loop count
    push bx;ds index 0 step
    push dx;return str length
    push si;ds index 
    push di

    ;���Ҫת����byte ����Ϊ0 �Ļ�����ֱ�ӷ���
    call count_byte

    ;cx = �ֽڳ��� / 2��bx = �ֽ���ʼƫ�Ƶ�ַ��si = byte �ֽ�ĩβƫ�Ƶ�ַ
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
    ;���㳤�ȣ�0 ��Ϊ����
    ;
    ;require: bp ��ʼƫ�Ƶ�ַ
    ;require: ds �ε�ַ
    ;
    ;ret:
    ;dx Ϊ������
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