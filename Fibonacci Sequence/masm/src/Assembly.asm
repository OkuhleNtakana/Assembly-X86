;	Author:    O_Ntakana 
.386
.MODEL FLAT ; Flat memory model
.STACK 4096 ; 4096 bytes
INCLUDE io.inc
; Exit function
ExitProcess PROTO NEAR32 stdcall, dwExitCode:DWORD

; The data section stores all global variables
.DATA
str1 BYTE "Result: ",0
str2 BYTE ", ",0
NewLine BYTE 10,0
result DWORD 0
First DWORD 0
Second DWORD 1
n DWORD 20

.CODE
;function 
Fibonacci PROC NEAR32
   
   mov ebx,n
  strt: 
   dec ebx
   mov eax,First 
   mov ecx,Second
   add eax,ecx
   mov result,eax
   INVOKE OutputInt, result
   INVOKE OutputStr, ADDR str2
   mov eax,Second
   mov first,eax
   mov eax,result
   mov Second,eax
   cmp ebx,0
   jne strt

   
   
   ret
Fibonacci ENDP


_start:
        INVOKE OutputStr, ADDR str1
        call Fibonacci
        INVOKE OutputStr, ADDR NewLine

	 INVOKE ExitProcess, 0
Public _start
END
