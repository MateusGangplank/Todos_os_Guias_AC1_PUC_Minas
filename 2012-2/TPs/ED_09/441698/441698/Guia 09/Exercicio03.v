// -------------------------
// Nome: Marcio Enio Gonçalves Dutra Junior
// Matricula: 441698
// -------------------------

`include "flipflop.v"
 
// -----------------------------------------------------------
// --  Decade Counter (UP)
// -----------------------------------------------------------
module decadeCounter (output[5:0] s, input a, input pulse, input preset, input clear);
	wire[5:0] snot;
	wire w1,w2;
	
	nand nand1(w1,snot[0],s[1],snot[2],s[3],snot[4],snot[5]);
	nand nand2(w2,clear,w1);
	
	jkff j1(s[5], snot[5], a, a, snot[4], preset, w2);
	jkff j2(s[4], snot[4], a, a, snot[3], preset, w2);
	jkff j3(s[3], snot[3], a, a, snot[2], preset, w2);
	jkff j4(s[2], snot[2], a, a, snot[1], preset, w2);
	jkff j5(s[1], snot[1], a, a, snot[0], preset, w2);
	jkff j6(s[0], snot[0], a, a, pulse, preset, w2);

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
		#1 pulse = 0;
		#1 pulse = 1;
		$monitor("%1b    %1b    %4b    %2d", a, pulse, saida, saida);
		#100 $finish;
	end
endmodule //teste