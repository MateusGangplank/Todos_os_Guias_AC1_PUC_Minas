// ---------------------
// 
// Nome: Larissa Fernandes Leijoto
// Matricula: 410476
// ---------------------

// ---------------------
// --Provaaa
// ---------------------

  module saidas0(s0,a,b,c,d);
	input a, b,c,d;
	output s0;
	
	
	
	and AND1(temp1,~b,c,d);
	and AND1(temp2,~a,b,d);
	and AND1(temp3,b,c,~d);
	and AND1(temp4,a,~b,d);
	and AND1(temp6,a,~b,c);
	and AND1(temp7,a,b,~d);
	
	or OR1 (s0,temp1,temp2,temp3,temp4,temp6,temp7);

	
   endmodule

    module Teste;

	reg a,b,c,d;
	wire s0;

	saidas0 Teste (s0,a,b,c,d);

	initial begin
		 a=0; b=0; c=0; d=0;
	end

	initial begin

		#1 $display (" Larissa Fernandes Leijoto - 410476 ");
		#1 $display (" a | b | c | d | s0 ");
		$monitor   (" %b | %b | %b | %b |  %b ", a,b,c,d,s0);
		   
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
