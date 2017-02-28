// **************************
// Exemplo0024 - FULL ADDER
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// **************************

// **************************
// full adder
// **************************

   module fullAdder( output s,
	                  output nextCarry,
	                  input x,
							input start,
							input firstCarry);
	
	// Descrever por portas
	
	wire s1,s2,s3,ny,nextCarry, r1;
	
	not not1 (nx,x);
	xor xor1 (s1,start,nx);
	xor xor2 (s,s1,firstCarry);
	and and1 (s2,start,nx);
	and and2 (s3,s1,firstCarry);
	or  or1  (nextCarry,s2,s3);
	
	endmodule // fullAdder

// **************************

	module Questao5(output [2:0] s,
	                output nextCarry,
						 input [2:0] x,
						 input start,
						 input firstCarry);

	wire a;
	wire b;
	
   fullAdder gate1(s[0],a,x[0],start,firstCarry);
	
	fullAdder gate2(s[1],b,x[1],start,a);
	
	fullAdder gate3(s[2],nextCarry,x[2],start,b);
	
	
   endmodule // Questao5
	
// **************************
// Definir dados
// **************************

   module test;
	
	reg  [2:0] x;
	reg  start;
	reg  firstCarry;
	wire [2:0] s;
	wire nextCarry;

   Questao5 modulo(s,nextCarry,x,start,firstCarry);

// **************************
// Parte principal
// **************************

   initial begin
	

	   $display("Exemplo0025 - Isabel Bicalho Amaro - 451580");
		$display("Test ALU's full adder\n");

		
   // projetar testes do somador complete

   #1 x = 3'b000;  firstCarry = 1; start = 0;
	
	   $monitor("x = %3b  C2 = %3b",x,s);
		
   #1 x = 3'b010;
   #1 x = 3'b100;
   #1 x = 3'b111;
	#1 x = 3'b011;
	#1 x = 3'b101;

	
	end
	
	endmodule // test
	
/*

    Exemplo0025 - Isabel Bicalho Amaro - 451580
    Test ALU's full adder
    
    x = 000  C2 = 000
    x = 010  C2 = 110
    x = 100  C2 = 100
    x = 111  C2 = 001
    x = 011  C2 = 101
    x = 101  C2 = 011

*/