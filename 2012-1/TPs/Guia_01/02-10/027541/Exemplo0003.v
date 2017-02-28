// ------------------------- 
// Exemplo0003 - AND 
// Nome: Milton costa teles da silva 
// Matricula: 002751 
// ------------------------- 
// ------------------------- 
// -- and gate 
// ------------------------- 
module andgate ( output s, 
                  input p, 
                  input q); 
  assign s = p & q; 
endmodule // andgate 
// --------------------- 
// -- test and gate 
// --------------------- 
module testandgate; 
// ------------------------- dados locais 
 reg a, b; // definir registradores 
 wire s; // definir conexao (fio) 
// ------------------------- instancia 
 andgate AND1 (s, a, b); 
// ------------------------- preparacao 
 initial begin:start
            // atribuicao simultanea 
            // dos valores iniciais  
 a=0; b=0; 
end
// ------------------------- parte principal 
   initial begin 
      $display("Exemplo0003 - Milton costa teles da silva - 002751"); 
      $display("Test AND gate"); 
      $display("\na & b = s\n"); 
      a=0; b=0; 
   #1 $display("%b & %b = %b", a, b, s); 
      a=0; b=1; 
   #1 $display("%b & %b = %b", a, b, s); 
      a=1; b=0; 
   #1 $display("%b & %b = %b", a, b, s); 
      a=1; b=1; 
   #1 $display("%b & %b = %b", a, b, s); 
end 
endmodule // testandgate  