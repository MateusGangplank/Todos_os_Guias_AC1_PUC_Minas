//Vinicius dos Santos Bordoni 365595


module NAND (s0, a, b);
input a,b;
output s0;

assign s0 = (~(a&b));

endmodule // NAND

module ORNAND ( s0, a, b );
input a, b;
output s0;
wire w1,w2;

NAND nand1 ( w1, a, a );
NAND nand2 ( w2, b, b );
NAND nand3 ( s0, w1, w2 );
 
endmodule //ORNAND 
// ---------------------
// -- testes
// ---------------------

module testORNAND;

reg a,b;
wire sai0;

 ORNAND ornand1 ( sai0, a,b );
 initial begin  
 	   $display("Guia 02 - Ex01 - Tabela verdade OR usando NAND");
      $display("Test ORNAND");
      $display("\na  b  = saida\n");
      a=0; b=0;
      $monitor("%b %b = %b", a, b, sai0);
  #1  b=1;
  #1	a=1; b=0;
  #1	b=1;
  			
end 
endmodule // testORNAND



