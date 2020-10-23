Data SEGMENT
 path db "test.bat",0 ; имя файла для октрытия
 buf  db ?
 strg db 100 dup(?)
DATA ENDS
 
SSEG SEGMENT STACK
      db 200 dup(?)
SSEG ENDS
 
CODE SEGMENT
 ASSUME CS:CODE, DS:DATA, SS:SSEG
  begin:
        mov ax,DATA     ; настроим DS
        mov DS,ax               ; на реальный сегмент
        ;открываем файл
        mov ax,3d00h    ; открываем для чтения
        lea dx,path             ; DS:dx указатель на имя файла
        int 21h         ; в ax деcкриптор файла
        jc exit         ; если поднят флаг С, то ошибка открытия
        
        mov bx,ax               ; копируем в bx указатель файла
        xor cx,cx
        xor dx,dx
        mov ax,4200h
        int 21h         ; идем к началу файла
   out_str:
        mov ah,3fh          ; будем читать из файла
        mov cx,1                ; 1 байт
        lea dx,buf              ; в память buf
        int 21h                 
        cmp ax,cx               ; если достигнуть EoF или ошибка чтения
        jnz close               ; то закрываем файл 
        mov dl,buf
        mov ah,9                ; выводим символ в dl <<<<<<<<<<<<<<< вот тут не так надо? :)
        int 10h         ; на стандартное устройство вывода
        jmp out_str
   close:                       ; закрываем файл, после чтения
        mov ah,3eh
        int 21h
   exit:                        ; завершаем программу
        mov ah,4ch
        int 21h
CODE ENDS
  end begin