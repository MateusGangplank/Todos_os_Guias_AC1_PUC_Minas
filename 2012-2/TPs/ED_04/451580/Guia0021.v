// **************************
// Exemplo0021 - FULL ADDER
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// **************************

// **************************
// full adder
// **************************

   module fullAdder( output s,
	                  output nextCarry,
	                  input x,
							input y,
							input firstCarry);
	
	// Descrever por portas
	
	wire s1,s2,s3,nextCarry;
	
	xor xor1 (s1,x,y);
	xor xor2 (s,s1,firstCarry);
	and and1 (s2,x,y);
	and and2 (s3,s1,firstCarry);
	or  or1  (nextCarry,s2,s3);
	
	endmodule // fullAdder

// **************************

	module Questao1(output [2:0] s,
	                output nextCarry,
						 input [2:0] x,
						 input [2:0] y,
						 input firstCarry);

	
   fullAdder gate1(s[0],nextCarry,x[0],y[0],firstCarry);
	
	fullAdder gate2(s[1],nextCarry,x[1],y[1],firstCarry);
	
	fullAdder gate3(s[2],nextCarry,x[2],y[2],firstCarry);
	
   endmodule // Questao1
	
// **************************
// Definir dados
// **************************

   module test;
	
	reg  [2:0] x;
	reg  [2:0] y;
	reg  firstCarry;
	wire [2:0] s;
	wire nextCarry;

   Questao1 modulo(s,nextCarry,x,y,firstCarry);

// **************************
// Parte principal
// **************************

   initial begin:start
	

	   $display("Exemplo0021 - Isabel Bicalho Amaro - 451580");
		$display("Test ALU's full adder\n");
		
   // projetar testes do somador complete

   #1 x = 3'b000;  y = 3'b000;  firstCarry = 0;
	
	   $monitor("x = %3b  y = %3b  soma = %3b",x,y,s);
		
   #1 x = 3'b010;  y = 3'b010;
   #1 x = 3'b100;  y = 3'b011;
   #1 x = 3'b001;  y = 3'b101;

	
	end
	
	endmodule // test