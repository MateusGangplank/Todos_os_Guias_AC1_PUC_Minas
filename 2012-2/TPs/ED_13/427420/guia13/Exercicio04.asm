//Jenifer Henrique Moreira Borges
//427420  

//Exercicio04

                             LHLD C050 
	XCHG
                             LHLD C052                           
                             
                             LXI B,0000                            
                             
                             MOV A,L
                             CMA
                             MOV L,A
                             MOV A,H
                             CMA
                             MOV H,A
                             INX H
                             DAD D
                             JNC AHEAD
                             
                             
                             INX B
	AHEAD : 
                             XCHG
                             LHLD C054
                             
                             
                             DAD D
                             SHLD C056
                             
                             
                             HLT
