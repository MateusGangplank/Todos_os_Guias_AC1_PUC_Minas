;Dati due vettori identificare nel primo tutti i quadrati perfetti e porre
;le rispettive radici quadrate nel secondo vettore, eliminando da quest'ultimo
;eventuali duplicati.

; //Implementazione C
; int v1[] = { 5, 16, 15, 25, 16, 4, 3};
; const int LEN = 7;
; int v2[LEN];
; int i = 0, j = 0;
; for(i = 0; i < LEN; i++){
;	int q = radice(vet[i]);
;	if ( q > 0){
;		for(int k = 0; k < j; k++)
;			if(vet2[k] == q)
;				found = true; 	
;		if( !found ){
;			vet2[j] = q;
;			j++;
;		}
;	}
; }
;
; int prodotto(int a, int b){
;	int r = 0
;	while(b > 1){
;		r = r+a;
;		b = b-1;
;	}
;	return r;
; }
;
; int radice(int x){
;	int r = 0;
;	int n = prodotto(r,r);
;	while( n < x){
;		r++;
;		n = prodotto(r,r);
;	}
;	if ( n == x)
;		return r;
;	else
;		return 0;
; }
;
; by Salvo Scellato

	.data
vet:	.word  5, 16, 15, 36, 36, 36, 25, 16, 4, 3, 81, 83, 100, 1
len: 	.word 0
vet2: 	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0

	.text
	DADDI R1, R0, vet 	;indirizzo iniziale vet	
	DADDI R2, R0, len	;indirizzo finale di vet
	DSUB R7, R2, R1		; R7 = len-vet (lunghezza del vettore)
	DADDI R1, R0, 0		;primo indice i
	DADDI R2, R0, 0		;secondo indice j
for:	BEQ R1, R7,  endfor	;se i == LEN, fine del for
	LD R19, vet(R1)		;R19 = vet[i]
	JAL sqrt		; vuole il parametro in R19 e ritorna in R20
	BEQZ R20, nosqrt	; il numero non è quadrato perfetto
	DADDI R3, R0, 0		;terzo indice k = 0
	DADDI R11, R0, 0	; azzeriamo il flag
	BEQZ R2, first		; è il primo elemento
scorri: BEQ R3, R2, endscr	; j == k, non scorriamo più
	LD R9, vet2(R3)		; R9 = vet2[k]
	BNE R9, R20, noteq	;vet[k] != radice goto noteq
	DADDI R11, R0,  1	; flag found = true 
noteq:  DADDI R3, R3, 8		; k++
	J scorri		;in testa al for
endscr:	BNEZ R11, nosqrt	; il numero non è da inserire
first:	SD R20, vet2(R2)	; inserito nel secondo vettore	
	DADDI R2, R2, 8		;incremento j++
nosqrt:	DADDI R1, R1, 8		;incremento indice i
	J for			; ritorniamo in testa al for
endfor: HALT
	

;questa funzione vuole i suoi parametri in R28 e in R29, ritorna R30=R28*R29
prod:		DADDI R21, R0, 1	;ci serve il numero 1 in un registro
		DADD R30, R28, R0	; R30 = a
		BEQZ R29, zero		;moltiplicazione per zero
prodw:		BEQ R29, R21, endprodw	;se R29 == 1, fine del while
		DADD R30, R30, R28	; R30 += R28
		DADDI R29, R29, -1	; R29--
		J prodw			;risaliamo alla testa del while
endprodw:	JR R31			; ritorna il controllo
zero:		DADDI R30, R0, 0	; ritorna zero	
		JR R31			;ritorna il controllo

;questa funzione vuole il suo parametro in R19 e ritorna in R20 la radice 
;del numero oppure zero se non è quadrato perfetto
;siccome questa funzione chiama la funzione prodotto, dobbiamo salvarci il PC proveniente
;dalla chiamata del main (che è nel registro R31) e ripristinarlo all'uscita

sqrt:	DADD R15, R31, R0	; R15 = R31
	DADD R20, R0, R0	; R20 = 0 (valore di ritorno)
	DADD R28, R20, R0	; primo parametro per prodotto 
	DADD R29, R20, R0	; secondo parametro per prodotto 
	jal prod		;chiamata prodotto, risultato in R30	
sqrtw: 	SLT R25, R30, R19	; R25 = R30 < R19 (ovvero prodotto < x)
	BEQZ R25,check 		; se R30 >= R19, fine del while
	DADDI R20, R20, 1	;incrementiamo r
	DADD R28, R20, R0	; primo parametro per prodotto 
	DADD R29, R20, R0	; secondo parametro per prodotto 
	jal prod		; chiamata a prodotto
	j sqrtw			; ritorno in testa al while
check:	BEQ R30, R19, found	; se R30 == R19, allora abbiamo trovato la radice
	J nofound		;altrimenti non abbiamo trovato la radice 
found:	DADD R31, R15, R0	;ripristiniamo il registro R31 di salto
	JR R31			;ritorniamo il controllo, il risultato è in R20
nofound: DADD R20, R0, R0	;non trovato, risultato nullo in R20
	DADD R31, R15, R0	;ripristiniamo il registro R31 di salto
	JR R15			;ritorniamo il controllo
	
