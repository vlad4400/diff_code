.model small
.stack
.data
 
f_name  db  'test42.txt',0
f_name2  db  'test421.txt',0
descr   dw  ?
buf     db  100
str_len db  ?
strg    db  100 dup (?)
LAB DB 40,?,40 DUP('$')
  ARR DB 40 DUP(0)
  AWORD DB 0
  N DB 0
  LEN DB 0
 
.code
str3:
  mov   ax,@data
  mov   ds,ax
  

  MOV AH,0AH
  LEA DX,LAB+2
  INT 21H
  MOV  AX,DS
  MOV  ES,AX
  CLD
  MOV AX,0
  MOV AL,' '
  LEA DI,LAB
  MOV CX,40
  REPNE SCASB
  DEC DI
  MOV DX,BX
  MOV BX,DI
  SUB BX,4
  MOV AWORD,BL
@A:
  MOV DX,DI
  REPNE SCASB
  JNE @B
  DEC DI
  MOV BX,DI
  SUB BX,DX
  MOV LEN,BL
  CMP      BL,AWORD
  JG @C
 INC N
@C:
 JMP @A
@B:

mov   ah,0Ah  ;Input
  lea   dx,buf
  int   21h
   
  
  mov   ah,3Ch  ;Create File
  xor   cx,cx
  lea   dx,f_name
  int   21h
  mov   descr,ax
 
  mov   ah,3Dh  ;Open File
  mov   al,2
  lea   dx,f_name
  int   21h
  mov   descr,ax
 
  xor   ax,ax
  mov   al,str_len
  cbw
  mov   bp,ax
  xor   ax,ax
 
  mov   bx,descr
  call  write
 
  mov   ah,3Eh  ;Close File
  mov   bx,descr
  int   21h
 
  mov   al, 0Ah
  int   29h ; new line
 
  mov   bx,1    ; stdout - console
  call  write
 
  mov ax,4C00h
  int 21h
write:
  mov   ah,40h  ;Record File
  mov   cx,bp
  lea   dx,strg
  int   21h

  mov   ah,3Ch  ;Create File
  xor   cx,cx
  lea   dx,f_name2
  int   21h
  mov   descr,ax

  mov   bx,1    ; stdout - console
  call  write1
  mov ax,4C00h
  int 21h
write1:
  mov   ah,40h  ;Record File
  mov   cx,bp
  lea   dx,strg
  int   21h

  ret
  end str3