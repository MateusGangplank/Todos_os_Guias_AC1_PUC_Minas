// **************************
// Exemplo0026 - FULL ADDER
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
	                output CarryOut,
						 input [2:0] x,
						 input [2:0] y,
						 input chave);
   
	wire s0,s1,s2,c1,c2,c3;
	
	xor xor1(s0,y[0],chave);
	xor xor2(s1,y[1],chave);
	xor xor3(s2,y[2],chave);
	
   fullAdder gate1(s[0],c1,x[0],s0,chave);
	
	fullAdder gate2(s[1],c2,x[1],s1,c1);
	
	fullAdder gate3(s[2],c3,x[2],s2,c2);
	
	xor xor4(CarryOut,c3,chave);
	
   endmodule // Questao1
	
// **************************
// Definir dados
// **************************

   module test;
	
	reg  [2:0] x;
	reg  [2:0] y;
	reg  chave;
	wire [2:0] s;
	wire CarryOut;

   Questao1 modulo(s,CarryOut,x,y,chave);

// **************************
// Parte principal
// **************************

   initial begin:start
	

	   $display("Exemplo0026 - Isabel Bicalho Amaro - 451580");
		$display("Test ALU's full adder\n");
		$display("Chave: 0-Soma 1-Subtracao");
		


   #1 x = 3'b000;  y = 3'b000;  chave = 0;
	
	   $monitor("Chave = %b  x = %3b  y = %3b  carry out = %b  resultado = %3b",chave,x,y,CarryOut,s);
	
	#1 chave = 1;	
   #1 x = 3'b010;  y = 3'b010;
	#1 chave = 0;
   #1 x = 3'b100;  y = 3'b011;
	#1 chave = 1;
   #1 x = 3'b001;  y = 3'b101;
	#1 chave = 0;
	#1 chave = 1;

	
	end
	
	endmodule // test
	
	/*
	
	 Exemplo0026 - Isabel Bicalho Amaro - 451580
    Test ALU's full adder
    
    Chave: 0-Soma 1-Subtracao
    Chave = 0  x = 000  y = 000  carry out = 0  resultado = 000
    Chave = 1  x = 000  y = 000  carry out = 0  resultado = 000
    Chave = 1  x = 010  y = 010  carry out = 0  resultado = 000
    Chave = 0  x = 010  y = 010  carry out = 0  resultado = 100
    Chave = 0  x = 100  y = 011  carry out = 0  resultado = 111
    Chave = 1  x = 100  y = 011  carry out = 0  resultado = 001
    Chave = 1  x = 001  y = 101  carry out = 1  resultado = 100
    Chave = 0  x = 001  y = 101  carry out = 0  resultado = 110
    Chave = 1  x = 001  y = 101  carry out = 1  resultado = 100
    
    */