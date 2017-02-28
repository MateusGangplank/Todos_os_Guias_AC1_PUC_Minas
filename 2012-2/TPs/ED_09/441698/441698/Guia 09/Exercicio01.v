// -------------------------
// Nome: Marcio Enio Gonçalves Dutra Junior
// Matricula: 441698
// -------------------------

`include "flipflop.v"
 
// -----------------------------------------------------------
// --  Asynchronous Counter (DOWN)
// -----------------------------------------------------------
module asynchronousCounter (output[4:0] s, input a, input pulse, input preset, input clear);
	wire w;
	
	jkff j1(w, s[0], a, a, pulse, preset, clear);
	jkff j2(w, s[1], a, a, s[0], preset, clear);
	jkff j3(w, s[2], a, a, s[1], preset, clear);
	jkff j4(w, s[3], a, a, s[2], preset, clear);
	jkff j5(w, s[4], a, a, s[3], preset, clear);

endmodule //asynchronousCounter

// -------------------------
// -- Teste
// -------------------------
module teste;
	wire [4:0] saida;
	reg pulse; 
	reg a, preset, clear; 
	
	asynchronousCounter AC1 (saida, a, pulse, preset, clear);
	
	initial begin
		$display("A  PULSE  SAIDA   DECIMAL");
		a = 0;
		#1 preset = 1;
		#1 preset = 0;
		#1 a = 1;
		#1 pulse = 0;
		#1 pulse = 1;
		$monitor("%1b    %1b    %4b    %2d", a, pulse, saida, saida);
		#1 pulse = 0;
		#6 pulse = 1;
		#1 pulse = 0;
		#10 pulse = 1;
		#4 pulse = 0;
		#2 pulse = 1;
		#5 pulse = 0;
		#17 pulse = 1;
		#16 pulse = 0;
		#12 pulse = 1;
		#1 $finish;
	end
endmodule //teste