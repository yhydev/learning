assume cs:code

data_fmt_str segment
	db '00/00/00 00:00:00','$'
data_fmt_str ends

time_indexs segment
	db 0,2,4,7,8,9
time_indexs ends



code segment
	


	start:
	mov ax,data_fmt_str
	mov ds,ax


	mov si,15
	mov bx,0
	mov cx,6
	
	s1:
	push cx

	;获取时间单位
	mov al,[bx+20h]
	out 70h,al
	in al,71h
	
	;时间单位的高位
	mov ah,al
	mov cl,4
	shr ah,cl
	add ah,30h
	

	;时间单位的低位
	and al,00001111B
	add al,30h

	mov [si],ah
	mov [si+1],al

	inc bx
	sub si,3
	pop cx
	loop s1


	mov dx,0
	mov ax,900h
	int 21h

	mov ax,4c00h
	int 21h



	

	



	
code ends



end start

