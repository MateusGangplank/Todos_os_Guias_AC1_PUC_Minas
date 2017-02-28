// -------------------------
// Nome: Marcio Enio Gonçalves Dutra Junior
// Matricula: 441698
// -------------------------

`include "flipflop.v"
 
// -----------------------------------------------------------
// --  Decade Counter (DOWN)
// -----------------------------------------------------------
module decadeCounter (output[5:0] s, input a, input pulse, input preset, input clear);
	wire[5:0] snot;
	wire w1,w2,w3;
	
	not not1(w1,a);
	and and1(w2,s[0],snot[1],s[2],snot[3],s[4],s[5]);
	or or1(w3,w1,w2);
	
	jkff j1(s[5], snot[5], a, a, s[4], w3, clear);
	jkff j2(s[4], snot[4], a, a, s[3], w3, clear);
	jkff j3(s[3], snot[3], a, a, s[2], w3, clear);
	jkff j4(s[2], snot[2], a, a, s[1], w3, clear);
	jkff j5(s[1], snot[1], a, a, s[0], w3, clear);
	jkff j6(s[0], snot[0], a, a, pulse, w3, clear);

endmodule //decadeCounter

// -------------------------
// -- Teste
// -------------------------
module teste;
	wire [5:0] saida;
	reg pulse; 
	reg a, preset, clear; 
	
	decadeCounter DC1 (saida, a, pulse, preset, clear);
	
	always 
		begin 
			#1 pulse = 0;
			#1 pulse = 1; 
		end
			
	initial begin
		$display("A  PULSE  SAIDA   DECIMAL");
		a = 0;
		#1 preset = 1;
		#1 preset = 0;
		#1 a = 1;
		$monitor("%1b    %1b    %4b    %2d", a, pulse, saida, saida);
		#100 $finish;
	end
endmodule //teste