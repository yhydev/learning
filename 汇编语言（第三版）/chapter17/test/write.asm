assume cs:code


write segment
	db 20h dup('<<Hello World!>>')
write ends

read segment
	db 200h dup(0)
	db '$'
read ends

code segment	

	start:

	;写操作
	mov ax,write
	mov es,ax
	mov bx,200h

	mov al,1		;读取1个扇区
	mov cl,1		;扇区号，1 为第一个
	mov ch,0		;磁道号
	mov dl,0		;驱动器号 0:为软驱 A
	mov dh,0		;磁头号

	mov ah,3;写操作
	int 13h


	;读操作
	mov ax,read
	mov es,ax
	mov bx,200h

	mov al,1		;读取1个扇区
	mov cl,1		;扇区号，1 为第一个
	mov ch,0		;磁道号
	mov dl,0		;驱动器号 0:为软驱 A
	mov dh,0		;磁头号

	mov ah,2;读操作
	int 13h



	;输出读出的消息
	mov ax,read
	mov dx,0
	mov ds,ax
	mov ah,9
	int 21h

	mov ax,4c00h;
	int 21h
	



code ends

end start