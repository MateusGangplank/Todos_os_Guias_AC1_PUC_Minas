/*
 * Pontificia Universidade Católica de Minas Gerais
 * Instituto de Ciências Exatas e Informática
 * Arquitetura de Computadores - Exemplo0026
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
 	reg [4:0] a; 
	reg [4:0] b; 
	reg [2:0] c; 
	reg [3:0] d;
	reg [4:0] e;
 	
  // --------------- parte principal
 	initial begin:main
		$display("Exemplo 0026 - Izabela Caldeira Borges - 463243");
		$display("Test number system"); 
			
			a = 3 + 14;
			b = 3 * 8;
			c = 33 / 3;
			d = 25 - 11;
			e = 2 * 8 + 7 - 1;

		$display("\nPositive Value");
		$display("a = %d = %5b", a, a);
		$display("b = %d = %5b", b, b);
		$display("c = %d = %3b", c, c);
		$display("d = %d = %4b", d, d);
		$display("e = %d = %5b", e, e);
					
	end
	
 endmodule // test_base