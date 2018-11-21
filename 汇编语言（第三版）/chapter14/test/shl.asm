assume cs:code



code segment
	
	start:
	mov al,11111111B
	shl al,1

	mov al,01111111B
	shl al,1


	mov al,10101010B
	mov cl,2
	shl al,cl





	nop

	mov ax,4c00h
	int 21h
code ends

end start

