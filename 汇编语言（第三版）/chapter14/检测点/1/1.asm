assume cs:code



code segment
	
	start:
	mov ax,2
	out 70h,al

	

	in al,71h



	nop

	mov ax,4c00h
	int 21h
code ends

end start

