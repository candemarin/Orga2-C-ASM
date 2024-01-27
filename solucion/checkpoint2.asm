extern sumar_c
extern restar_c
;########### SECCION DE DATOS
section .data

;########### SECCION DE TEXTO (PROGRAMA)
section .text

;########### LISTA DE FUNCIONES EXPORTADAS

global alternate_sum_4
global alternate_sum_4_simplified
global alternate_sum_8
global product_2_f
global alternate_sum_4_using_c

;########### DEFINICION DE FUNCIONES
; uint32_t alternate_sum_4(uint32_t x1, uint32_t x2, uint32_t x3, uint32_t x4);
; registros: x1[?], x2[?], x3[?], x4[?]
alternate_sum_4:
	;prologo
	; COMPLETAR

	;recordar que si la pila estaba alineada a 16 al hacer la llamada
	;con el push de RIP como efecto del CALL queda alineada a 8

	sub edi, esi
	sub edx, ecx
	add edi, edx
	mov eax, edi

	;epilogo
	; COMPLETAR
	ret

; uint32_t alternate_sum_4_using_c(uint32_t x1, uint32_t x2, uint32_t x3, uint32_t x4);
; registros: x1[rdi], x2[rsi], x3[rdx], x4[rcx]
alternate_sum_4_using_c:
	;prologo
	push rbp ; alineado a 16
	mov rbp,rsp

	; COMPLETAR

	;epilogo 

	call restar_c
	call restar_c
	call sumar_c

	pop rbp
	ret


; uint32_t alternate_sum_4_simplified(uint32_t x1, uint32_t x2, uint32_t x3, uint32_t x4);
; registros: x1[?], x2[?], x3[?], x4[?]
alternate_sum_4_simplified:

	call restar_c
	call restar_c
	call sumar_c

	ret

; uint32_t alternate_sum_8(uint32_t x1, uint32_t x2, uint32_t x3, uint32_t x4, uint32_t x5, uint32_t x6, uint32_t x7, uint32_t x8);
; registros y pila: x1[?], x2[?], x3[?], x4[?], x5[?], x6[?], x7[?], x8[?]
alternate_sum_8:
	;prologo

	push rbp
    mov rbp, rsp

	;epilogo

	sub edi, esi
	sub edx, ecx
	add edi, edx ; edi tiene el resultado de x1 - x2 + x3 - x4
	
	mov ecx, [rbp+16] ; x7
    mov edx, [rbp+24] ; x8

	sub r8d, r9d
	sub ecx, edx
	add r8d, ecx ; r8d tiene el resultado de x4 - x5 + x6 - x7

	add edi, r8d

	mov eax, edi

	pop rbp

	ret


; SUGERENCIA: investigar uso de instrucciones para convertir enteros a floats y viceversa
;void product_2_f(uint32_t * destination, uint32_t x1, float f1);
;registros: destination[?], x1[?], f1[?]
product_2_f:

	push rbp
    mov rbp, rsp

    ; Multiplicar x1 por f1
    cvtsi2ss xmm1, esi  ; Convertir x1 a float en xmm1
    mulss xmm0, xmm1    ; Multiplicar f1 por x1 en xmm0

    ; Convertir el resultado a entero
    cvttss2si eax, xmm0 

    ; Almacenar el resultado en la dirección de memoria apuntada por destination
    mov [rdi], eax    

    pop rbp
    ret

