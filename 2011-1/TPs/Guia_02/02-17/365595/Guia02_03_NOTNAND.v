module NAND (s0, a,b);
input a,b;
output s0;

assign s0 = (~(a|b));

endmodule // NAND

module NOTNAND ( s0, a );
input a;
output s0;

NAND noa1 ( s0, a, a );
 
endmodule //NOTNAND 
// ---------------------
// -- testes
// ---------------------

module testNOTNAND;

reg a;
wire sai0;

 NOTNAND notnand1 ( sai0, a );
 initial begin  
 	   $display("Guia 02 - Ex03 - Tabela verdade NOT usando NAND");
      $display("Test ORNAND");
      $display("\na  b  = saida\n");
      a=0;
      $monitor("%b = %b", a, sai0);
  #1	a=1;  		
  
end 
endmodule //