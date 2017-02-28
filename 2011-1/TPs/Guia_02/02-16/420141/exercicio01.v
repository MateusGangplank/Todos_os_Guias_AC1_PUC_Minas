// Guia 02
// Nome: Raphaela Fernanda Silva
// Matricula: 420141




// PORTANAND

module PORTANAND (s, a, b, c);
output s;
input a, b, c;

assign s = ~( a & b & c);

endmodule




module testeNAND;
reg a, b, c;
wire s1, s2, s3, s;
                               // SE POSSIVEL, DEFINIR EM OUTRO MODULO
PORTANAND NAND1(s1, a, a, a);
PORTANAND NAND2(s2, b, b, b);
PORTANAND NAND3(s3, c, c, c);
PORTANAND NAND4(s, s1, s2, s3);
 
initial begin:start

 a=0; b=0; c=0;
 
 end
 
 
 
 initial begin : main
 
 $display("Guia 02 - Raphaela Fernanda Silva - 420141");
 $display("Teste PORTANAND");
 $display("a | b | c = s");
 $monitor("%b   %b   %b = %b", a, b, c, s);
 
  #1  a=0; b=0; c=1;
  #1  a=0; b=1; c=0;
  #1  a=0; b=1; c=1;
  #1  a=1; b=0; c=0;
  #1  a=1; b=0; c=1;
  #1  a=1; b=1; c=0;
  #1  a=1; b=1; c=1;

 
 end
 
 endmodule