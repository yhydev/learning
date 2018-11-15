assume cs:code

data segment
	db "Beginner's ALL-purpose Symbolic Instruction Code.",0
data ends

code segment
	
	start:
	mov ax,data
	mov ds,ax
	mov bx,0

	s:
	mov al,[bx]
	
	cmp al,0
	je exit

	cmp al,97
	jb next

	cmp al,122
	ja next

	sub al,32
	mov [bx],al

	next:
	inc bx
	jmp s
	

	exit:
	mov ax,4c00h
	int 21



code ends

end start

