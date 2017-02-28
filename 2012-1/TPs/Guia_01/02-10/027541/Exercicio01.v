// ------------------------- 
//-- Construir a tabela-verdade para a porta NAND com 2 entradas. 
//-- Usar operador ( ~(a&b) ) na definição do módulo. 
//-- Usar $display ().
//----------------------------- 
// Exercicio01 - NAND 
// Nome: Milton costa teles da silva
// Matricula: 002751
// ------------------------- 
// ------------------------- 
// -- nand gate 
// -------------------------
module nandgate ( output s, input p, q); 
  assign s = ( ~(p&q) )  ; 
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
    $display("Exercicio01 -  Milton teles da silva - 002751"); 
    $display("Test NAND gate"); 
    $display("a & b = s");  
    #1 $display("(%b %b) = %b", a, b, s); 
    a=0; b=1; 
    #1 $display("(%b %b) = %b", a, b, s); 
    a=1; b=0; 
    #1 $display("(%b %b) = %b", a, b, s); 
    a=1; b=1; 
    #1 $display("(%b %b) = %b", a, b, s); 
  end 
endmodule // testnandgate 


