//----------------------------------------------
//----Arquitetura de computador-----------------
//----guia 02 - exercicio 01--------------------
//----Nome: Paulo Henrique de Almeida Amorim----
//----Matricula: 412765-------------------------

//--or gate--
module ORgate (s, p, q);

	output s;
	input p, q;
	
	assign s = ~(p & q);

endmodule

//--teste orgate--

module ORgatetest;
	reg a, b;
	wire s, s1, s2;
	
//--instancia--

	ORgate NAND1 (s1, a, a);
	ORgate NAND2 (s2, b, b);
	ORgate NAND3 (s, s1, s2);
	
initial begin:start
	a = 0;
	b = 0;
end
	
//--parte principal--

initial begin:main

	$display("\nGuia 02 - exercicio 01 - Paulo Henrique - 412765");
	$display("\nTeste OR gate");
	$display("\na | b = s");
	$monitor("%b | %b = %b", a, b, s);
	
	#1 a = 0; b = 1;
	#1	a = 1; b = 0;
	#1 a = 1; b = 1;

end //--fim parte principal--

endmodule //--fim	test OR gate
	