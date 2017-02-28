// ---------------------
// Guia 02 Exercicio 1
// Nome:Álvaro Henrique de Araújo Rungue
// Matricula: 395487
// ---------------------


// parte principal

module exercicio1;

reg [4:0] a;
reg [4:0] b;
reg [3:0] c;
reg [3:0] d;
reg [3:0] e;


 initial begin:main 
 a = 2 + 14;
 b = 3 * 7;
 c = 34 / 3;
 d = 19 - 11;
 e = (2*4) + 6 -1;
 
      $display("Guia 2 - Exercicio: 1 - Alvaro");
      $display("Resposta das somas:");
  
 $display("a = %4b" ,  a );
 $display("b = %4b" ,  b );
 $display("c = %4b" ,  c );
 $display("d = %4b" ,  d );
 $display("e = %4b" ,  e );
      
 end

endmodule // Letra A
