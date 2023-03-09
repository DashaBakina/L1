.686
.model flat, stdcall
.stack 100h

.data
X dw 54697 ;
Y dw 31FFh ;
Z dw 5555h ;

L dw ?;
M dw ?;
X_ dw ?;
R dw ?;
W dw ?;

.code
ExitProcess PROTO STDCALL : DWORD
Start :
;1
mov ax, 1
sub X, ax; вычитаем из Х 1 и результат записываем в Х
mov X_, ax
xor ax,ax; очистить регистр

mov ecx,3; Счётчик
mov ax, Y
l1: add ax, X_
loop l1
mov L, ax; результат цикла записан в L
xor ax,ax; очистить регистр

;2
mov ax, X_
or ax,Z
mov M, ax; Дизъюнкция(или) X от Z результат записан в M

cmp M, 10E8h ;
jl m2 ; если меньше
jmp m1 ; переход

m1:
mov ax, 211Fh
sub M, ax
mov R, ax; вычитание 211F из М при М > 10E8 и запись результата в R
xor ax,ax

m2:
mov ax, 01D0h
add M, ax
mov R, ax; сложение 01D0 и М при М <= 10E8 и запись результата в R
xor ax,ax

;3
m3:
mov R, ax

mov ebx, 0
mov ebx,eax
mov ecx,0

_loop:
shr al, 1 ; сдвиг вправо на 1
adc ecx, 0 
test al, al ; логическое и
jnz _loop ; перейти, если нет=0


test ecx, 1 ; четность/нечетность

jp adr1 ; нечетный результат
jnp adr2 ; четный результат

adr1:
mov ax, R
mov dx, 0
mov bx, 2
div bx
; результат в ax
jmp rez

adr2:
xor R, 3985
jmp rez

rez:
mov eax, ebx
mov W, ax

exit:
Invoke ExitProcess, 1
End Start