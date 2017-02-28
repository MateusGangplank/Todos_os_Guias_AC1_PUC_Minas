// --------------------------------
// Guia 02 - Exercicio 01
// Porta OR_NAND
// Nome: Marco Antonio Maciel Belo
// Matricula: 0410796				
// --------------------------------

// --------------------------------
// -- NAND
// --------------------------------

module nandgate (s, p, q);
 output s;
 input  p, q;

 assign s = ~(p & q);

endmodule // fim do module

// --------------------------------
// -- OR_NAND
// --------------------------------

module orgate (s, p, q);
 output s;
 input  p, q;
 wire temp1,temp2;
 
 nandgate nand1(temp1, p, p);
 nandgate nand2(temp2, q, q);
 nandgate nand3(s, temp1, temp2);

endmodule // fim do module

// ---------------------
// -- TEST OR_NAND
// ---------------------

module testOR_NAND;
 reg   a, b;
 wire  s;

 // instancia
 orgate OR1(s, a, b);
 
 initial begin
 	a = 0; b = 0;
 end
 
 // parte principal
 initial begin
      $display("Guia 02 - Exercicio 1");
		$display("\nMarco Antonio M. Belo - 410796");
      $display("\nTest OR_NAND gate");
      $display("\na & b = s\n");
		$monitor("%b & %b = %b", a,b,s);
		
		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1; 
end

endmodule // fim do module