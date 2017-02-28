// -------------------------
// Exercicio1
// Nome: Gustavo Barbosa
// Matricula: 427410

module operacoes; 
//definir dados
 reg [4:0] a;
 reg [4:0] b;
 reg [3:0] c;
 reg [3:0] d;
 reg [3:0] e;

initial begin
//parte principal
   $display("Exercicio1 - Gustavo Barbosa - 427410");
   $display("Operacoes resultando em binario ");
   
   a = 2+15;
   $display("\na = 2+15");
   $display("a = %d = %5b", a, a);

   b = 3*8;
   $display("\nb = 3*8");
   $display("b = %d = %5b", b, b);

   c = 32/3;
   $display("\nc = 32/3");
   $display("c = %d = %4b", c, c);

   d = 21-11;
   $display("\nd = 21-11");
   $display("d = %d = %4b", d, d);
   
   e = 2*5+6-1;
   $display("\ne = 2*5+6-1");
   $display("e = %d = %4b", e, e);

  end
endmodule
