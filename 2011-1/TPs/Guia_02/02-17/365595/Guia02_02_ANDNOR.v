module NOR (s0, a, b);
input a,b;
output s0;

assign s0 = (~(a|b));

endmodule // NOR

module ANDNOR ( s0, a, b );
input a, b;
output s0;
wire w1,w2;

NOR nor1 ( w1, a, a );
NOR nor2 ( w2, b, b );
NOR nor3 ( s0, w1, w2 );
 
endmodule //ANDNOR 
// ---------------------
// -- testes
// ---------------------

module testANDNOR;

reg a,b;
wire sai0;

 ANDNOR andnor1 ( sai0, a,b );
 initial begin  
 	   $display("Guia 02 - Ex02 - Tabela verdade AND usando NOR");
      $display("Test ORNAND");
      $display("\na  b  = saida\n");
      a=0; b=0;
      $monitor("%b %b = %b", a, b, sai0);
  #1  b=1;
  #1	a=1; b=0;
  #1	b=1;
  		
end 
endmodule // testANDNO