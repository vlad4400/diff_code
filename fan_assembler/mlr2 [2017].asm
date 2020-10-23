masm
model small              
.stack  128
.data
len		db		10    					;store length array
mas    	db    	2,5,7,3,2,8,1,5,2,3
s     	db    	0
.code
start:
mov ax,@data
mov ds,ax
xor cx,cx 

mov cl,len 	    	;array length 
xor si,si			;array counter
xor bx,bx

cycl:
xor ax,ax
mov al,mas[si]
sub ax,3
cmp ax,5
ja m1
add bl,mas[si]
m1:      

inc si
loop cycl  

mov s, bl

exit:mov   ax,4c00h
int 21h
end     start 