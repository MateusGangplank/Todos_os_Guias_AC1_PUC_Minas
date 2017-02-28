// ---------------------
//
// 3) a'c'd' + a'b'e + a'ce + ab'c'd + ab'c + acd' + ace
// Nome: Larissa Fernandes Leijoto
// Matricula: 410476
// --exercicio03
// ---------------------
  module saidas0(s0,a,b,c,d,e);
	input a, b,c,d,e;
	output s0;

	and AND1(temp1,~a,~c,~d);
	and AND2(temp3,~a,~b,e);
	and AND3(temp4,~a,c,e);
	and AND4(temp6,a,~b,~c,d);
	and AND5(temp7,a,~b,c);
	and AND6(temp8,a,c,~d);
	and AND7(temp9,a,e,c);
	or OR1 (s0,temp3,temp4,temp6,temp7,temp8,temp9);

	
   endmodule

    module Teste;

	reg a,b,c,d,e;
	wire s0;

	saidas0 Teste (s0,a,b,c,d,e);

	initial begin
		
      a=0; b=0; c=0; d=0; e=0;
	end

	initial begin

		#1 $display (" Larissa Fernandes Leijoto - 410476 ");
		#1 $display (" a | b | c | d | e  | s0 ");
		$monitor   (" %b | %b | %b | %b | %b |  %b ", a,b,c,d,e,s0);
		    
    #1  a=0; b=0; c=0; d=0; e=1; 
    #1  a=0; b=0; c=0; d=1; e=0;
    #1  a=0; b=0; c=0; d=1; e=1;
    #1  a=0; b=0; c=1; d=0; e=0;
    #1  a=0; b=0; c=1; d=0; e=1;
    #1  a=0; b=0; c=1; d=1; e=0;
    #1  a=0; b=0; c=1; d=1; e=1;
    #1  a=0; b=1; c=0; d=0; e=0;
    #1  a=0; b=1; c=0; d=0; e=1;
    #1  a=0; b=1; c=0; d=1; e=0;
    #1  a=0; b=1; c=0; d=1; e=1;
    #1  a=0; b=1; c=1; d=0; e=0;
    #1  a=0; b=1; c=1; d=0; e=1;
    #1  a=0; b=1; c=1; d=1; e=0;
    #1  a=0; b=1; c=1; d=1; e=1;
    #1  a=1; b=0; c=0; d=0; e=0;
    #1  a=1; b=0; c=0; d=0; e=1;
    #1  a=1; b=0; c=0; d=1; e=0;
    #1  a=1; b=0; c=0; d=1; e=1;
    #1  a=1; b=0; c=1; d=0; e=0;
    #1  a=1; b=0; c=1; d=0; e=1;
    #1  a=1; b=0; c=1; d=1; e=0;
    #1  a=1; b=0; c=1; d=1; e=1;
    #1  a=1; b=1; c=0; d=0; e=0;
    #1  a=1; b=1; c=0; d=0; e=1;
    #1  a=1; b=1; c=0; d=1; e=0;
    #1  a=1; b=1; c=0; d=1; e=1;
    #1  a=1; b=1; c=1; d=0; e=0;
    #1  a=1; b=1; c=1; d=0; e=1;
    #1  a=1; b=1; c=1; d=1; e=0;
    #1  a=1; b=1; c=1; d=1; e=1;




	end	
     endmodule