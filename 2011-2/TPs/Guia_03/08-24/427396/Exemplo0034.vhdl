// -------------------------
// Exemplo0034 - F4
// Nome: Eduardo Manoel
// Matricula: 427396
// -------------------------

//-------------------------
// CHOICE
//-------------------------
module choice (output s, input a, input b, input key);
	assign s = ( (a & key) | ( b & ~key) );
endmodule // OR_GATE


//-------------------------
// OR_GATE
//-------------------------
module or_gate (output s, input a, input b);
	assign s = (a | b);
endmodule // OR_GATE

//-------------------------
// XOR_GATE
//-------------------------
module xor_gate (output s, input a, input b);
	assign s = ( (~a*b) + (a*~b) );
endmodule // XOR_GATE

// ------------------------- definir dados
module test_f4;
   reg  [3:0] x;
	reg  [3:0] y;
	reg  [0:0] key;
	
	wire [3:0] saida_xor;
	wire [3:0] saida_or;
	wire [7:0] resultado;
	
	// Descricao do circutio principal
		//Resultado da AND bit a bit
	   xor_gate xor_0 (saida_xor[0], x[0], y[0]);
		xor_gate xor_1 (saida_xor[1], x[1], y[1]);
		xor_gate xor_2 (saida_xor[2], x[2], y[2]);
		xor_gate xor_3 (saida_xor[3], x[3], y[3]);
	
		//Resultado da OR bit a bit
	   or_gate or_0 (saida_or[0], x[0], y[0]);
		or_gate or_1 (saida_or[1], x[1], y[1]);
		or_gate or_2 (saida_or[2], x[2], y[2]);
		or_gate or_3 (saida_or[3], x[3], y[3]);
	
		//Definicao do resultado de acordo com a key
		choice resultado_0 (resultado[0], saida_xor[0], saida_or[0], key);
		choice resultado_1 (resultado[1], saida_xor[1], saida_or[1], key);
		choice resultado_2 (resultado[2], saida_xor[2], saida_or[2], key);
		choice resultado_3 (resultado[3], saida_xor[3], saida_or[3], key);
		
		choice resultado_4 (resultado[4], ~saida_xor[0], ~saida_or[0], key);
		choice resultado_5 (resultado[5], ~saida_xor[1], ~saida_or[1], key);
		choice resultado_6 (resultado[6], ~saida_xor[2], ~saida_or[2], key);
		choice resultado_7 (resultado[7], ~saida_xor[3], ~saida_or[3], key);
// ------------------------- parte principal
   initial begin
		//Descricao
      $display("Exemplo0034 - Eduardo Manoel - 427396");
      $display("Test LU's module");
		$display("KEY = 0 -> OR/NOR\nKEY = 1 -> XOR/XNOR\n");
		//Testes
		#1 x = 4'b0101; y = 4'b1010; key = 0;
		$monitor("Resultado KEY = %1b\n X -> %4b \t Y-> %4b \n Resultado da porta normal-> %4b \t Resultado da porta negada: %4b\n", key, x, y, resultado[3:0], resultado[7:4]);
		#2 x = 4'b0101; y = 4'b1010; key = 1;
		
		#3 x = 4'b1111; y = 4'b0000; key = 0;
		#4 x = 4'b1111; y = 4'b0000; key = 1;
		
		#5 x = 4'b1001; y = 4'b1000; key = 0;
		#6 x = 4'b1001; y = 4'b1000; key = 1;
		
		#7 x = 4'b1111; y = 4'b1111; key = 0;
		#8 x = 4'b1111; y = 4'b1111; key = 1;
end
endmodule // test_f4