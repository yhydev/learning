assume cs:code
code segment
	s1: db 'hello world','$'

	start:
	mov ax,cs
	mov ds,ax
	mov dx,0

	mov dl,0
	mov dh,3
	mov ax,900h
	int 21

	mov ax,4c00h
	int 21h


code ends
end start