//----------------------------------------------
//----Arquitetura de computador-----------------
//----guia 05 - exercicio 02--------------------
//----Nome: Paulo Henrique de Almeida Amorim----
//----Matricula: 412765-------------------------

//--Half Difference module--
module halfDifference (s1, s2, p, q);

	output s1, s2;
	input p, q;
	wire s3;
	
	not NOT1(s3, p);
	and AND1(s2, s3, q);	
	xor XOR1(s1, p, q);
	
endmodule

//--Full Difference module--
module fullDifference(s1, s2, s3, p, q);
	output s2, s3;
	input s1, p, q;
	wire s4, s5, s6;
	
	halfDifference HALF1(s4, s5, p, q);
	halfDifference HALF2(s6, s2, s5, s1);
	or OR1(s3, s4, s6);
	
endmodule

//--Full Difference 4 bits module--

module fullDifference3bits(diferenca, cout, p, q);
	input [3:0]p, q;
	output [2:0]diferenca;
	output cout;
	wire s1, s2;
	
	halfDifference HD(diferenca[0], s1, p[0], q[0]);
	fullDifference FD1(s1, diferenca[1], s2, p[1], q[1]);
	fullDifference FD2(s2, diferenca[2], cout, p[2], q[2]);
	
endmodule

//--Teste Full Difference 4 bits--
	
module TestefullDifference3bits;
	reg [3:0]a, b;
	wire [2:0]diferenca;
	wire cout;

//--instancia--		
	fullDifference3bits FD3B(diferenca, cout, a, b);

initial begin:start
	a = 3'b000;
	b = 3'b000;
 
end
	
//--parte principal--

initial begin:main

	$display("\nGuia 05 - exercicio 02 - Paulo Henrique - 412765");
	$display("\nTeste Full Difference 3 Bits gate");
	$display("\n a - b = s");

	for(a = 0; a <= 7; a = a + 1)
		begin
#1			$monitor("%3b - %3b = %3b", a, b, diferenca);
		for(b = 0; b <= 7; b = b + 1)
			begin
#1				$monitor("%3b - %3b = %3b", a, b, diferenca);
			end
		end
	
	
end //--fim parte principal--

endmodule //--fim	test Full Difference 3bits gate
	