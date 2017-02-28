// ------------------------- 
// Exemplo0033 - F4
// Nome: Samuel Eus�bio da Silva 
// Matricula: 435055	
// ------------------------- 
	
	module Multiplex (s0,s1,a,b,c,d,x);
	input a,b,c,d,x;
	output s0,s1;
	wire q1,q2,q3,q4;
	not not1 (q0,x);
	and (q1,a,q0);
	and (q2,q0,b);
	and (q3,c,x);
	and (q4,d,x);
	or  (s0,q1,q3);
	or (s1,q2,q4);
	endmodule
	
	module Grupos (s0,s1,a,b,x);
	input a,b,x;
	output s0,s1;
	wire q0,q1,q2,q3;
	nand (q0,a,b);
	nor (q1,a,b);
	and (q3,a,b);
	or (q4,a,b);
	Multiplex mx (s0,s1,q0,q1,q2,q3,x);
	endmodule
	
	
	module Teste;
	reg a,b,x;
	wire s0,s1;
	Grupos gr (s0,s1,a,b,x);
	initial begin: start
	a=0; b=0; x=0;
	end
	
	initial begin:main
	$display ("Exemplo0033 - Samuel Eus�bio da Silva	Matricula: 435055");
	$display ("Test LU's module");
	
	$monitor (" a = %1b \t b = %1b \t Resultado -> %1b%1b \n ",a,b,s0,s1);
	#1	a=0; b=1;
	#1 a=1; b=0;
	#1 a=1; b=1;
	end
	endmodule