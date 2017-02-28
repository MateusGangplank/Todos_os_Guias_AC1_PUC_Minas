// ---------------------
// guia02-Exercicio02
// Nome: Larissa Fernandes Leijoto
// Matricula: 410476
// ---------------------

// ---------------------
// -- NOR gate
// ---------------------

   module  Exercicio02(s4, a, b, c);
	output s4;
	input a, b, c;
	assign s4 = ~( a | b | c);
	
   endmodule

   module testeMNOR;
	reg a, b, c;
	wire s1, s2, s3, s4;

	Exercicio02 MNOR1 (s1, a, a, a);
	Exercicio02 MNOR2 (s2, b, b, b);
	Exercicio02 MNOR3 (s3, c, c, c);
	Exercicio02 MNOR4 (s4, s1, s2, s3);

	initial begin
		a = 0;b = 0;c = 0;
	end

	initial begin

   #1 $display (" Larissa Fernandes Leijoto - 410476 ");
   #1 $display (" a & b & c = s4 ");
	
	$monitor (" %b & %b & %b = %b ", a,b,c,s4);
	   #1 a=0;b=0;c=1;
      #1 a=0;b=1;c=0;
      #1 a=0;b=1;c=1;
		#1 a=1;b=0;c=0;
		#1 a=1;b=0;c=1;
		#1 a=1;b=1;c=0;
		#1 a=1;b=1;c=1;
	end	
endmodule
