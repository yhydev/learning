assume cs:code,ds:data,ss:stack

data segment
    dw 0123h,0456h
data ends

stack segment
    dw 0,0
stack ends

code segment
    start: mov ax,stack
           mov ss,ax
           mov sp,16

           mov ax,data
           mov ds,ax

           push ds:[0]
	   push ds:[2]

	   pop ds:[2]
           pop ds:[0]

           mov ax,4c00h
           int 21h

code ends
end start

;1.dw 0123h,0456h,0,0,0,0,0,0
;2.cs = b42h | ss = b41 | ds = b40
;3.x - 2 | x - 1
;4.16 µÄ±¶Êý