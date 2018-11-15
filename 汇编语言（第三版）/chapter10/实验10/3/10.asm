assume cs:code
; 80 * 25
data segment
    db 10h dup(0)
data ends



code segment
    start:
    mov ax,data
    mov ds,ax
    mov bp,2
    mov dx,07fffh
    mov ax,0ffffh
    call dtoc


    mov dh,8 
    mov dl,3
    mov cl,2
    call show_str


    mov ax,4c00h
    int 21h



    ;des:
    ;16 ����ת 10�����ַ���
    ;
    ;use:
    ;require  ax ��ת������λ��
    ;require  dx ��ת������λ��
    ;require  bp ת�������ƫ�Ƶ�ַ
    dtoc:
    push ax;
    push dx;
    push bx;
    push cx;
    push di;

    mov di,0

    dtoc_s1:
    mov bx,10
    call divdw
    add bx,30h
    
    mov ds:[bp+di],bl;set rem
    
    inc di

    mov cx,ax
    jcxz check_quotient_high
    jmp dtoc_s1

    reverse_byte_and_ret:
    call reverse_byte
    
    pop di
    pop cx                  
    pop bx        
    pop dx
    pop ax
    ret

    ;ֻ���ڵ�λΪ0��ʱ�򣬲��ܵ���
    check_quotient_high:
    mov cx,dx
    jcxz reverse_byte_and_ret
    jmp dtoc_s1


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
    mov cl,[si+bp]
    jcxz cs_ret
    inc si
    jmp cs_s           

    cs_ret:
    mov dx,si
    pop cx
    pop si
    ret


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
    jcxz reverse_str_ret
    reverse_str_s1:
    dec si
    mov al,[bx]       ;
    mov ah,[si]
    mov [bx],ah             
    mov [si],al
    inc bx
    loop reverse_str_s1


    reverse_str_ret:
    pop si
    pop dx
    pop bx
    pop cx
    pop ax
    ret



    show_str:
    push dx
    push cx
    push si

    mov ax,0b800h
    mov es,ax   ;set show address
    mov ax,160    
    mul dh
    mov dh,0    
    add ax,dx
    add ax,dx 
    mov si,ax   ;set show offset address
    mov dl,cl          

    mov bx,0

    s:
    mov cl,[bx]   ;set charset
    mov ch,0
    jcxz ss_ret   ;is return
    mov es:[si],cl  ;show charset
    mov es:[si+1],dl  ;show color
    inc bx
    add si,2
    loop s

    ss_ret:
    pop si
    pop cx
    pop dx
    ret


    ;des:
    ;��������ĳ�������
    ;
    ;use:
    ;require ax     ����������λ��
    ;require dx     ����������λ��
    ;require bx     ����
    ;cx     ������
    ;
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