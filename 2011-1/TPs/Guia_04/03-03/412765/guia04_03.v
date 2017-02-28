//----------------------------------------------
//----Arquitetura de computador-----------------
//----guia 04 - exercicio 03--------------------
//----Nome: Paulo Henrique de Almeida Amorim----
//----Matricula: 412765-------------------------

//--Half Difference module 1--
module halfDifference1 (s1, s2, p, q);

	output s1, s2;
	input p, q;
	wire s3;
	
	not NOT1(s3, p);	
	xor XOR1(s1, p, q);
	and AND1(s2, s3, q);	

endmodule

//--Half Difference module 2--
module halfDifference2 (s1, s2, p, q);

	output s1, s2;
	input p, q;
	wire s3;
	
	not NOT1(s3, q);	
	xor XOR1(s1, p, q);
	and AND1(s2, p, s3);	

endmodule


//--Full Difference module--
module fullDifference(s1, s2, s3, p, q);
	output s2, s3;
	input s1, p, q;
	wire s4, s5, s6;
	
	halfDifference1 HALF2(s4, s5, p, q);
	halfDifference2 HALF1(s2, s6, s1, s4);
	or OR1(s3, s6, s5);
	
endmodule

//--teste Full Difference--

module fullDifferencetest;
	reg a, b, s1;
	wire s2, s3;
	
//--instancia--

	fullDifference FULL(s1, s2, s3, a, b);
	
initial begin:start
	a = 0;
	b = 0;
	s1 = 0;

end
	
//--parte principal--

initial begin:main

	$display("\nGuia 04 - exercicio 03 - Paulo Henrique - 412765");
	$display("\nTeste Full Difference gate");
	$display("\nCin a - b = s");
	$monitor("%b %b - %b = %b%b", s1, a, b, s2, s3);
	
	#1 s1 = 1; a = 0; b = 0;
	#1 s1 = 0; a = 1; b = 0;
	#1 s1 = 1; a = 1; b = 0;
	#1 s1 = 0; a = 0; b = 1;
	#1 s1 = 1; a = 0; b = 1;
	#1 s1 = 0; a = 1; b = 1;
	#1 s1 = 1; a = 1; b = 1;
	
	
end //--fim parte principal--

endmodule //--fim	test Full Difference gate
	