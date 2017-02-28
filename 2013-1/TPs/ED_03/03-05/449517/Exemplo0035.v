// -- Exercicio0035 ---------------------
// -- Ana Carolina Conceição de Jesus ---
// -- Matricula 449517 ------------------

module LU (output s, input a, input [0:2]chave);

	wire s0,s1,s2,s3,s4,s5,s6;
	wire tmp0,tmp1,tmp2,tmp3,tmp4,tmp5,tmp6;
	wire notchave0,notchave1,notchave2;
	not NOT1 (s0,a);
	or OR1 (s1,a);
	nor NOR1 (s2,a);
	and AND1 (s3,a);
	nand NAND1 (s4,a);
	xor XOR1 (s5,a);
	xnor XNOR1 (s6,a);
	not NOT2 (notchave0,chave[0]);
	not NOT3 (notchave1,chave[1]);
	not NOT4 (notchave2,chave[2]);
	and AND2 (tmp0,s0,chave[0],chave[1],chave[2]);
	and AND3 (tmp1,s1,chave[0],chave[1],notchave2);
	and AND4 (tmp2,s2,chave[0],chave[1],chave[2]);
	
	and AND5 (tmp3,s3,notchave0,chave[1],chave[2]);
	and AND6 (tmp4,s4,notchave0,chave[1],notchave2);
	and AND7 (tmp5,s5,notchave0,notchave1,chave[2]);
	and AND8 (tmp6,s6,notchave0,notchave1,notchave2);
	
	or OR2 (s,tmp0,tmp1,tmp2,tmp3,tmp4,tmp5,tmp6);
	
endmodule

module teste;

     wire s;
     reg a;
     reg [0:2] chave;
		
     LU teste(s,a,chave);
		
		
   initial begin: main
		
        $display("Exemplo0035 - Ana Carolina - 449517");
        $display("\nULA test");
			
              chave[0] = 0; chave[1] = 0; chave[2] = 0;
		 a = 0;

         $display("\nchave 000 - XNOR , chave 001 - XOR , chave 010 - NAND , chave 011 - AND");
         $display("chave 100 - NOR , chave 101 - Não faz nenhuma operação , chave 110 - OR , chave 111 - NOT");
         $display("\n");

         #1 $monitor("entrada = %b  saida = %b  chave = %b",a,s,chave);
   #1 a = 1;
   #1 chave[0] = 0; chave[1] = 0; chave[2] = 1;
   #1 a = 0;
   #1 chave[0] = 0; chave[1] = 1; chave[2] = 0;
   #1 a = 1;
   #1 chave[0] = 0; chave[1] = 1; chave[2] = 1;
   #1 a = 0;
   #1 chave[0] = 1; chave[1] = 0; chave[2] = 0;
   #1 a =1;
   #1 chave[0] = 1; chave[1] = 0; chave[2]= 1;
   #1 a = 0;
   #1 chave[0] = 1; chave[1] = 1; chave[2] = 0;
   #1 a = 1;
   #1 chave[0] = 1; chave[1] = 1; chave[2] = 1;
   #1 a = 0;
end 

endmodule