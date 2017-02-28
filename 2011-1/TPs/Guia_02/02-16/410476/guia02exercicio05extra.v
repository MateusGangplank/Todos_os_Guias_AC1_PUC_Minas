// ---------------------
// guia02-Exercicio05extraa
// Nome: Larissa Fernandes Leijoto
// Matricula: 410476
// ---------------------

// ---------------------
// -- NOR gate
// ---------------------

   module  Exercicio05(s5, a, b, c);
	output s5;
	input a, b, c;
	assign s5 = ~(a | b | c);
	
   endmodule

   module testeMNOR;
	reg a, b, c;
	wire s1, s2, s3, s4,s5;

	Exercicio05 MNOR1 (s1, a, a, a);
	Exercicio05 MNOR2 (s2, b, b, b);
	Exercicio05 MNOR3 (s3, c, c, c);
	Exercicio05 MNOR4 (s4, s1, s2, s3);
   Exercicio05 MNOR5 (s5, s4, s4, s4);

	initial begin
		a = 0;b = 0;c = 0;
	end

	initial begin

   #1 $display (" Larissa Fernandes Leijoto - 410476 ");
   #1 $display ("~( a | b | c  )= s5 ");
	
	$monitor (" %b | %b | %b = %b ", a,b,c,s5);
	   #1 a=0;b=0;c=1;
      #1 a=0;b=1;c=0;
      #1 a=0;b=1;c=1;
		#1 a=1;b=0;c=0;
		#1 a=1;b=0;c=1;
		#1 a=1;b=1;c=0;
		#1 a=1;b=1;c=1;
	end	
endmodule
