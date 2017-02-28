//------------ Exercicio 02 - ED 02 --------
//-- Ana Carolina Conceição de Jesus -------
//-- Matricula 449517 ----------------------
//------------------------------------------

//------------------------------------------
//----------- Exercicio 02 - ED 02 ---------
//------------------------------------------

module exercicio02;

reg[5:0]a;
reg[5:0]b;
reg[9:0]c;
reg[9:0]d;
reg[6:0]sa;
reg[5:0]sb;
reg[1:0]sc;
reg[6:0]sd;
reg[9:0]se;

initial begin : main

	$display("Exercicio 02 - ED 02 - Ana Carolina - 449517");
	$display("Executar as operaçoes");
	
	$display("\nLetra a : 100110(2) + 11011(2)");
	
		a = 6'b100110;
		b = 5'b11011;
		sa = a+b;
		
	$display("resposta = %b",sa);
	
	$display("\nLetra b : 11101(2) + 25(8)");
	
		a = 5'b11101;
		b = 5'b10101;
		sb = a+b;
	
	$display("resposta = %b",sb);
	
	$display("\nLetra c : 1234(8) / 4C(16)");
	
	a = 'o1234;
	b = 'h4C;
	sc = a/b;
	
	$display("resposta = %b",sc);
	
	$display("\nLetra d :1BA(16) - 101110011(2)");
	
	c = 'h1BA;
	d = 9'b101110011;
	sd = c - d;

	$display("resposta = %b",sd); 
	
	$display("\nLetra e :25 * 32(8) + 8A(16)");
	
	c = 'd25 * 'o32;
	d = 'h8A;

	se = c+d;
	
	$display("resposta = %b",se);
	
end 

endmodule