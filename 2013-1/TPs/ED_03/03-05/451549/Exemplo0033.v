// ------------------------- 
// Exemplo0033 - NAND NOR 
// Nome: Débora Deslandes de Almeida 
// Matricula: 451549 
// ------------------------- 
// ------------------------- 
// mult2_gate 
// ------------------------- 
module mult2 (s1,s2,a,b,chave);
	
	output s1;
	output s2;
	wire temp1;
	wire temp2;
	wire temp3;
	wire temp4;
	wire temp5;
	wire temp6;
	wire temp7;
	wire temp8;
	
	input a;
	input b;	 
	input chave;
	
	assign temp1 = a&b;
	assign temp2 = a|b;
	assign temp3 = temp1 & ~chave;
	assign temp4 = temp2 & ~chave;
	assign temp5 = ~(a&b);
	assign temp6 = ~(a|b);
	assign temp7 = temp5 & chave;
	assign temp8 = temp6 & chave;
	assign s1 = temp7 | temp4;
	assign s2 = temp3 | temp8;
endmodule
	
// -------------------------
// test module multiplexador
// -------------------------

module testmultiplexador;
	reg a;
	reg b;
	reg chave;
	
	wire s1;
	wire s2;
	
	mult2 banana (s1,s2,a,b,chave);
	
	initial begin: main
		$display ("Exemplo 0033 - Débora  Deslandes de Almeida Batista");
		$display ("Matricula : 451549");
		$display ("Test LU's module ");
		$display ("\n  a	  b	chave	  s1	s2");
		a = 0;
		b = 0;
		chave = 0;
		
		//testes
		$monitor("%3b\t%3b\t%3b\t%3b\t%3b",a,b,chave,s1,s2);
			#1 a = 0; b = 1;chave = 0;
			#1 a = 1; b = 0;chave = 0;
			#1 a = 1; b = 1;chave = 0;
			#1 a = 0; b = 0;chave = 1;
			#1 a = 0; b = 1;chave = 1;
			#1 a = 1; b = 0;chave = 1;
			#1 a = 1; b = 1;chave = 1;
 
	end
endmodule
		