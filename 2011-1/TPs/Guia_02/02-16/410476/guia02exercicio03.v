// ---------------------
// guia02-Exercicio02
// Nome: Larissa Fernandes Leijoto
// Matricula: 410476
// ---------------------

// ---------------------
// -- NOR gate
// ---------------------

   module  Exercicio03(s4, a, b, c);
	output s4;
	input a, b, c;
	assign s4 = ~( a & b & c);
	
   endmodule

   module testeMNAND;
	reg a;
	wire s4;

	Exercicio03 MNAND1 (s4, a, a, a);
	
	initial begin
		a = 0;
	end

	initial begin

   #1 $display (" Larissa Fernandes Leijoto - 410476 ");
   #1 $display (" ~a  = s4 ");
	
	$monitor ("  %b  =  %b ",a,s4);
	   
      
	end	
endmodule
