// Guiaa 01 - EXTRA
// Nome:Raphaela Fernanda Silva
// Matricula: 420141




// XOREX

module XOREX (s, m, n);
output s;
input m, n;

assign s = (~ m & n | m & ~ n);

endmodule







// TESTE XOREX

module testeXOREX;
reg m, n;
wire s;

XOREX XOR1 (s, m, n); 

initial begin:start

 m=0; n=0; 
 
 end
 
 
 
 initial begin : main
 
 $display("Guia 01 - Raphaela Fernanda Silva - 420141");
 $display("Teste XOREX");
 $display(" s = (~ m & n | m & ~ n) ");
 #1 $display(" %b      %b   %b   %b     %b  ",s,~m,n,m,~n);
 #1 m=0; n=1;
 #1 $display(" %b      %b   %b   %b     %b  ",s,~m,n,m,~n);
 #1 m=1; n=0; 
 #1 $display(" %b      %b   %b   %b     %b  ",s,~m,n,m,~n);
 #1 m=1; n=1; 
 #1 $display(" %b      %b   %b   %b     %b  ",s,~m,n,m,~n);
 
 
 end
 
 endmodule