// ------------------------- 
// Exemplo0034 - NAND NOR 
// Nome: Débora Deslandes de Almeida 
// Matricula: 451549 
// ------------------------- 
// ------------------------- 
// mult3_gate 
// ------------------------- 
module mult3 (s,a,b,chave1,chave2);
	
	output s;
	wire temp1;
	wire temp2;
	wire temp3;
	wire temp4;
	wire temp5;
	wire temp6;
	wire temp7;
	wire temp8;
	wire temp9;
	wire temp10;
	wire temp11;
	wire temp12;
	
	input a;
	input b;	 
	input chave1;
	input chave2;
	
	assign temp1 = (~(a^b));
	assign temp2 = a^b;
	assign temp3 = (~(a|b));
	assign temp4 = a|b;
	assign temp5 = temp1 & chave1;
	assign temp6 = temp3 & ~chave1;
	assign temp7 = temp2 & chave1;
	assign temp8 = temp4 & ~chave1;
	assign temp9 = temp5 | temp6;
	assign temp10 = temp7 | temp8;
	assign temp11 = temp9 & chave2;
	assign temp12 = temp10 | ~chave2;
	assign s = temp11 | temp12;
endmodule
	
// -------------------------
// test module multiplexador
// -------------------------

module testmult3;
	reg a;
	reg b;
	reg chave1;
	reg chave2;
	
	wire s;
	
	mult3 banana (s,a,b,chave1,chave2);
	
	initial begin: main
		$display ("Exemplo 0034 - Débora  Deslandes de Almeida Batista");
		$display ("Matricula : 451549");
		$display ("Test LU's module ");
		$display ("\n  a	  b	chave1	 chave2	  s");
		a = 0; b = 0; chave1 = 0; chave2 = 0;
		//testes
		$monitor("%3b\t%3b\t%3b\t%3b\t%3b",a,b,chave1,chave2,s);
			//#1 a = 0; b = 0; chave1 = 0; chave2 = 0;
			#1 a = 0; b = 1; chave1 = 0; chave2 = 0;
			#1 a = 1; b = 0; chave1 = 0; chave2 = 0;
			#1 a = 1; b = 1; chave1 = 0; chave2 = 0;
			#1 a = 0; b = 0; chave1 = 1; chave2 = 0;
			#1 a = 0; b = 1; chave1 = 1; chave2 = 0;
			#1 a = 1; b = 0; chave1 = 1; chave2 = 0;
			#1 a = 1; b = 1; chave1 = 1; chave2 = 0;
			#1 a = 0; b = 0; chave1 = 0; chave2 = 1;
			#1 a = 0; b = 1; chave1 = 0; chave2 = 1;
			#1 a = 1; b = 0; chave1 = 0; chave2 = 1;
			#1 a = 1; b = 1; chave1 = 0; chave2 = 1;
			#1 a = 0; b = 0; chave1 = 1; chave2 = 1;
			#1 a = 0; b = 1; chave1 = 1; chave2 = 1;
			#1 a = 1; b = 0; chave1 = 1; chave2 = 1;
			#1 a = 1; b = 1; chave1 = 1; chave2 = 1; 
	end
endmodule
		