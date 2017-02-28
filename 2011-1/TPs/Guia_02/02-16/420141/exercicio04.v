// Guia 02 - EXTRA
// Nome: Raphaela Fernanda Silva
// Matricula: 420141




// PORTANAND

module PORTANAND (s, j, k, l);
output s;
input j, k, l;

assign s = ~( j & k & l);

endmodule




module testeNAND;
reg j, k, l;
wire s1, s2, s3, s4, s;

PORTANAND NAND1(s1, j, j, j);
PORTANAND NAND2(s2, k, k, k);
PORTANAND NAND3(s3, l, l, l);
PORTANAND NAND4(s4, s1, s2, s3);
PORTANAND NAND5(s, s4, s4, s4);
 
initial begin:start

 j=0; k=0; l=0;
 
 end
 
 
 
 initial begin : main
 
 $display("Guia 02 - Raphaela Fernanda Silva - 420141");
 $display("Teste PORTANAND");
 $display("~(j | k | l) = s");
 $monitor("  %b   %b   %b  = %b", j, k, l, s);
 
  #1  j=0; k=0; l=1;
  #1  j=0; k=1; l=0;
  #1  j=0; k=1; l=1;
  #1  j=1; k=0; l=0;
  #1  j=1; k=0; l=1;
  #1  j=1; k=1; l=0;
  #1  j=1; k=1; l=1;

 
 end
 
 endmodule