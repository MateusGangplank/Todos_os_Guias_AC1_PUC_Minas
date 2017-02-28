// Guiaa 01
// Nome:Raphaela Fernanda Silva
// Matricula: 420141




// NOREX

module NOREX (s, d, e, f);
output s;
input d, e, f;

assign s = ~(d | e | f);

endmodule




// TESTE NOREX

module testeNOREX;
reg d, e, f;
wire s;

NOREX NOR1 (s, d, e, f); 

initial begin:start

 d=0; e=0; f=0;
 
 end
 
 
 
 initial begin : main
 
 $display("Guia 01 - Raphaela Fernanda Silva - 420141");
 $display("Teste NOREX");
 $display(" s = ~(d | e | f) ");
 #1 $display(" %b     %b   %b   %b  ",s,d,e,f);
 #1 d=0; e=0; f=1;
 #1 $display(" %b     %b   %b   %b  ",s,d,e,f);
 #1 d=0; e=1; f=0;
 #1 $display(" %b     %b   %b   %b  ",s,d,e,f);
 #1 d=0; e=1; f=1;
 #1 $display(" %b     %b   %b   %b  ",s,d,e,f);
 #1 d=1; e=0; f=0;
 #1 $display(" %b     %b   %b   %b  ",s,d,e,f);
 #1 d=1; e=0; f=1;
 #1 $display(" %b     %b   %b   %b  ",s,d,e,f);
 #1 d=1; e=1; f=0;
 #1 $display(" %b     %b   %b   %b  ",s,d,e,f);
 #1 d=1; e=1; f=1;
 #1 $display(" %b     %b   %b   %b  ",s,d,e,f);
 
 end
 
 endmodule