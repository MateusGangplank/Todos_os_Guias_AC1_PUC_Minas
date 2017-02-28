//----------------------------------------------
//----Arquitetura de computador-----------------
//----guia 02 - exercicio 04--------------------
//----Nome: Paulo Henrique de Almeida Amorim----
//----Matricula: 412765-------------------------

//--nor gate--
module NORgate (s, p, q);

	output s;
	input p, q;
	
	assign s = ~(p & q);

endmodule

//--teste norgate--

module NORgatetest;
	reg a, b;
	wire s, s1, s2, s3;
	
//--instancia--

	NORgate NAND1 (s1, a, a);
	NORgate NAND2 (s2, b, b);
	NORgate NAND3 (s3, s1, s2);
	NORgate NAND4 (s, s3, s3);
	
initial begin:start
	a = 0;
	b = 0;
end
	
//--parte principal--

initial begin:main

	$display("\nGuia 02 - exercicio 04 - Paulo Henrique - 412765");
	$display("\nTeste NOR gate");
	$display("\n~(a | b) = s");
	$monitor("~(%b | %b) = %b", a, b, s);
	
	#1 a = 0; b = 1;
	#1	a = 1; b = 0;
	#1 a = 1; b = 1;

end //--fim parte principal--

endmodule //--fim	test NOR gate
	