// -------------------------
// Nome: Marcio Enio Gonçalves Dutra Junior
// Matricula: 441698
// -------------------------

`include "flipflop.v"
 
// -----------------------------------------------------------
// --  Counter Base 10
// -----------------------------------------------------------
module counterBase10 (output[3:0] s, input pulse, input clear);
	wire[3:0]snot;
	wire w1,w2;
	
	and and1(w1,snot[0],s[1],snot[2],s[3]);
	or or1(w2,w1,clear);
	
	tff t4(s[0],snot[0],pulse,pulse,0,w2);
	tff t3(s[1],snot[1],snot[0],snot[0],0,w2);
	tff t2(s[2],snot[2],snot[1],snot[1],0,w2);
	tff t1(s[3],snot[3],snot[2],snot[2],0,w2);

endmodule //counterBase10

// -------------------------
// -- Teste
// -------------------------
module teste;
	wire[3:0] saida;
	reg pulse; 
	reg clear; 
	
	counterBase10 CB10 (saida,pulse,clear);
	
	always 
		begin 
			#1 pulse = 0;
			#1 pulse = 1; 
		end
			
	initial begin
		$display("PULSE  SAIDA   DECIMAL");
		clear = 0;
		#1 clear = 1;
		#1 clear = 0;
		$monitor("%1b    %6b    %3d", pulse, saida, saida);
		#100 $finish;
	end
endmodule //teste