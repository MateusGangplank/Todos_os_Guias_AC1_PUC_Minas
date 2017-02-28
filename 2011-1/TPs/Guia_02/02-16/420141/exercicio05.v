// Guia 02 - EXTRA
// Nome: Raphaela Fernanda Silva
// Matricula: 420141




//PORTANOR

module PORTANOR (s, m, n, o);
output s;
input m, n, o;

assign s = ~( m | n | o);

endmodule




module testeNOR;
reg m, n, o;
wire s1, s2, s3, s4, s;

PORTANOR NOR1(s1, m, m, m); 
PORTANOR NOR2(s2, n, n, n);
PORTANOR NOR3(s3, o, o, o);
PORTANOR NOR4(s4, s1, s2, s3);
PORTANOR NOR5(s, s4, s4, s4);

initial begin:start

 m=0; n=0; o=0;
 
 end
 
 
 
 initial begin : main
 
 $display("Guia 02 - Raphaela Fernanda Silva - 420141");
 $display("Teste PORTANOR");
 $display("m & n & o = s ");
 $monitor("%b   %b   %b = %b", m, n, o, s);
 
  #1  m=0; n=0; o=1;
  #1  m=0; n=1; o=0;
  #1  m=0; n=1; o=1;
  #1  m=1; n=0; o=0;
  #1  m=1; n=0; o=1;
  #1  m=1; n=1; o=0;
  #1  m=1; n=1; o=1;
   
 end
 
 endmodule
