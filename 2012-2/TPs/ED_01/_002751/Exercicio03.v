// ------------------------- 
//--Construir a tabela_verdade para a porta XNOR com 2 entradas. 
//--Usar operador ( ~(a^b) ) na definição do módulo.    
//----------------------------- 
// Exercicio03 - XNOR 
// Nome: Milton costa teles da silva
// Matricula: 002751
// ------------------------- 
// ------------------------- 
// -- xnor gate 
// -------------------------
module xnorgate ( output s, input a, input b); 
 assign s = ( ~(a^b) )  ; 
endmodule // xnorgate 
// --------------------- 
// -- test xnor gate 
// --------------------- 
module testxnorgate; 
// ------------------------- dados locais 
  reg a,b; // definir registradores 
  wire s; // definir conexao (fio) 
// ------------------------- instancia 
  xnorgate XNOR1 (s, a, b); 
// ------------------------- preparacao 
  initial begin:start 
    a=0;b=0; 
  end 
// ------------------------- parte principal 
  initial begin 
    $display("Exercicio03 -  Milton teles da silva - 002751"); 
    $display("Test XNOR gate"); 
    $display("a  ~^ b = s"); 
    $monitor("%b  ~^ %b = %b",a, b ,s);
    #1 a=1; b=0; //valores decimais 
    #1 a=0; b=1;
    #1 a=1; b=1; 
  end 
endmodule // testxnorgate 
