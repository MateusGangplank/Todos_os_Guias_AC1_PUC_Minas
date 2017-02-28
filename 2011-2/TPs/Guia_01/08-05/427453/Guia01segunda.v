// ------------------------- 
// Guia01segunda - NOR 
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453 
// ------------------------- 
module norgate ( output s, 
                input p, q); 
 assign s = ~(p | q); 
endmodule // norgate 
// --------------------- 
// -- test nor gate 
// --------------------- 
module testnorgate; 
// ------------------------- dados locais 
  reg a, b; // definir registradores 
  wire s; // definir conexao (fio) 
// ------------------------- instancia 
norgate NOR1 (s, a, b); 
// ------------------------- preparacao 
  initial begin:start 
   a=0; b=0; 
  end 
// ------------------------- parte principal 
  initial begin 
   $display("Guia01segunda - Pedro Henrique Vilar Locatelli - 427453"); 
   $display("Test NOR gate"); 
   $display("\na & b = s\n");
	$monitor("%b & %b = %b", a, b, s); 
#1 a=0; b=0; 
#1 a=0; b=1; 
#1 a=1; b=0; 
#1 a=1; b=1; 
end 
endmodule // testnorgate 
// versão    -    data    -    comentario
// 0.1          03/08/11       (OK). tabela verdade de porta NOR