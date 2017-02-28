module NOR (s0, a, b);
input a,b;
output s0;

assign s0 = (~(a|b));

endmodule // NOR

module NOTNOR ( s0, a );
input a;
output s0;

NOR nor1 ( s0, a, a );
 
endmodule //NOTNOR 

module ANDNOR ( s0, a, b );
input a, b;
output s0;
wire w1,w2;

NOR nor1 ( w1, a, a );
NOR nor2 ( w2, b, b );
NOR nor3 ( s0, w1, w2 );
 
endmodule //ANDNOR

module NANDNOR ( s0, a, b );
input a, b;
output s0;
wire w1;

ANDNOR andnor1 ( w1, a, b );
NOTNOR notnor1 ( s0, w1 );

endmodule // NANDNOR
 
// ---------------------
// -- teste
// ---------------------

module testNANDNOR;

reg a,b;
wire sai0;

 NANDNOR nandnor1 ( sai0, a,b );
 initial begin  
 	   $display("Guia 02 - Ex05 - Tabela verdade NAND usando NOR");
      $display("Test NANDNOR");
      $display("\na  b  = saída\n");
      a=0; b=0;
      $monitor("%b %b = %b", a, b, sai0);
  #1  b=1;
  #1	a=1; b=0;
  #1	b=1;
  		
end 
endmodule // testNANDNOR