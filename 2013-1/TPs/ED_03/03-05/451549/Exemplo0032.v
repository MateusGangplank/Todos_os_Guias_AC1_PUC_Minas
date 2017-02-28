// ------------------------- 
// Exemplo0032 - F4 
// Nome: Débora Deslandes de Almeida 
// Matricula: 451549 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module multiplexador (s,a,b,chave);
	
	output s;
	wire temp1;
	wire temp2;
	wire temp3;
	wire temp4;
	
	input a;
	input b;	 
	input chave;
	
	assign temp1 = a&b;
	assign temp2 = a|b;
	assign temp3 = temp1 & chave;
	assign temp4 = temp2 & ~chave;
	assign s = temp3|temp4;
endmodule
	
// -------------------------
// test module multiplexador
// -------------------------

module testmultiplexador;
	reg a;
	reg b;
	reg chave;
	
	wire s;
	
	multiplexador banana (s,a,b,chave);
	
	initial begin: main
		$display ("Exemplo 0032 - Débora  Deslandes de Almeida Batista");
		$display ("Matricula : 451549");
		$display ("Test LU's module ");
		$display ("\n  a	  b	chave	  s");
		a = 0;
		b = 0;
		chave = 0;
		
		//testes
		$monitor("%3b\t%3b\t%3b\t%3b",a,b,chave,s);
			#1 a = 0; b = 1;chave = 0;
			#1 a = 1; b = 1;chave = 0;
			#1 a = 1; b = 0;chave = 0;
			#1 a = 0; b = 0;chave = 1;
			#1 a = 0; b = 1;chave = 1;
			#1 a = 1; b = 1;chave = 1;
			#1 a = 1; b = 0;chave = 1;
 
	end
endmodule
		