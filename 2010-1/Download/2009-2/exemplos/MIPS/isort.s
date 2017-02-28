; InsertionSort su un vettore di interi
; rimpiazza il vettore in memoria con il vettore ordinato
;
; by Salvo Scellato

	.data
vet:	.word 14,8,12,4,7,13,5,11,9,1,2,6,15,3,10
len:	.word 15

	.text
	DADDI R1, R0, 8		;indice j = 1 (*8)
	LD R2, len(R0)		; R2 = len 
	DSLL R2, R2, 3		; R2 = R2 * 8 
for:	LD R3, vet(R1)		; R3 = vet[R1] = vet[j]
	DADDI R4, R1, -8	; R4 = R1 -8 (i = j-1)
while:	SLTI R5, R4, 0		; R5 =(R4 < 0) (cioè i <= 0)
	BNE R5,R0, endw		; if R5 != 0 goto endw (perchè i < 0)
	LD R6, vet(R4)		; R6 = vet[R4] = vet[i]
	SLT R7, R3, R6		; R7 = (R3 < R6) = (vet[j] < vet[i])
	BEQ R7,R0, endw		; if R7 == 0 goto endw
	DADDI R4, R4, 8		; R4 += 8 ( i++)
	SD R6, vet(R4)		;vet[R4] = vet[i] = R6 (ma i è stato incrementato)
	DADDI R4, R4, -16	;R4 = R4 - 16 ( i -= 2)
	J while			; goto while
endw:	DADDI R4, R4, 8		; R4 += 8 ( dobbiamo accedere al i+1-esimo elemento... 
	SD R3, vet(R4)		;vet[R4] = vet[i] = R3 = vet[j]
	DADDI R4, R4, -8	; ...resettiamo i
	DADDI R1, R1, 8		;indice j++
	BEQ R1, R2, end		;il ciclo è finito?
	J for			;un'altro ciclo
end:	HALT


	
