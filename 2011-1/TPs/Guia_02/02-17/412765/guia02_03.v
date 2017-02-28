//----------------------------------------------
//----Arquitetura de computador-----------------
//----guia 02 - exercicio 03--------------------
//----Nome: Paulo Henrique de Almeida Amorim----
//----Matricula: 412765-------------------------

//--not gate--
module NOTgate (s, p);

	output s;
	input p;
	
	assign s = ~(p & p);

endmodule

//--teste notgate--

module NOTgatetest;
	reg a;
	wire s;
	
//--instancia--

	NOTgate NAND1 (s, a);
	
initial begin:start
	a = 0;
end
	
//--parte principal--

initial begin:main

	$display("\nGuia 02 - exercicio 03 - Paulo Henrique - 412765");
	$display("\nTeste NOT gate");
	$display("\n~a = s");
	$monitor("~%b = %b", a, s);
	
	#1 a = 0;
	#1	a = 1;
	#1 a = 1;

end //--fim parte principal--

endmodule //--fim	test NOT gate
	