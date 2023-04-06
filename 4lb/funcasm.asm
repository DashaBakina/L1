.586 
.XMM
.MODEL flat,C
.DATA
f DD 0
result DD 1
i_local DD 0

.CODE
extern funcC:near
public funcasm
funcasm proc C x:dword, y:dword 
	
	mov eax, x
	mov ebx, y
	add ebx, 1

	mov i_local, 1

	@@for_i: 

	add eax, 1
	cmp eax, ebx
	jg stop

	push eax
	call funcC
	pop eax
	fstp f
	mov ecx, f
	mov edx, result
	cmp ecx, edx

	jg same
	inc i_local
	loop @@for_i 
same: 
	mov result, ecx
	inc i_local
	loop @@for_i 

stop:

	fld result
	ret
	funcasm endp
End
