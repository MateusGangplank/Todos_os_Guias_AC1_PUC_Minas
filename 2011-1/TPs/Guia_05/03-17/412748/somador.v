// ----------------------------------------------------------------------------------------
// Guia 05_01 _ Somador de 3 bits
// Nome: Jessica Luisa Betonico Andrade
// Matricula: 412748
// ------------------------------------------------------------------------------------------

module saida0(s0, x, y);

	input x, y;
	output s0,not1, sNot2, sAnd1, sAnd2;
	wire s0,not1, sNot2, sAnd1, sAnd2;

	not NOT_X(not1, x);
	and AND_NOT_X_Y(sAnd1, not1, y);
	not NOT_Y(sNot2, y);
	and AND_X_NOT_B(sAnd2, x, sNot2);
	or saidaFinal (s0, sAnd1, sAnd2);

endmodule

module saida1(s1, x, y);

	input x, y;
	output s1;
	wire s1;

	and AND1(s1, x, y);

endmodule

module meiaSoma1(s0, s1, x, y);

	input x, y;
	output s0, s1;
	wire s0,s1;

	saida0 S0(s0, x, y);
	saida1 S1(s1, x, y);

endmodule

module somaCompleta(s3, s5, x, y, z);

	input x, y, z;
	output s1, s0, s3, s4, s5;
	wire s1, s0;

	meiaSoma1 MEIASOMA1(s0, s1, x, y);
	meiaSoma1 MEIASOMA2(s3, s4, s0, z);
	or OR1(s5, s1, s4);

endmodule


module somador3_bits (s0, s1, s2, s3, a0, a1, a2, b0, b1, b2);

	input a0, a1, a2, b0, b1, b2;
	output s0, s1, s2, s3;

	wire saida0, saida1;

	somaCompleta SOMACOMPLETA1 (s0, saida0, a0, b0, 0);
	somaCompleta SOMACOMPLETA2 (s1, saida1,saida0, a1, b1);
	somaCompleta SOMACOMPLETA3 (s2, s3, saida1,a2, b2);

endmodule

module teste;



	reg a0, a1, a2, b0, b1, b2;
	output s0, s1, s2, s3;

	somador3_bits SOMADOR_3BITS (s0, s1, s2, s3, a0, a1, a2, b0, b1, b2);

initial begin:start
	a0=0;a1=0;a2=0;b0=0;b1=0;b2=0;
end

