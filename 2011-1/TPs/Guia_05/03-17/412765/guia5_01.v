//----------------------------------------------
//----Arquitetura de computador-----------------
//----guia 05 - exercicio 01--------------------
//----Nome: Paulo Henrique de Almeida Amorim----
//----Matricula: 412765-------------------------

//--Half Adder module--
module halfAdder (s1, s2, p, q);

	output s1, s2;
	input p, q;
		
	xor XOR1(s1, p, q);
	and AND1(s2, p, q);	

endmodule

//--Full Adder module--
module fullAdder(s1, s2, s3, p, q);
	output s2, s3;
	input s1, p, q;
	wire s4, s5, s6;
	
	halfAdder HALF2(s4, s5, p, q);
	halfAdder HALF1(s2, s6, s1, s4);
	or OR1(s3, s6, s5);
	
endmodule

//--Full Adder 4 bits module--

module fullAdder4bits(soma, cout, p, q);
	input [4:0]p, q;
	output [3:0]soma;
	output cout;
	wire s1, s2, s3;
	
	halfAdder HA(soma[0], s1, p[0], q[0]);
	fullAdder FA1(s1, soma[1], s2, p[1], q[1]);
	fullAdder FA2(s2, soma[2], s3, p[2], q[2]);
	fullAdder FA3(s3, soma[3], cout, p[3], q[3]);
	
endmodule

//--Teste Full Adder 4 bits--
	
module TestefullAdder4bits;
	reg [4:0]a, b;
	wire [3:0]soma;
	wire cout;

//--instancia--		
	fullAdder4bits FA4B(soma, cout, a, b);

initial begin:start
	a = 4'b0000;
	b = 4'b0000;
 
end
	
//--parte principal--

initial begin:main

	$display("\nGuia 05 - exercicio 01 - Paulo Henrique - 412765");
	$display("\nTeste Full Adder 4 Bits gate");
	$display("\n a + b = s");

	$monitor("%4b + %4b = %4b", a, b, soma);
	for(a = 0; a <= 15; a = a + 1)
		begin
#1			$monitor("%4b + %4b = %4b", a, b, soma);
		for(b = 0; b <= 15; b = b + 1)
			begin
#1				$monitor("%4b + %4b = %4b", a, b, soma);
			end
		end
	
	
end //--fim parte principal--

endmodule //--fim	test Full Adder 4bits gate
	