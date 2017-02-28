// Guiaa 01 - EXTRA
// Nome:Raphaela Fernanda Silva
// Matricula: 420141




// XOREX

module XOREX (s, k, l);
output s;
input k, l;

assign s = (k ^ l);

endmodule







// TESTE XOREX

module testeXOREX;
reg k, l;
wire s;

XOREX XOR1 (s, k, l); 

initial begin:start

 k=0; l=0; 
 
 end
 
 
 
 initial begin : main
 
 $display("Guia 01 - Raphaela Fernanda Silva - 420141");
 $display("Teste XOREX");
 $display(" s = (k ^ l) ");
 #1 $display(" %b     %b  ",s,k,l);
 #1 k=0; l=1;
 #1 $display(" %b     %b  ",s,k,l);
 #1 k=1; l=0; 
 #1 $display(" %b     %b  ",s,k,l);
 #1 k=1; l=1; 
 #1 $display(" %b     %b  ",s,k,l);
 
 
 end
 
 endmodule