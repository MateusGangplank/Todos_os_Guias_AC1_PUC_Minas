// Guia 02
// Nome: Raphaela Fernanda Silva
// Matricula: 420141

//PORTANAND 

module PORTANAND (s, g, h, i);
output s;
input g, h, i;

assign s = ~( g & h & i);

endmodule




module testeNAND;
reg g;
wire s;

PORTANAND NAND1(s, g, g, g); 

initial begin:start

 g=0;
 
 end
 
 
 
 initial begin 
 
 $display("Guia 02 - Raphaela Fernanda Silva - 420141");
 $display("Teste PORTANAND");
 $display("~g = s");
 $monitor(" %b   %b", g,s);
 
     
 end
 
 endmodule
