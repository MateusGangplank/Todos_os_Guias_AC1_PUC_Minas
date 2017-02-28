//---------- Exercicio01 --------------
//-- Ana Carolina Conceição de Jesus --
//-- Matricula 449517
//-------------------------------------

// ------------------------------------
//---------- exercicio01 --------------
//-------------------------------------

module exercicio01;
//--------------- dados
reg[5:0] a;
reg [5:0] b;
reg [4:0] sa;
reg [4:0] sb;
reg [2:0] sc;
reg [3:0] sd;
reg [4:0] se;


initial begin: main

		$display("Exercicio 01 - Ana Carolina - 449517");
		$display("\nExecutar operacoes");
		
		$display ("\n Letra a : 3+14");
		
	a = 3;
	b = 14;
	sa = 3+14;
	
		$display("resposta = %b",sa);
		
		$display ("\n Letra b : 3 * 8");

	a = 3;
	b = 8;
	sb = 3 * 8;
		
		$display("resposta = %b",sb);
		
		$display ("\n Letra c : 33/5");
	
	a = 33;
	b = 5;
	sc = 33/5;
	
		$display("resposta = %b",sc);
		
		$display ("\n Letra d : 25-11");
	
	a = 25;
	b = 11;
	sd = 25-11;
	
		$display("resposta = %b",sd);
		
		$display("\n Letra e : 2 * 8 + 7-1");
	
	a = 2 * 8;
	b = 7-1;
	se = a+b;
	
		$display("resposta = %b",se);

end

endmodule
