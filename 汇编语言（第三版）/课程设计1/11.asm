assume cs:code
; 80 * 25
data segment
    db '1975','1976','1977','1978','1978','1980','1981','1982','1983'
    db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
    db '1993','1994','1995'

    dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
    dd 345980,590827,803530,1183000,184000,2759000,3753000,4649000,5937000

    dw 3,7,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
    dw 11542,14430,15257,17800


data ends

table segment
    db 21 dup (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
table ends

table_str segment
    db 4000 dup (21h)
table_str ends

code segment
    call tb_init

          ;replace 0 to 20h
          mov ax,table
          mov ds,ax
          mov ah,0
          mov al,20h
      	  mov cx,336	  
          call rep_byte
	          


          ;show table
          mov dx,0400h
          mov cx,2
          mov ax,table_str
          mov ds,ax
          call show_str

	start:mov ax,table_str
          mov ds,ax


          mov ax,2122h
          mov cx,4000
          call rep_byte

		  mov dx,0400h
          mov cx,2
          call show_str

  
          mov ax,4c00h
          int 21h





;***除法********************************************
  divdw:push ax				;require:被除数低位
		push dx 			;require:被除数高位
		push bx				;require:除数
		push cx				;临时储存
		
		push ax				;保存被除数低位

		;高位除 余 dx 商cx
		mov ax,dx
		mov dx,0
		div bx
		mov cx,ax ;保存商
		
		;(余数 * 010000h + 低位(ax)) / 除数(bx)
		pop ax
		div bx

		
		mov dx,cx

		pop cx
		pop bx
		pop dx
		pop ax
		ret







;-------------------------------------------------------------

  rep_byte:push ax ;require: higi byte replace find str,low byte replace str
	   	   push cx ;require:replace str length
           push ds ;require:byte sg address
           push bx ; loop index
          

           mov bx,0   
           
      rb_s:push cx
	   mov ch,0
           mov cl,ah
           sub cl,[bx]
           jcxz rb_loop1

    rb_loop:inc bx
            pop cx
            loop rb_s

           pop bx
	   pop ds
	   pop cx
           pop ax
           ret

           ;replace byte
           rb_loop1:mov [bx],al
           jcxz rb_loop


;----------tb_to_str----------------------------------------------------------
 tb_to_str:push ax
           push bx		
           push cx
           push dx
           push ds		;table segment address
           push es

           mov cx,21
           mov bx,0
           mov ax,table_str
           mov es,ax

;todo

           pop es
           pop ds
           pop dx
	   pop cx
           pop bx
    	   pop ax
           ret           

;-----------tb_init--------------------------------------------------
tb_init:    push ax
            push dx
            push es
            push bp
            push si
            push di
            push bx
            push cx
            
            mov ax,data
            mov ds,ax

            mov ax,table
            mov es,ax

            mov bp,0 ; data year start index
            mov si,84 ; data number of people index
            mov di,168 ; data income index
            mov bx,0 ;
            

            mov cx,21
       ti_s:   mov ax,[bp]; copy year
            mov es:[bx],ax
            mov ax,[bp+2];
            mov es:[bx+2],ax

            mov ax,[di]
            mov es:[bx+0ah],ax
            
            mov ax,[si];copy number of people
            mov es:[bx+5],ax
            mov dx,[si+2];
            mov es:[bx+7],dx

            div word ptr [di]	;Comput average salary					
            
            mov es:[bx+0dh],ax;copy  average salary

            add bp,4
            add si,4
            add di,2
            add bx,10h
            loop ti_s
            
	    pop cx
            pop bx
            pop di
            pop si
            pop bp
            pop es
            pop dx
	    pop ax
            ret

 show_str:push dx               ;require:higi row,low col
          push cx 				;require:rgb color
          push si               
          push bx
          push ds               ;require:byte segment address
          push ax		
          push es		
	 
          mov si,0 
          mov ax,0b800h
          mov es,ax		;set show address
          mov ax,160		
          mul dh
          mov dh,0		
          add ax,dx
          add ax,dx 
          mov si,ax		;set show offset address
          mov dl,cl          

          mov bx,0
        s:mov cl,[bx]		;set charset
          mov ch,0
          jcxz ss_ret		;is return
          mov es:[si],cl 	;show charset
          mov es:[si+1],dl 	;show color
          inc bx
          add si,2
          loop s
   ss_ret:pop es
          pop ax		
          pop ds               ;require:byte segment address
          pop bx
          pop si               
          pop cx 		;require:rgb color
          pop dx               ;require:higi row,low col          
          ret

code ends

end start