assume cs:code


strs segment
	db 20h dup('<<Hello World!>>')
	db '$'
strs ends



code segment	

	start:



	;输出读出的消息
	mov ax,strs
	mov ds,ax
	mov ax,9
	int 21h

	mov ax,4c00h;
	int 21h
	



code ends

end start