// ------------------------- 
// Exemplo0035 - NAND NOR 
// Nome: Débora Deslandes de Almeida 
// Matricula: 451549 
// ------------------------- 
// ------------------------- 
// mult3_gate 
// ------------------------- 
module mult3 (s,a,b,chave1,chave2,chave3);
	input a;
	input b;
	input chave1;
	input chave2;
	input chave3;
	
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
	wire temp13;
	wire temp14;
	wire temp15;
	wire temp16;
	wire temp17;
	wire temp18;
	wire temp19;
	wire temp20;
	wire temp21;
	wire temp22;
	wire temp23;
	
	assign temp1 = a|b;
	assign temp2 = (~(a|b));
	assign temp3 = a&b;
	assign temp4 = (~(a&b));
	assign temp5 = a^b;
	assign temp6 = (~(a^b));
	assign temp7 = temp1 & chave1;
	assign temp8 = temp2 & ~chave1;
	assign temp9 = temp3 & chave1;
	assign temp10 = temp4 & ~chave1;
	assign temp11 = temp5 & chave1;
	assign temp12 = temp6 & ~chave1;
	assign temp13 = temp7|temp8;
	assign temp14 = temp9|temp10;
	assign temp15 = temp11|temp12;
	assign temp16 = temp13 & chave2; 
	assign temp17 = temp14 & ~chave2;
	assign temp18 = ~b & chave2;
	assign temp19 = temp15 & ~chave2;
	assign temp20 = temp16|temp17;
	assign temp21 = temp18|temp19;
	assign temp22 = temp20 & chave3;
	assign temp23 = temp21 & ~chave3;
	assign s = temp22 |temp23;
endmodule
	
// -------------------------
// test module multiplexador
// -------------------------

module testmult3;
	reg a;
	reg b;
	reg chave1;
	reg chave2;
	reg chave3;
	
	wire s;
	
	mult3 banana (s,a,b,chave1,chave2,chave3);
	
	initial begin: main
		$display ("Exemplo 0035 - Débora  Deslandes de Almeida Batista");
		$display ("Matricula : 451549");
		$display ("Test LU's module ");
		$display ("\n  a	  b	chave1	 chave2	chave3	  s");
		a = 0; b = 0; chave1 = 0; chave2 = 0;chave3 = 0;
		//testes
		$monitor("%3b\t%3b\t%3b\t%3b\t%3b\t%3b",a,b,chave1,chave2,chave3,s);
		 //#1 a = 0; b = 0; chave1 = 0; chave2 = 0;chave3 = 0;
			#1 a = 0; b = 1; chave1 = 0; chave2 = 0;chave3 = 0;
			#1 a = 1; b = 0; chave1 = 0; chave2 = 0;chave3 = 0;
			#1 a = 1; b = 1; chave1 = 0; chave2 = 0;chave3 = 0;
			#1 a = 0; b = 0; chave1 = 1; chave2 = 0;chave3 = 0;
			#1 a = 0; b = 1; chave1 = 1; chave2 = 0;chave3 = 0;
			#1 a = 1; b = 0; chave1 = 1; chave2 = 0;chave3 = 0;
			#1 a = 1; b = 1; chave1 = 1; chave2 = 0;chave3 = 0;
			#1 a = 0; b = 0; chave1 = 0; chave2 = 1;chave3 = 0;
			#1 a = 0; b = 1; chave1 = 0; chave2 = 1;chave3 = 0;
			#1 a = 1; b = 0; chave1 = 0; chave2 = 1;chave3 = 0;
			#1 a = 1; b = 1; chave1 = 0; chave2 = 1;chave3 = 0;
			#1 a = 0; b = 0; chave1 = 1; chave2 = 1;chave3 = 0;
			#1 a = 0; b = 1; chave1 = 1; chave2 = 1;chave3 = 0;
			#1 a = 1; b = 0; chave1 = 1; chave2 = 1;chave3 = 0;
			#1 a = 1; b = 1; chave1 = 1; chave2 = 1;chave3 = 0;
		   #1 a = 0; b = 0; chave1 = 0; chave2 = 0;chave3 = 1;
			#1 a = 0; b = 1; chave1 = 0; chave2 = 0;chave3 = 1;
			#1 a = 1; b = 0; chave1 = 0; chave2 = 0;chave3 = 1;
			#1 a = 1; b = 1; chave1 = 0; chave2 = 0;chave3 = 1;
			#1 a = 0; b = 0; chave1 = 1; chave2 = 0;chave3 = 1;
			#1 a = 0; b = 1; chave1 = 1; chave2 = 0;chave3 = 1;
			#1 a = 1; b = 0; chave1 = 1; chave2 = 0;chave3 = 1;
			#1 a = 1; b = 1; chave1 = 1; chave2 = 0;chave3 = 1;
			#1 a = 0; b = 0; chave1 = 0; chave2 = 1;chave3 = 1;
			#1 a = 0; b = 1; chave1 = 0; chave2 = 1;chave3 = 1;
			#1 a = 1; b = 0; chave1 = 0; chave2 = 1;chave3 = 1;
			#1 a = 1; b = 1; chave1 = 0; chave2 = 1;chave3 = 1;
			#1 a = 0; b = 0; chave1 = 1; chave2 = 1;chave3 = 1;
			#1 a = 0; b = 1; chave1 = 1; chave2 = 1;chave3 = 1;
			#1 a = 1; b = 0; chave1 = 1; chave2 = 1;chave3 = 1;
			#1 a = 1; b = 1; chave1 = 1; chave2 = 1;chave3 = 1;
	end
endmodule
		