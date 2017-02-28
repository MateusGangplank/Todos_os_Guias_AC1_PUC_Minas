// Guia 02
// Nome: Raphaela Fernanda Silva
// Matricula: 420141




//PORTANOR

module PORTANOR (s, d, e, f);
output s;
input d, e, f;

assign s = ~( d | e | f);

endmodule




module testeNOR;
reg d, e, f;
wire s1, s2, s3, s;

PORTANOR NOR1(s1, d, d, d); 
PORTANOR NOR2(s2, e, e, e);
PORTANOR NOR3(s3, f, f, f);
PORTANOR NOR4(s, s1, s2, s3);

initial begin:start

 d=0; e=0; f=0;
 
 end
 
 
 
 initial begin : main
 
 $display("Guia 02 - Raphaela Fernanda Silva - 420141");
 $display("Teste PORTANOR");
 $display("d & e & f = s ");
 $monitor("%b   %b   %b = %b", d, e, f, s);
 
  #1  d=0; e=0; f=1;
  #1  d=0; e=1; f=0;
  #1  d=0; e=1; f=1;
  #1  d=1; e=0; f=0;
  #1  d=1; e=0; f=1;
  #1  d=1; e=1; f=0;
  #1  d=1; e=1; f=1;
   
 end
 
 endmodule
