assume cs:codesg

data segment
    db '1975','1976','1977','1978','1978','1980','1981','1982','1983'
    db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
    db '1993','1994','1995'

    dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
    dd 345980,590827,803530,1183000,184000,2759000,3753000,4649000,5937000

    dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
    dw 11542,14430,15257,17800


data ends

data_str segment
	db 690h dup(0)
	db 0
data_str ends


codesg segment
	start:
	call full_data_str
	
	mov ax,data_str
	mov ds,ax
	mov cl,1
    mov dx,303h
	call print

	nop
	mov ax,4c00h
	int 21h





	full_data_str:
	push ax
	push bx
	push cx
	push dx
	push di
	push es
	push ds
	push si
	push bp

	mov ax,data_str
	mov ds,ax

	mov ax,data
	mov es,ax
	

	mov cx,21
	mov bx,0; data index
	mov di,0; data_str index

	full_data_str_s1:

	;������
	mov ax,es:[bx]
	mov [di],ax
	mov si,2
	mov ax,es:[bx+si]
	mov [di+2],ax
	
	;�����ӯ�� ���βƫ�Ƶ�ַ+2
	mov si,84
	mov ax,es:[bx+si]
	mov si,86
	mov dx,es:[bx+si]
	push ax		;��ʱ�洢����������Ա��ƽ������
	push dx		;ͬ��
	mov bp,di
	add bp,11
	call dtoc
	
	

	;��Ա������
	mov si,168
	push bx
	mov ax,bx
	mov bx,2
	mov dx,0
	div bx
	mov bx,ax
	mov ax,es:[bx+si]
	pop bx
	push ax		;��ʱ�洢����������Ա��ƽ������
	mov dx,0
	mov bp,di
	add bp,22
	call dtoc

	;����
	pop si	;Ա������
	pop dx	;�����루��λ��
	pop ax	;�����루��λ
	push bx
	mov bx,si
	call divdw
	mov bp,di
	add bp,33
	call dtoc

	pop bx

	add di,80
	add bx,4
	
	loop full_data_str_s1

	mov cx,10h
    mov dx,20h
    mov bp,0
    mov cx,690h
    call replace_bytes

	pop bp
	pop si
	pop ds
	pop es
	pop di
	pop dx
	pop cx
	pop bx
	pop ax
	ret



	;des:
	;��ӡ�ַ���
	;
	;use:
	;require: ds ��ӡ���ַ����ε�ַ
	;require: cl ��ӡ����ʽ 
	;require: dx ��dh��dl�д�ӡ
	print:
    push dx
    push cx
    push si
    push ax



    ;����es Ϊ�Դ�ε�ַ
    mov ax,0b800h
    mov es,ax

    ;si = ��ӡ��ʼλ�ã�dl ��ӡ����ʽ
    mov ax,160    
    mul dh
    mov dh,0
    add ax,dx
    add ax,dx 
    mov si,ax   
    mov dl,cl          

    mov bx,0

    print_s1:
    mov cl,[bx]   ;set charset
    mov ch,0
    jcxz print_ret   ;is return
    mov es:[si],cl  ;show charset
    mov es:[si+1],dl  ;show color
    inc bx
    add si,2
    loop print_s1

    print_ret:
    pop ax
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
