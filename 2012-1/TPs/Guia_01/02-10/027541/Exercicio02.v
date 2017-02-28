// ------------------------- 
// --Construir a tabela_verdade para a porta NOR com 2 entradas. 
// -- Usar operador ( ~(a|b) ) na definição do módulo. 
// --Usar $monitor (). 
// ----------------------------- 
// Exercicio02 - NOR 
// Nome: Milton costa teles da silva
// Matricula: 002751
// ------------------------- 
// ------------------------- 
// -- nor gate 
// -------------------------
module norgate ( output s, input a, input b); 
  assign s = ( ~(a|b) ); 
endmodule // norgate 
// --------------------- 
// -- test nor gate 
// --------------------- 
module testnorgate; 
// ------------------------- dados locais 
  reg a,b; // definir registradores 
  wire s; // definir conexao (fio) 
// ------------------------- instancia 
  norgate NOR1 (s, a, b); 
// ------------------------- preparacao 
  initial begin:start 
    a=0;b=0; 
  end 
// ------------------------- parte principal 
  initial begin:main 
    $display("Exercicio02 -  Milton teles da silva - 002751"); 
    $display("Test NOR gate"); 
    $display("\na | b = s\n"); 
    $monitor("%b  %b = %b",a, b ,s);
    #1 a=1; b=0;
    #1 a=0; b=1; 
    #1 a=1; b=1; 

  end 
endmodule // testnorgate 
