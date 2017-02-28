module NAND (s0, a, b);
input a,b;
output s0;

assign s0 = (~(a&b));

endmodule // NAND

module ORNAND ( s0, a, b );
input a, b;
output s0;
wire w1, w2;

NAND nand1 ( w1, a, a );
NAND nand2 ( w2, b, b );
NAND nand3 ( s0, w1, w2 );

endmodule // ORNAND

module NOTNAND ( s0, a );
input a;
output s0;

NAND nand1 ( s0, a, a );

endmodule // NOTNAND

module NORNAND ( s0, a, b );
input a, b;
output s0;
wire w1;

ORNAND ornand1 ( w1, a, b );
NOTNAND notnand2 ( s0, w1 );
 
endmodule //NORNAND 
// ---------------------
// -- test NORNAND
// ---------------------

module testNORNAND;

reg a,b;
wire sai0;

 NORNAND nornand1 ( sai0, a,b );
 initial begin  
 	   $display("Guia 02 - Ex04 - Tabela verdade NOR usando NAND");
      $display("Test NORNAND");
      $display("\na  b  = saida\n");
      a=0; b=0;
      $monitor("%b %b = %b", a, b, sai0);
  #1  b=1;
  #1	a=1; b=0;
  #1	b=1;
  		
end 
endmodule // testNORNAND