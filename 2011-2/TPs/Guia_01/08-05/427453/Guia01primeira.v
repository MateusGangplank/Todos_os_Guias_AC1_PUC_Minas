// ------------------------- 
// Guia01primeira - NAND 
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453 
// ------------------------- 
module nandgate ( output s, 
                 input p, 
                 input q); 
 assign s = ~(p & q); 
endmodule // nandgate 
// --------------------- 
// -- test nand gate 
// --------------------- 
module testnandgate; 
// ------------------------- dados locais 
  reg a, b; // definir registradores 
  wire s; // definir conexao (fio) 
// ------------------------- instancia 
  nandgate NAND1 (s, a, b); 
// ------------------------- preparacao 
  initial begin:start 
   a=0; b=0; 
  end 
// ------------------------- parte principal 
  initial begin 
   $display("Guia01primeira - Pedro Henrique Vilar Locatelli - 427453"); 
   $display("Test NAND gate"); 
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
endmodule // testnandgate 
// versão    -    data    -    comentario
// 0.1          03/08/11       (OK). tabela verdade de porta NAND