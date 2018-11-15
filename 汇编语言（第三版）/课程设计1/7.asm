assume cs:codesg

data segment
    db '1975','1976','1977','1978','1978','1980','1981','1982','1983'
    db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
    db '1993','1994','1995'

    dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
    dd 345980,590827,803530,1183000,184000,2759000,3753000,4649000,5937000

    dw 3,7,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
    dw 11542,14430,15257,17800


data ends

table segment
    db 21 dup (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

table ends

dataidx segment
    
dataidx ends


codesg segment
    start:  mov ax,data
            mov ds,ax

            mov ax,table
            mov es,ax

            mov bp,0 				; data year start index
            mov si,84 				; data number of people index
            mov di,168 				; data income index
            mov bx,0 ;
            

            mov cx,21
       s:   mov ax,[bp]; copy year
            mov es:[bx],ax
            mov ax,[bp+2];
            mov es:[bx+2],ax

            mov ax,[di]
            mov es:[bx+0ah],ax
            
            mov ax,[si]				;copy number of people
            mov es:[bx+5],ax
            mov dx,[si+2];
            mov es:[bx+7],dx

            div word ptr [di]			;Comput average salary		
            mov es:[bx+0dh],ax			;copy  average salary

            add bp,4
            add si,4
            add di,2
            add bx,10h
            loop s
            
            mov ax,4c00h
            int 21h

codesg ends

end start
