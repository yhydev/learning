assume cs:code



code segment
	
	start:
	mov ax,2
	out 70h,al

	

	out 71h,al



	nop

	mov ax,4c00h
	int 21h
code ends

end start

