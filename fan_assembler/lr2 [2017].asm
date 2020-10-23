masm
model small              
.stack  128
.data
len	db    10    ;количество элементов в mas
mas     db    2,5,7,3,2,8,1,5,2,3
rez     db    0
k	dw    0
ind2 db 2
.code
start:
mov ax,@data
mov ds,ax
xor cx, cx 
mov cl,len ; количество элементов в массиве в cx
xor ax,ax 
xor si,si      ; регистр si - индекс i, нумерация с 0
xor bx,bx 
mov dl, 2 
xor di, di
cycl:

mov al, mas[si]
div ind2
cmp dl,1
 
je m1
inc di
add bl, mas[si]
m1:      

inc si
loop cycl  

mov rez, bl
mov k, di

exit:mov   ax,4c00h
int 21h     ;возврат управления операционной системе
end     start 