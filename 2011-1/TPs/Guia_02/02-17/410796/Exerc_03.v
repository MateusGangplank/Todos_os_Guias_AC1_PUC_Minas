// --------------------------------
// Guia 02 - Exercicio 03
// Porta NOT_NAND
// Nome: Marco Antonio Maciel Belo
// Matricula: 0410796				
// --------------------------------

// --------------------------------
// -- NAND
// --------------------------------

module nandgate (s, p);
 output s;
 input  p;

 assign s = ~(p | p);

endmodule // fim do module

// --------------------------------
// -- NOT_NAND
// --------------------------------

module notgate (s, p);
 output s;
 input  p;
 
 nandgate not1(s, p);

endmodule // fim do module

// ---------------------
// -- TEST NOT_NAND
// ---------------------

module testNOT_NAND;
 reg   a;
 wire  s;

 // instancia
 notgate NOT1(s, a);
 
 initial begin
 	a = 0; 
 end
 
 // parte principal
 initial begin
      $display("Guia 02 - Exercicio 3");
		$display("\nMarco Antonio M. Belo - 410796");
      $display("\nTest NOT_NAND gate");
      $display("\n ~a = s\n");
		$monitor(" ~%b = %b", a,s);
		
		#1 a = 1;
end

endmodule // fim do module