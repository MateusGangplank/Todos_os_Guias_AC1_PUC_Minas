/*
 * Pontificia Universidade Católica de Minas Gerais
 * Instituto de Ciências Exatas e Informática
 * Arquitetura de Computadores - Exemplo0021
 * Belo Horizonte 26 de Fevereiro de 2013
 * Aluna: Izabela Caldeira Borges
 * Matricula: 463243
 */ 
 
 
 // ----------------
 // -- BASE
 // -- test number system 
 // ----------------
 
 module test_base_01; 
 // ---------------- definir dados
 	reg [2:0] a;
	reg [3:0] b;
	reg [4:0] c;
	reg [4:0] d;
 	
 // --------------- parte principal
 	initial begin
	
		a = 0;	b = 0;	c = 0;	
	end
	
 // --------------- parte principal
 	initial begin:main
		$display("Exemplo 0021 - Izabela Caldeira Borges - 463243");
		$display("Test number system"); 
			a = 5; 
			b = 10; 
			c = 15; 
			d = 20; 
		$display("\nPositive value"); 
		$display("a = %d = %3b", a, a); 
		$display("b = %d = %4b", a, a); 
		$display("c = %d = %5b", a, a); 
		$display("b = %d = %4b", b, b); 
		$display("c = %d = %5b", c, c); 
		$display("d = %d = %5b", d, d); 
		$display("d = %d = %5o", d, d); 
		$display("d = %d = %5h", d, d);  
					
	end
	
 endmodule // test_base