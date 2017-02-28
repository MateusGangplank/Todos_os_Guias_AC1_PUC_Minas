// ---------------------
// 
// Nome: Larissa Fernandes Leijoto
// Matricula: 410476
// ---------------------

// ---------------------
// --Provaaa
// ---------------------

  module saidas2(s2,a,b,c,d);
	input a, b,c,d;
	output s2;
	
	and AND1 (s2,a,b,c,d);
	
   endmodule

    module Teste;

	reg a,b,c,d;
	wire s2;

	saidas2 Teste (s2,a,b,c,d);

	initial begin
		 a=0; b=0; c=0; d=0;
	end

	initial begin

		#1 $display (" Larissa Fernandes Leijoto - 410476 ");
		#1 $display (" a | b | c | d | s2 ");
		$monitor   (" %b | %b | %b | %b |  %b ", a,b,c,d,s2);
		   
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
