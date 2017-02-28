// ---------------------------------------
// Exemplo0036 - Selecion�vel
// Nome: Jo�o Henrique Mendes de Oliveira
// Matricula: 392734
// ---------------------------------------
// -------------------------
// sel_gate
// -------------------------

module sel (output saida, input [3:0] entrada01, input [3:0] entrada02,input c);
	
	wire [3:0] saida_XNOR;
	wire saida_and;
	
	//---XNOR
	xnor XNOR1 (saida_XNOR[0], entrada01[0], entrada02[0]);
	xnor XNOR2 (saida_XNOR[1], entrada01[1], entrada02[1]);
	xnor XNOR3 (saida_XNOR[2], entrada01[2], entrada02[2]);
	xnor XNOR4 (saida_XNOR[3], entrada01[3], entrada02[3]);
	//---AND	
	and AND1 (saida_and, saida_XNOR[0], saida_XNOR[1], saida_XNOR[2], saida_XNOR[3]);
	//---XOR	
	xor XOR5 (saida, c, saida_and);
endmodule //--sel

// ------------------------- 
// -- test sel
// -------------------------
module test_sel; 

	reg [3:0] x; 
	reg [3:0] y; 
	reg c;
	wire z; 
	sel modulo (z, x, y, c); 
	 
	initial begin:main
		$display("Exemplo0036 - Jo�o Henrique - 392734");
		$display("Test LU's module"); 
		x = 4'b0011; y = 4'b0101; c = 0;
		#1 $monitor("%3b %3b Option: %1b = %3b", x, y, c, z); 
		#1 c = 1;
		#1 x = 4'b1010; y = 4'b1101; c = 0;
		#1 x = 4'b1010; y = 4'b1101; c = 1;
		#1 x = 4'b1111; y = 4'b1111; c = 0;
		#1 x = 4'b1111; y = 4'b1111; c = 1;
		#1 x = 4'b0000; y = 4'b1000; c = 0;
		#1 x = 4'b0010; y = 4'b0001; c = 1;
		#1 x = 4'b1010; y = 4'b0101; c = 0;
		#1 x = 4'b1010; y = 4'b0101; c = 1;
	end //--main
endmodule //--test_sel