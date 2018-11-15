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
    ;16 进制转 10进制字符串
    ;
    ;use:
    ;require  ax 需转换（高位）
    ;require  dx 需转换（低位）
    ;require  bp 转换结果的偏移地址
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

    ;只有在低位为0的时候，才能调用
    check_quotient_high:
    mov cx,dx
    jcxz reverse_byte_and_ret
    jmp dtoc_s1


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
    ;避免溢出的除法计算
    ;
    ;use:
    ;require ax     被除数（低位）
    ;require dx     被除数（高位）
    ;require bx     除数
    ;cx     计数器
    ;
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