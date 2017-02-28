// **************************
// Exemplo0024 - FULL ADDER
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// **************************

// **************************
// full adder
// **************************

   module fullAdder( output s,
	                  output resposta,
	                  output nextCarry,
	                  input x,
							input y,
							input firstCarry);
	
	// Descrever por portas
	
	wire s1,s2,s3,ny,nextCarry, r1;
	
	not not1 (ny,y);
	xor xor1 (s1,x,ny);
	xor xor2 (s,s1,firstCarry);
	and and1 (s2,x,ny);
	and and2 (s3,s1,firstCarry);
	or  or1  (nextCarry,s2,s3);
	
	endmodule // fullAdder

// **************************

	module Questao4(output [2:0] s,
	                output resposta,
	                output nextCarry,
						 input [2:0] x,
						 input [2:0] y,
						 input firstCarry);

	wire a;
	wire b;
	
   fullAdder gate1(s[0],resposta,a,x[0],y[0],firstCarry);
	
	fullAdder gate2(s[1],resposta,b,x[1],y[1],a);
	
	fullAdder gate3(s[2],resposta,nextCarry,x[2],y[2],b);
	
	or or1 (resposta,s[0],s[1],s[2]);
	
   endmodule // Questao4
	
// **************************
// Definir dados
// **************************

   module test;
	
	reg  [2:0] x;
	reg  [2:0] y;
	reg  firstCarry;
	wire [2:0] s;
	wire nextCarry;
	wire resposta;

   Questao4 modulo(s,resposta,nextCarry,x,y,firstCarry);

// **************************
// Parte principal
// **************************

   initial begin:start
	

	   $display("Exemplo0024 - Isabel Bicalho Amaro - 451580");
		$display("Test ALU's full adder\n");
		$display("1 - Sao diferentes.");
		$display("0 - Sao iguais.");
		
   // projetar testes do somador complete

   #1 x = 3'b000;  y = 3'b000;  firstCarry = 1;
	
	   $monitor("x = %3b  y = %3b  Resposta = %3b",x,y,resposta);
		
   #1 x = 3'b010;  y = 3'b010;
   #1 x = 3'b100;  y = 3'b011;
   #1 x = 3'b111;  y = 3'b010;
	#1 x = 3'b011;  y = 3'b011;
	#1 x = 3'b101;  y = 3'b101;

	
	end
	
	endmodule // test
	
/*

    Exemplo0024 - Isabel Bicalho Amaro - 451580
    Test ALU's full adder
    
    1 - Sao diferentes.
    0 - Sao iguais.
    x = 000  y = 000  Resposta =   0
    x = 010  y = 010  Resposta =   0
    x = 100  y = 011  Resposta =   1
    x = 111  y = 010  Resposta =   1
    x = 011  y = 011  Resposta =   0
    x = 101  y = 101  Resposta =   0

*/