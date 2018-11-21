assume cs:code



code segment
	
	start:
	mov al,10000001B
	shr al,1

	
	shr al,1



	mov cl,2
	shr al,cl





	nop

	mov ax,4c00h
	int 21h
code ends

end start

