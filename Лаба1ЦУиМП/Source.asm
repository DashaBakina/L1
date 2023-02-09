.686
.model flat,stdcall
.stack 100h
.data
X dw 103;
Y dw 12;
M dw ? ;
T dw ?;
.code
ExitProcess PROTO STDCALL :DWORD
Start:
mov ax, 0
sub ax, X
mov T, ax

mov bx, 0
sub bx, Y
mov ax, 4
imul bx 

mov cx, T
sub cx, ax

xor cx,bx

mov M,cx

exit:
Invoke ExitProcess,1
End Start 


