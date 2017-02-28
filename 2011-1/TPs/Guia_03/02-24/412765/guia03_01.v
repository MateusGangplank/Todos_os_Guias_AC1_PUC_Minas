//----------------------------------------------
//----Arquitetura de computador-----------------
//----guia 03 - exercicio 01--------------------
//----Nome: Paulo Henrique de Almeida Amorim----
//----Matricula: 412765-------------------------

//--Half Adder module--
module halfAdder (s1, s2, p, q);

	output s1, s2;
	input p, q;
	wire s3, s4;
	
	and AND1(s2, p, q);
	not NOT1(s4, s2);
	or OR1(s3, p, q);
	and AND2(s1, s4, s3); 
	

endmodule

//--teste Half Adder--

module halfAddertest;
	reg a, b;
	wire s1, s2;
	
//--instancia--

	halfAdder HALF(s2, s1, a, b);
	
initial begin:start
	a = 0;
	b = 0;
end
	
//--parte principal--

initial begin:main

	$display("\nGuia 03 - exercicio 01 - Paulo Henrique - 412765");
	$display("\nTeste Half Adder gate");
	$display("\na + b = s");
	$monitor("%b + %b = %b%b", a, b, s1, s2);
	
	#1 a = 0; b = 1;
	#1	a = 1; b = 0;
	#1 a = 1; b = 1;

end //--fim parte principal--

endmodule //--fim	test Half Adder gate
	