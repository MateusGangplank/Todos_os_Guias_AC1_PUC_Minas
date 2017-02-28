// -- Exemplo0034 ---------------------
// -- Ana Carolina Coceição de Jesus --
// -- Matricula 449517 ----------------

module LU (output s, input a, input [1:0]chave);

	wire s0,s1,s2,s3;
	wire tmp0,tmp1,tmp2,temp3;
	wire notchave0,notchave1;
	xnor XNOR1 (s0,a);
	xor XOR1(s1,a);
	nor NOR1(s2,a);
	or OR1 (s3,a);
	not NOT1 (notchave0,chave[0]);
	not NOT2 (notchave1,chave[1]);
	and AND1 (tmp0,notchave0,notchave1,s0);
	and AND2 (tmp1,notchave0,chave[0],s1);
	and AND3 (tmp2,chave[0],notchave1,s2);
	and AND4 (tmp3,chave[0],chave[1],s3);
	or OR2 (s,tmp0,tmp1,tmp2,tmp3);

endmodule

module teste;

	wire s;
	reg a;
	reg [1:0]chave;
	LU teste(s,a,chave);	
	
	initial begin : main
	
		$display("Exemplo 0034 - Ana Carolina - 449517");
		$display ("\nULA test");
		
		a = 0;
		chave[0] = 0; chave[1] = 0;
		
		$display("chave 00 - XNOR , chave 01 - XOR , chave 10 - NOR , chave 11 - OR");
		#1 $monitor(" entrada = %b saida = %b chave = %b",a,s,chave);
		
		#1 a = 1;
		#1 chave[0] = 0; chave[1] = 1;
		#1 a = 0;
		#1 chave[0] = 1; chave[1] = 0;
		#1 a = 1;
		#1 chave[0] = 1; chave[1] = 1;
		#1 a = 0;

 end 

 endmodule