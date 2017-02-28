// Guiaa 01
// Nome:Raphaela Fernanda Silva
// Matricula: 420141



// NANDEX

module NANDEX (s, a, b, c);
output s;
input a, b, c;

assign s = ~(a & b & c);

endmodule







// TESTE NANDEX

module testeNANDEX;
reg a, b, c;
wire s;

NANDEX NAND1 (s, a, b, c); 

initial begin:start

 a=0; b=0; c=0;
 
 end
 
 
 
 initial begin : main
 
 $display("Guia 01 - Raphaela Fernanda Silva - 420141");
 $display("Teste NANDEX");
 $display(" s = ~(a & b & c) ");
 #1 $display(" %b     %b   %b   %b  ",s,a,b,c);
 #1 a=0; b=0; c=1;
 #1 $display(" %b     %b   %b   %b  ",s,a,b,c);
 #1 a=0; b=1; c=0;
 #1 $display(" %b     %b   %b   %b  ",s,a,b,c);
 #1 a=0; b=1; c=1;
 #1 $display(" %b     %b   %b   %b  ",s,a,b,c);
 #1 a=1; b=0; c=0;
 #1 $display(" %b     %b   %b   %b  ",s,a,b,c);
 #1 a=1; b=0; c=1;
 #1 $display(" %b     %b   %b   %b  ",s,a,b,c);
 #1 a=1; b=1; c=0;
 #1 $display(" %b     %b   %b   %b  ",s,a,b,c);
 #1 a=1; b=1; c=1;
 #1 $display(" %b     %b   %b   %b  ",s,a,b,c);
 
 end
 
 endmodule