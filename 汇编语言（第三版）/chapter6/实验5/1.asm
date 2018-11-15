assume cs:code,ds:code,ss:stack

data segment
    dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h
data ends

stack segment
    dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
stack ends

code segment
    start: mov ax,stack
           mov ss,ax
           mov sp,16

           mov ax,data
           mov ds,ax

           push ds:[0];data = 0,0,0,0,0,0,0,0,0,0,0,0,0,0,023h,01h
           push ds:[2];data = 0,0,0,0,0,0,0,0,0,0,0,0,056h,04h,023h,01h

           pop ds:[2];data = 0,0,0,0,0,0,0,0,0,0,0,0,0,0,023h,01h | dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h
           pop ds:[0];data = 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 | dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h

           mov ax,4c00h
           int 21h
code ends

end start

;1.data = 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
;2.cs = b43h | ss = b41h | ds = b40h
;3.x - 3h | x -2h

