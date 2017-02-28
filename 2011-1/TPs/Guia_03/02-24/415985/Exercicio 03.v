// -----------------------
// Guia 03 - Exercicio 03
// Bruno César Lopes Silva
// Matrícula: 415985
// -----------------------

//-- Meia Diferença Usando Nand ---

module testemeiadiferenca;
reg a, b;
wire s1, s2, s3, s4, s, s0;

nand NAND1(s1, a, a);
nand NAND2(s2, b, b);
nand NAND3(s3, s1, b);
nand NAND4(s4, a, s2);
nand NAND5(s, s3, s4);
nand NAND6(s0, s3, s3);


 // parte principal
  initial begin
      $display("Guia 03 - Exercicio 03");
		$display("Bruno Cesar Lopes Silva - 415985");
      $display("Meia Diferenca usando Nand");
      $display("\n a - b = s / vem um\n");
  		a=0; b=0;
		$monitor(" %b - %b = %b / %b", a, b, s, s0);
		#1 a=0; b=1;
		#1 a=1; b=0;
		#1 a=1; b=1;
		
		end
		
	endmodule // testemeiadiferenca