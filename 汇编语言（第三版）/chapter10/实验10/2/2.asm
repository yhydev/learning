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
    ;��������ĳ�������
    ;use:
    ;require ax     ����������λ��
    ;require dx     ����������λ��
    ;require bx     ����
    ;cx     ������
    ;ret:
    ;ax �̣���λ)
    ;dx �̣���λ��
    ;bx ����
    ;cx ��ʱ
    divdw:
    push cx

    mov cx,ax                         ;���汻��������λ��

    ;������ high / ����
    mov ax,dx
    mov dx,0
    div bx
    
    push ax                   ;������(��λ / ��λ)
    mov ax,cx
    div bx

    mov bx,dx
    pop dx


    pop cx              

    ret



   
code ends

end start