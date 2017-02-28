/*
 * Pontificia Universidade Católica de Minas Gerais
 * Instituto de Ciências Exatas e Informática
 * Arquitetura de Computadores - Exemplo0029
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
 	reg [7:0] a; 
	reg [6:0] b; 
	reg [5:0] c; 
	reg [4:0] d;
	reg [7:0] e;
 	
  // --------------- parte principal
 	initial begin:main
		$display("Exemplo 0029 - Izabela Caldeira Borges - 463243");
		$display("Test number system"); 
			
			a = 'b101011 + ~'b1001;
			b = 'b10011 + ~'o15;
			c = 'o35 + ~'hC;
			d = 'hBA + ~'hB;
			e = ~'o24 + 1;

		$display("\nPositive Value");
		$display("a = %d = %b", a, a);
		$display("b = %d = %b", b, b);
		$display("c = %d = %b", c, c);
		$display("d = %d = %b", d, d);
		$display("e = %d = %b", e, e);
					
	end
	
 endmodule // test_base