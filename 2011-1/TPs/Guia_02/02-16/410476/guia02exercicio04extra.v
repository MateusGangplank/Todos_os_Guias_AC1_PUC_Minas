// ---------------------
// guia02-Exercicio04extraa
// Nome: Larissa Fernandes Leijoto
// Matricula: 410476
// ---------------------

// ---------------------
// -- NAND gate
// ---------------------

   module  Exercicio04(s5, a, b, c);
	output s5;
	input a, b, c;
	assign s5 = ~(a & b & c);
	
   endmodule

   module testeMNAND;
	reg a, b, c;
	wire s1, s2, s3, s4,s5;

	Exercicio04 MNAND1 (s1, a, a, a);
	Exercicio04 MNAND2 (s2, b, b, b);
	Exercicio04 MNAND3 (s3, c, c, c);
	Exercicio04 MNAND4 (s4, s1, s2, s3);
   Exercicio04 MNAND5 (s5, s4, s4, s4);

	initial begin
		a = 0;b = 0;c = 0;
	end

	initial begin

   #1 $display (" Larissa Fernandes Leijoto - 410476 ");
   #1 $display ("~( a | b | c  )= s4 ");
	
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
