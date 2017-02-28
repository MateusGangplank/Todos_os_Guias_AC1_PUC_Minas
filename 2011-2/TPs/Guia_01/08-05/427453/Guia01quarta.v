// ------------------------- 
// Guia01quarta - AND 
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453 
// ------------------------- 
module andgate ( output s,
                 input n, 
                 input p, 
                 input q); 
 assign s = ~(~n | ~p | ~q); 
endmodule // andgate 
// --------------------- 
// -- test and gate 
// --------------------- 
module testandgate; 
// ------------------------- dados locais 
  reg a, b, c; // definir registradores 
  wire s; // definir conexao (fio) 
// ------------------------- instancia 
  andgate AND1 (s, a, b, c); 
// ------------------------- preparacao 
  initial begin:start 
   a=0; b=0; c=0;
  end 
// ------------------------- parte principal 
  initial begin 
   $display("Exemplo0003 - Pedro Henrique Vilar Locatelli - 427453"); 
   $display("Test AND gate"); 
   $display("\na & b & c = s\n"); 
   a=0; b=0; c=0; 
#1 $display("%b & %b & %b = %b", a, b, c, s); 
   a=0; b=0; c=1; 
#1 $display("%b & %b & %b = %b", a, b, c, s); 
   a=0; b=1; c=0;
#1 $display("%b & %b & %b = %b", a, b, c, s); 
   a=0; b=1; c=1;
#1 $display("%b & %b & %b = %b", a, b, c, s); 
   a=1; b=0; c=0;
#1 $display("%b & %b & %b = %b", a, b, c, s); 
   a=1; b=0; c=1;
#1 $display("%b & %b & %b = %b", a, b, c, s); 
   a=1; b=1; c=0;
#1 $display("%b & %b & %b = %b", a, b, c, s); 
   a=1; b=1; c=1;
#1 $display("%b & %b & %b = %b", a, b, c, s); 
end 
endmodule // testandgate 
// versão    -    data    -    comentario
// 0.1          03/08/11       (OK). tabela verdade de porta AND