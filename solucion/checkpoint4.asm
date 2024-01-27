extern malloc
extern free
extern fprintf

section .data

section .text

global strCmp
global strClone
global strDelete
global strPrint
global strLen

; ** String **

; int32_t strCmp(char* a, char* b)
strCmp:
	push rbp
    mov rbp, rsp	

loop:
    mov al, [rdi]
    mov bl, [rsi]

	cmp al, bl
	je igual
	jl menor
	jg mayor

igual:
	jmp continue
menor: 
	mov eax, 1
	jmp end
mayor:
	mov eax, -1
	jmp end

continue:
  ; Avanza los punteros a los siguientes caracteres
  inc rdi 
  inc rsi 

  ; Verifica si se llegó al final de los strings
  cmp byte [rdi], 0 ; compara el byte apuntado por rdi con 0 (fin de string)
  jne loop 

  cmp byte [rsi], 0 ; compara el byte apuntado por rsi con 0 (fin de string)
  jne loop

  mov eax, 0;
  jmp end

end:
	pop rbp
	ret

; char* strClone(char* a)
strClone:
	ret

; void strDelete(char* a)
strDelete:
	; Esto no funciona porque copia el puntero al string
	; pero no el string en sí mismo
	mov rax, rdi
	ret

; void strPrint(char* a, FILE* pFile)
strPrint:
	ret

; uint32_t strLen(char* a)
strLen:
	push rbp
    mov rbp, rsp	
    mov esi, 0

_loop:
    ; Verifica si se llegó al final de los strings
    cmp byte [rdi], 0 ; compara el byte apuntado por rdi con 0 (fin de string)
    jne sumar
    je _end

sumar:    
    add esi, 1
    ; Avanza el punteros a los siguientes caracteres
    inc rdi 
    jmp _loop

_end:
    mov eax, esi
    mov rsp, rbp
    pop rbp
	ret


