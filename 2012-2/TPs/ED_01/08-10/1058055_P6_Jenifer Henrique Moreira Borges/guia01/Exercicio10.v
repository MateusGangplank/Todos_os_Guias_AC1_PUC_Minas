// -------------------------
// Exercicio10 - OR
// Nome: Jenifer Henrique
// Matricula: 427420
// ------------------------- 
 
// ------------------------- 
// -- or gate 
// ------------------------- 
module orgate ( output s, input  p, input  q);
 
 assign s = p | q;
  
endmodule // orgate

module orgate4 ( output s, input  p, input  q, input r, input t);
 wire y, z;
 orgate OR1 (y, p, q);
 orgate OR2 (z, r, t);
 
 assign s = y | z;
  
endmodule // orgate

 
// --------------------- 
// -- test or gate 
// --------------------- 
module testorgate; 
// ------------------------- dados locais 
   reg   a, b, c, d; // definir registradores
   wire  s;    // definir conexao (fio)
// ------------------------- instancia 
   orgate4 OR3 (s, a, b, c, d);
// ------------------------- preparacao
   initial begin:start
                   // atribuicao simultanea
                   // dos valores iniciais
      a=0; b=0; c=0; d=0;
   end
  
// ------------------------- parte principal 
 
   initial begin 
      $display("Exercicio10 - Jenifer Henrique - 427420");
      $display("Test OR gate"); 
      $display("\na | b | c | d = s\n");
      $monitor("%b | %b | %b | %b = %b", a, b, c, d, s);
      a = 0; b=0; c=0; d=0;
  #1  a = 0; b=0; c=0; d=1;
  #1  a = 0; b=0; c=1; d=0;
  #1  a = 0; b=0; c=1; d=1;
  #1  a = 0; b=1; c=0; d=0;
  #1  a = 0; b=1; c=0; d=1;
  #1  a = 0; b=1; c=1; d=0;
  #1  a = 0; b=1; c=1; d=1;
  #1  a = 1; b=0; c=0; d=0;
  #1  a = 1; b=0; c=0; d=1;
  #1  a = 1; b=0; c=1; d=0;
  #1  a = 1; b=0; c=1; d=1;
  #1  a = 1; b=1; c=0; d=0;
  #1  a = 1; b=1; c=0; d=1;
  #1  a = 1; b=1; c=1; d=0;
  #1  a = 1; b=1; c=1; d=1;

 end 
 
endmodule // testorgate