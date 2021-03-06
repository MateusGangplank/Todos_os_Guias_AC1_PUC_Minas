// ------------------------- 
// Corre��o da prova 
// Nome: Camila Guedes Silveira 
// Matricula: 427393
// ------------------------- 

module questaoE (output s, input a, input b, input c, input d);
	wire c1, c2, c3, c4;
	
	or OR1(c1,~a, ~b, ~c, ~d);
	or OR2(c2, ~a, b, ~c, d);
	or OR3(c3, a, b, c, d);
	or OR4(c4, a, ~b, c, ~d);
	

		
	and AND1(s, c1, c2, c3, c4);
	
endmodule // questaoE

module Teste;

	reg a;
	reg b;
	reg c;
	reg d;
	wire s;

	questaoE Teste (s,a,b,c,d);

	initial begin
		 a=0; b=0; c=0; d=0;
	end

	initial begin

		#1 $display (" Camila Guedes Silveira - 427393 ");
		#1 $display (" a | b | c | d | s1 ");
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
	 
	 #1 $display("Resp: (a' + c) * (a + c')"); 
   



	end	
	endmodule