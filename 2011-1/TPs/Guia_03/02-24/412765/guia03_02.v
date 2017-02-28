//----------------------------------------------
//----Arquitetura de computador-----------------
//----guia 03 - exercicio 02--------------------
//----Nome: Paulo Henrique de Almeida Amorim----
//----Matricula: 412765-------------------------

//--Half Adder(NAND) module--
module halfAdder (s0, s1, p, q);

	output s0, s1;
	input p, q;
	wire s2, s3, s4, s5, s6, s7, s8, s9;
	
	nand NAND1(s2, p, q);
	nand NAND2(s3, p, s2);
	nand NAND3(s4, q, s2);
	nand NAND4(s0, s3, s4);
	nand NAND5(s5, s2, s2);
	nand NAND6(s6, s5, s5);
	nand NAND7(s1, s6, s6);

endmodule

//--teste Half Adder--

module halfAddertest;
	reg a, b;
	wire s0, s1;
	
//--instancia--

	halfAdder HALF(s2, s1, a, b);
	
initial begin:start
	a = 0;
	b = 0;
end
	
//--parte principal--

initial begin:main

	$display("\nGuia 03 - exercicio 02 - Paulo Henrique - 412765");
	$display("\nTeste Half Adder(NAND) gate");
	$display("\na + b = s");
	$monitor("%b + %b = %b%b", a, b, s1, s2);
	
	#1 a = 0; b = 1;
	#1	a = 1; b = 0;
	#1 a = 1; b = 1;

end //--fim parte principal--

endmodule //--fim	test Half Adder(NAND) gate
	