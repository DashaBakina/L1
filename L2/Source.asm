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
sub X, ax; �������� �� � 1 � ��������� ���������� � �
mov X_, ax
xor ax,ax; �������� �������

mov ecx,3; �������
mov ax, Y
l1: add ax, X_
loop l1
mov L, ax; ��������� ����� ������� � L
xor ax,ax; �������� �������

;2
mov ax, X_
or ax,Z
mov M, ax; ����������(���) X �� Z ��������� ������� � M

cmp M, 10E8h ;
jl m2 ; ���� ������
jmp m1 ; �������

m1:
mov ax, 211Fh
sub M, ax
mov R, ax; ��������� 211F �� � ��� � > 10E8 � ������ ���������� � R
xor ax,ax

m2:
mov ax, 01D0h
add M, ax
mov R, ax; �������� 01D0 � � ��� � <= 10E8 � ������ ���������� � R
xor ax,ax

;3
m3:
mov R, ax

mov ebx, 0
mov ebx,eax
mov ecx,0

_loop:
shr al, 1 ; ����� ������ �� 1
adc ecx, 0 
test al, al ; ���������� �
jnz _loop ; �������, ���� ���=0


test ecx, 1 ; ��������/����������

jp adr1 ; �������� ���������
jnp adr2 ; ������ ���������

adr1:
mov ax, R
mov dx, 0
mov bx, 2
div bx
; ��������� � ax
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