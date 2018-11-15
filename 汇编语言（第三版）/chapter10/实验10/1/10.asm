assume cs:code
; 80 * 25
data segment
    db 'Webcome to masm!',0
data ends

code segment
    start:mov dh,8
          mov dl,3
          mov cl,2
          mov ax,data
          mov ds,ax
          mov si,0
          call show_str

          mov ax,4c00h
          int 21h

 show_str:push dx
          push cx
          push si
          
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
   ss_ret:pop si
          pop cx
          pop dx
          ret

code ends

end start