//----------------------------------------------
//----Arquitetura de computador-----------------
//----guia 04 - exercicio 01--------------------
//----Nome: Paulo Henrique de Almeida Amorim----
//----Matricula: 412765-------------------------

//--Half Adder module--
module halfAdder (s1, s2, p, q);

	output s1, s2;
	input p, q;
	wire s3, s4, s5, s6, s7, s8;
	
	nor NOR1(s3, p, p); 
	nor NOR2(s4, q, q);
	nor NOR3(s1, s3, s4);
	nor NOR4(s5, p, q);
	nor NOR5(s6, s5, s5);
	nor NOR6(s7, s6, s6);
	nor NOR7(s2, s1, s7);
	

endmodule

//--teste Half Adder--

module halfAddertest;
	reg a, b;
	wire s1, s2;
	
//--instancia--

	halfAdder HALF(s1, s2, a, b);
	
initial begin:start
	a = 0;
	b = 0;
end
	
//--parte principal--

initial begin:main

	$display("\nGuia 04 - exercicio 01 - Paulo Henrique - 412765");
	$display("\nTeste Half Adder gate");
	$display("\na + b = s");
	$monitor("%b + %b = %b%b", a, b, s1, s2);
	
	#1 a = 0; b = 1;
	#1	a = 1; b = 0;
	#1 a = 1; b = 1;

end //--fim parte principal--

endmodule //--fim	test Half Adder gate
	