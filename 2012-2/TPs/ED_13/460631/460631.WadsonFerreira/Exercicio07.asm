CARREGAR:
MVI A,B5          ; DEFINE DADO 01
STA 0090    
MVI A,FF          ; DEFINE DADO 02
STA 0091

DIVISAO:
LDA 0091       ; CARREGA DADO 02
STC                ; FAZ CARRY 1
CMC               ; FAZ CARRY 0
RAR                ; DESLOCA PARA DIREITA
MOV B,A        ; SALVA O RESULTADO EM B

MODULO:
LDA 0090     ; CARREGA DADO 01
MOV D,A      ; FAZ UMA COPIA EM D
STC             ; CARRY 1
CMC            ; CARRY 0
RAR             ; ROTACIONA PARA DIREITA
STC            ; CARRY 1
CMC           ; CARRY 0
RAL            ; ROTACIONA PARA ESQUERDA
MOV C,A     ; SALVA EM C
MOV A,D    ; CARREGA A COPIA
SUB C        ; SUBTRAI O QUOCIENTE
ADD B        ; ADICONA O RESULTADO DA DIVISAO
STA 0092   ; ARMAZENA O RESULTADO FINAL
HLT
