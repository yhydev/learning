assume cs:code


; write segment
; 	db 20h dup('<<Hello World!>>')
; write ends

; read segment
; 	db 200h dup(0)
; 	db '$'
; read ends

code segment	

	start:


	mov ah,1
	mov dl,0
	int 21h

	mov ax,4c00h;
	int 21h
	



code ends

end start