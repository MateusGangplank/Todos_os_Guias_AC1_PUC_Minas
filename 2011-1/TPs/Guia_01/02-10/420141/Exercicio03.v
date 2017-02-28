// Guiaa 01
// Nome:Raphaela Fernanda Silva
// Matricula: 420141




// XNOREX

module XNOREX (s, g, h, i, j);
output s;
input g, h, i, j;

assign s = ~(g ^ h ^ i ^ j);

endmodule




// TESTE XNOREX

module testeXNOREX;
reg g, h, i, j;
wire s;

XNOREX XNOR1 (s, g, h, i, j); 

initial begin:start

 g=0; h=0; i=0; j=0;
 
 end
 
 
 
 initial begin : main
 
 $display("Guia 01 - Raphaela Fernanda Silva - 420141");
 $display("Teste XNOREX");
 $display(" s = ~(g ^ h ^ i ^ j) ");
 #1 $display(" %b     %b   %b   %b   %b  ",s,g,h,i,j);
 #1 g=0; h=0; i=0; j=1;
 #1 $display(" %b     %b   %b   %b   %b  ",s,g,h,i,j);
 #1 g=0; h=0; i=1; j=0;
 #1 $display(" %b     %b   %b   %b   %b  ",s,g,h,i,j);
 #1 g=0; h=0; i=1; j=1;
 #1 $display(" %b     %b   %b   %b   %b  ",s,g,h,i,j);
 #1 g=0; h=1; i=0; j=0;
 #1 $display(" %b     %b   %b   %b   %b  ",s,g,h,i,j);
 #1 g=0; h=1; i=0; j=1;
 #1 $display(" %b     %b   %b   %b   %b  ",s,g,h,i,j);
 #1 g=0; h=1; i=1; j=0;
 #1 $display(" %b     %b   %b   %b   %b  ",s,g,h,i,j);
 #1 g=0; h=1; i=1; j=1;
 #1 $display(" %b     %b   %b   %b   %b  ",s,g,h,i,j);
 #1 g=1; h=0; i=0; j=0;
 #1 $display(" %b     %b   %b   %b   %b  ",s,g,h,i,j);
 #1 g=1; h=0; i=0; j=1;
 #1 $display(" %b     %b   %b   %b   %b  ",s,g,h,i,j);
 #1 g=1; h=0; i=1; j=0;
 #1 $display(" %b     %b   %b   %b   %b  ",s,g,h,i,j);
 #1 g=1; h=0; i=1; j=1;
 #1 $display(" %b     %b   %b   %b   %b  ",s,g,h,i,j);
 #1 g=1; h=1; i=0; j=0;
 #1 $display(" %b     %b   %b   %b   %b  ",s,g,h,i,j);
 #1 g=1; h=1; i=0; j=1;
 #1 $display(" %b     %b   %b   %b   %b  ",s,g,h,i,j);
 #1 g=1; h=1; i=1; j=0;
 #1 $display(" %b     %b   %b   %b   %b  ",s,g,h,i,j);
 #1 g=1; h=1; i=1; j=1;
 #1 $display(" %b     %b   %b   %b   %b  ",s,g,h,i,j);
 
  
 end
 
 endmodule