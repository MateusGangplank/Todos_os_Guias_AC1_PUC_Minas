// **************************
// Exemplo0030 - FULL ADDER
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// **************************

// **************************
// buffer
// **************************

   module buffer (output s, input p);
     assign s = p;              
   endmodule // buffer

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
// incremento de 1
// **************************

   module inc(output [2:0] s,
	           input [2:0] x);

	wire c1,c2,c3;
	
	fullAdder gate1(s[0],c1,x[0],1,0);
	fullAdder gate2(s[1],c2,x[1],0,c1);
	fullAdder gate3(s[2],c3,x[2],0,c2);
	
	endmodule // inc

// **************************

	module Questao5(output [2:0] s,
	                output CarryOut,
						 output flag,
						 output overflow,
						 output sinal,
						 input [2:0] x,
						 input [2:0] y,
						 input chave);
   
	wire s0,s1,s2,c1,c2,c3,q;
	
	xor xor1(s0,y[0],chave);
	xor xor2(s1,y[1],chave);
	xor xor3(s2,y[2],chave);
	
   fullAdder gate1(s[0],c1,x[0],s0,chave);
	
	fullAdder gate2(s[1],c2,x[1],s1,c1);
	
	fullAdder gate3(s[2],c3,x[2],s2,c2);
	
	buffer BF1(sinal,s[2]);
	
	xor xor4(CarryOut,c3,chave);
	
	xor xor5(q,c3,c2);
	
	or or1(overflow,q,CarryOut);
	
	nor nor1(flag,s[0],s[1],s[2]);
	
   endmodule 
	
// **************************
// Definir dados
// **************************

   module test;
	
	reg  [2:0] x;
	reg  [2:0] y;
	reg  chave;
	wire [2:0] s;
	wire CarryOut;
	wire flag;
	wire overflow;
	wire sinal;

   Questao5 modulo(s,CarryOut,flag,overflow,sinal,x,y,chave);

// **************************
// Parte principal
// **************************

   initial begin:start
	

	   $display("Exemplo0030 - Isabel Bicalho Amaro - 451580");
		$display("Test ALU's full adder\n");
		$display("Chave: 0-Soma 1-Subtracao");
		


   #1 x = 3'b000;  y = 3'b000;  chave = 0;
	
	   $monitor("Chave = %b  x = %3b  y = %3b  carry out = %b  resultado = %3b  flag =  %b  overflow = %b  sinal = %b",chave,x,y,CarryOut,s,flag,overflow,sinal);
	
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
	
    Exemplo0030 - Isabel Bicalho Amaro - 451580
    Test ALU's full adder
    
    Chave: 0-Soma 1-Subtracao
    Chave = 0  x = 000  y = 000  carry out = 0  resultado = 000  flag =  1  overflow = 0  sinal = 0
    Chave = 1  x = 000  y = 000  carry out = 0  resultado = 000  flag =  1  overflow = 0  sinal = 0
    Chave = 1  x = 010  y = 010  carry out = 0  resultado = 000  flag =  1  overflow = 0  sinal = 0
    Chave = 0  x = 010  y = 010  carry out = 0  resultado = 100  flag =  0  overflow = 1  sinal = 1
    Chave = 0  x = 100  y = 011  carry out = 0  resultado = 111  flag =  0  overflow = 0  sinal = 1
    Chave = 1  x = 100  y = 011  carry out = 0  resultado = 001  flag =  0  overflow = 1  sinal = 0
    Chave = 1  x = 001  y = 101  carry out = 1  resultado = 100  flag =  0  overflow = 1  sinal = 1
    Chave = 0  x = 001  y = 101  carry out = 0  resultado = 110  flag =  0  overflow = 0  sinal = 1
    Chave = 1  x = 001  y = 101  carry out = 1  resultado = 100  flag =  0  overflow = 1  sinal = 1
    
	 */