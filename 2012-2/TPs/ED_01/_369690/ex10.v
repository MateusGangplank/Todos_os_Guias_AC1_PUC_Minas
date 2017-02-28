// -------------------------
// Ex10 - OR
// Nome: Gabriel Benjamim de Carvalho
// Matricula: 396690
// -------------------------
// -------------------------
// -- OR gate
// -------------------------

module orgate ( output s, input  p,input  q);
assign s = p | q;
endmodule 

module orfourgate ( output s, input  p,input  q, input r, input t);
output s1, s2;
wire s;
orgate OR1 (s1, p, q);
orgate OR2 (s2, r, t);
orgate OR3 (s, s1, s2);
endmodule
// ---------------------
// -- test OR gate
// ---------------------
module testandgate;
// ------------------------- dados locais
   reg   a, b, c, d; // definir registradores
   wire  s;    // definir conexao (fio)
// ------------------------- instancia
   orfourgate OR1 (s, a, b, c, d);
// ------------------------- preparacao
   initial begin:start
                   // atribuicao simultanea
// dos valores iniciais
      a=0;b=0;c=0;d=0;  
   end// ------------------------- parte principal
   initial begin
         $display("Ex10 - Gabriel Benjamim de Carvalho - 396690");
         $display("Test OR gate");
         $display("\na | b | c | d = s\n");
         $monitor("%b | %b | %b | %b = %b", a, b, c, d, s);
  #1    a=0;b=0;c=0;d=0;		 
  #1    a=0;b=0;c=0;d=1;
  #1    a=0;b=0;c=1;d=0;
  #1    a=0;b=0;c=1;d=1;
  #1    a=0;b=1;c=0;d=0;
  #1    a=0;b=1;c=0;d=1;
  #1    a=0;b=1;c=1;d=0;
  #1    a=0;b=1;c=1;d=1;
  #1    a=1;b=0;c=0;d=0;
  #1    a=1;b=0;c=0;d=1;
  #1    a=1;b=0;c=1;d=0;
  #1    a=1;b=0;c=1;d=1;
  #1    a=1;b=1;c=0;d=0;
  #1    a=1;b=1;c=0;d=1;
  #1    a=1;b=1;c=1;d=0;
  #1    a=1;b=1;c=1;d=1;
  
 
  end
endmodule // testORgate