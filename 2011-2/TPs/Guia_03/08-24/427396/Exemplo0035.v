// -------------------------
// Exemplo0035 - F4
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
	assign s = ( (~a & b) | (a & ~b) );
endmodule // XOR_GATE

//-------------------------
// AND_GATE
//-------------------------
module and_gate (output s, input a, input b);
	assign s = (a & b);
endmodule // AND_GATE

//-------------------------
// NOR_GATE
//-------------------------
module nor_gate (output s, input a, input b);
	assign s = ~(a | b);
endmodule // NOR_GATE

//-------------------------
// XNOR_GATE
//-------------------------
module xnor_gate (output s, input a, input b);
	assign s = ~( (~a & b) | (a & ~b) );
endmodule // XNOR_GATE

//-------------------------
// NAND_GATE
//-------------------------
module nand_gate (output s, input a, input b);
	assign s = ~(a & b);
endmodule // NAND_GATE

// ------------------------- definir dados
module test_f4;
   reg  [3:0] x;
	reg  [3:0] y;
	
	wire [3:0] saida_xor;
	wire [3:0] saida_or;
	wire [3:0] saida_and;
	
	wire [3:0] saida_xnor;
	wire [3:0] saida_nor;
	wire [3:0] saida_nand;
	
	// Descricao do circutio principal
		//Resultado da XOR bit a bit
	   xor_gate xor_0 (saida_xor[0], x[0], y[0]);
		xor_gate xor_1 (saida_xor[1], x[1], y[1]);
		xor_gate xor_2 (saida_xor[2], x[2], y[2]);
		xor_gate xor_3 (saida_xor[3], x[3], y[3]);
		
		//Resultado da OR bit a bit
	   or_gate or_0 (saida_or[0], x[0], y[0]);
		or_gate or_1 (saida_or[1], x[1], y[1]);
		or_gate or_2 (saida_or[2], x[2], y[2]);
		or_gate or_3 (saida_or[3], x[3], y[3]);
		
		//Resultado da AND bit a bit
	   and_gate and_0 (saida_and[0], x[0], y[0]);
		and_gate and_1 (saida_and[1], x[1], y[1]);
		and_gate and_2 (saida_and[2], x[2], y[2]);
		and_gate and_3 (saida_and[3], x[3], y[3]);

		//Resultado da XNOR bit a bit
	   xnor_gate xnor_0 (saida_xnor[0], x[0], y[0]);
		xnor_gate xnor_1 (saida_xnor[1], x[1], y[1]);
		xnor_gate xnor_2 (saida_xnor[2], x[2], y[2]);
		xnor_gate xnor_3 (saida_xnor[3], x[3], y[3]);
		
		//Resultado da NOR bit a bit
	   nor_gate nor_0 (saida_nor[0], x[0], y[0]);
		nor_gate nor_1 (saida_nor[1], x[1], y[1]);
		nor_gate nor_2 (saida_nor[2], x[2], y[2]);
		nor_gate nor_3 (saida_nor[3], x[3], y[3]);
		
		//Resultado da NAND bit a bit
	   nand_gate nand_0 (saida_nand[0], x[0], y[0]);
		nand_gate nand_1 (saida_nand[1], x[1], y[1]);
		nand_gate nand_2 (saida_nand[2], x[2], y[2]);
		nand_gate nand_3 (saida_nand[3], x[3], y[3]);
// ------------------------- parte principal
   initial begin
		//Descricao
      $display("Exemplo0035 - Eduardo Manoel - 427396");
      $display("Test LU's module");
		#1 x = 4'b0000; y = 4'b0011;
		
		$monitor("RESULTADOS X = %4b Y= %4b\n AND -> %4b\t NAND -> %4b\n OR -> %4b\t XOR -> %4b\n XOR -> %4b\t XNOR -> %4b\n", x, y, saida_and[3:0], saida_nand[3:0], saida_or[3:0], saida_nor[3:0], saida_xor[3:0], saida_xnor[3:0]);
		
		#1 x = 4'b1010; y = 4'b0101;
		#1 x = 4'b1100; y = 4'b0011;
		#1 x = 4'b1001; y = 4'b1011;

		
end
endmodule // test_f4

// OBS.: PODE DEIXAR SO' OS ARQUIVOS COM EXTENSAO .v

