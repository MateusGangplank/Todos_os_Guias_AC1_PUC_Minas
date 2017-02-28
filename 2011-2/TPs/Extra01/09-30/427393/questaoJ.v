// ------------------------- 
// Correção da prova 
// Nome: Camila Guedes Silveira 
// Matricula: 427393
// ------------------------- 

module questaoJ (output s, input a, input b, input c, input d);
	wire s1, s2, s3, s4, s5, s6, a1, b1, c1, d1;
	
	not NOT1(a1, a);
	not NOT2(b1, b);
	not NOT3(c1, c);
	not NOT4(d1, d);
	
	// -- and AND1(s1, a1, b, c1, d1);
	and AND2(s2, a, b, c1, d1);
	and AND3(s3, a, b1, c1, d1);
	and AND4(s4, a, b, c1, d);
	and AND5(s5, a, b1, c1, d);
	// -- and AND6(s6, a, b, c, d1);
	
	or OR1(s, s2, s3, s4, s5);
	
endmodule // questaoJ

module Teste;

	reg a;
	reg b;
	reg c;
	reg d;
	wire s;

	questaoJ Teste (s,a,b,c,d);

	initial begin
		 a=0; b=0; c=0; d=0;
	end

	initial begin

		#1 $display ("Camila Guedes Silveira - 427393 ");
		#1 $display ("Questão J");
		#1 $display (" a | b | c | d | s2 ");
		$monitor   (" %b | %b | %b | %b |  %b ", a,b,c,d,s);
		   
		#1  a=0; b=0; c=0; d=1;
		#1  a=0; b=0; c=1; d=0; 
		#1  a=0; b=0; c=1; d=1; 
		#1  a=0; b=1; c=0; d=0; 
		#1  a=0; b=1; c=0; d=1; 
		#1  a=0; b=1; c=1; d=0; 
		#1  a=0; b=1; c=1; d=1; 
		#1  a=1; b=0; c=0; d=0; 
		#1  a=1; b=0; c=0; d=1;	
		#1  a=1; b=0; c=1; d=0;
		#1  a=1; b=0; c=1; d=1;
		#1  a=1; b=1; c=0; d=0;
		#1  a=1; b=1; c=0; d=1;
  		#1  a=1; b=1; c=1; d=0;
    	#1  a=1; b=1; c=1; d=1; 
   	
		
	end	
	endmodule