initial begin: main

	$display("Guia 05_01 - Jessica Luisa Betonico Andrade - 412748");
	$display("Somador de 3 bits");
	$display("A   +   B  = S");
	$monitor("%b%b%b + %b%b%b= %b%b%b%b", a2, a1, a0, b2, b1, b0, s3, s2, s1, s0);
	
		#1 a2=0; a1=0; a0=1; b2=0; b1=0; b0=0;
		#1 a2=0; a1=1; a0=0; b2=0; b1=0; b0=0;
		#1 a2=0; a1=1; a0=1; b2=0; b1=0; b0=0;
		#1 a2=1; a1=0; a0=0; b2=0; b1=0; b0=0;
		#1 a2=1; a1=0; a0=1; b2=0; b1=0; b0=0;
		#1 a2=1; a1=1; a0=0; b2=0; b1=0; b0=0;
		#1 a2=1; a1=1; a0=1; b2=0; b1=0; b0=0;
		
		#1 a2=0; a1=0; a0=0; b2=0; b1=0; b0=1;
		#1 a2=0; a1=0; a0=1; b2=0; b1=0; b0=1;
		#1 a2=0; a1=1; a0=0; b2=0; b1=0; b0=1;
		#1 a2=0; a1=1; a0=1; b2=0; b1=0; b0=1;
		#1 a2=1; a1=0; a0=0; b2=0; b1=0; b0=1;
		#1 a2=1; a1=0; a0=1; b2=0; b1=0; b0=1;
		#1 a2=1; a1=1; a0=0; b2=0; b1=0; b0=1;
		#1 a2=1; a1=1; a0=1; b2=0; b1=0; b0=1;
		
		#1 a2=0; a1=0; a0=0; b2=0; b1=1; b0=0;
		#1 a2=0; a1=0; a0=1; b2=0; b1=1; b0=0;
		#1 a2=0; a1=1; a0=0; b2=0; b1=1; b0=0;
		#1 a2=0; a1=1; a0=1; b2=0; b1=1; b0=0;
		#1 a2=1; a1=0; a0=0; b2=0; b1=1; b0=0;
		#1 a2=1; a1=0; a0=1; b2=0; b1=1; b0=0;
		#1 a2=1; a1=1; a0=0; b2=0; b1=1; b0=0;
		#1 a2=1; a1=1; a0=1; b2=0; b1=1; b0=0;
		
		#1 a2=0; a1=0; a0=0; b2=0; b1=1; b0=1;
		#1 a2=0; a1=0; a0=1; b2=0; b1=1; b0=1;
		#1 a2=0; a1=1; a0=0; b2=0; b1=1; b0=1;
		#1 a2=0; a1=1; a0=1; b2=0; b1=1; b0=1;
		#1 a2=1; a1=0; a0=0; b2=0; b1=1; b0=1;
		#1 a2=1; a1=0; a0=1; b2=0; b1=1; b0=1;
		#1 a2=1; a1=1; a0=0; b2=0; b1=1; b0=1;
		#1 a2=1; a1=1; a0=1; b2=0; b1=1; b0=1;
		
		#1 a2=0; a1=0; a0=0; b2=1; b1=0; b0=0;
		#1 a2=0; a1=0; a0=1; b2=1; b1=0; b0=0;
		#1 a2=0; a1=1; a0=0; b2=1; b1=0; b0=0;
		#1 a2=0; a1=1; a0=1; b2=1; b1=0; b0=0;
		#1 a2=1; a1=0; a0=0; b2=1; b1=0; b0=0;
		#1 a2=1; a1=0; a0=1; b2=1; b1=0; b0=0;
		#1 a2=1; a1=1; a0=0; b2=1; b1=0; b0=0;
		#1 a2=1; a1=1; a0=1; b2=1; b1=0; b0=0;
		
		#1 a2=0; a1=0; a0=0; b2=1; b1=0; b0=1;
		#1 a2=0; a1=0; a0=1; b2=1; b1=0; b0=1;
		#1 a2=0; a1=1; a0=0; b2=1; b1=0; b0=1;
		#1 a2=0; a1=1; a0=1; b2=1; b1=0; b0=1;
		#1 a2=1; a1=0; a0=0; b2=1; b1=0; b0=1;
		#1 a2=1; a1=0; a0=1; b2=1; b1=0; b0=1;
		#1 a2=1; a1=1; a0=0; b2=1; b1=0; b0=1;
		#1 a2=1; a1=1; a0=1; b2=1; b1=0; b0=1;
		
		#1 a2=0; a1=0; a0=0; b2=1; b1=1; b0=0;
		#1 a2=0; a1=0; a0=1; b2=1; b1=1; b0=0;
		#1 a2=0; a1=1; a0=0; b2=1; b1=1; b0=0;
		#1 a2=0; a1=1; a0=1; b2=1; b1=1; b0=0;
		#1 a2=1; a1=0; a0=0; b2=1; b1=1; b0=0;
		#1 a2=1; a1=0; a0=1; b2=1; b1=1; b0=0;
		#1 a2=1; a1=1; a0=0; b2=1; b1=1; b0=0;
		#1 a2=1; a1=1; a0=1; b2=1; b1=1; b0=0;
		
		#1 a2=0; a1=0; a0=0; b2=1; b1=1; b0=1;
		#1 a2=0; a1=0; a0=1; b2=1; b1=1; b0=1;
		#1 a2=0; a1=1; a0=0; b2=1; b1=1; b0=1;
		#1 a2=0; a1=1; a0=1; b2=1; b1=1; b0=1;
		#1 a2=1; a1=0; a0=0; b2=1; b1=1; b0=1;
		#1 a2=1; a1=0; a0=1; b2=1; b1=1; b0=1;
		#1 a2=1; a1=1; a0=0; b2=1; b1=1; b0=1;
		#1 a2=1; a1=1; a0=1; b2=1; b1=1; b0=1;
end
endmodule

