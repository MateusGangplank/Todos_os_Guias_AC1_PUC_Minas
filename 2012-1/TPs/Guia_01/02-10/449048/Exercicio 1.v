// ------------------------- 
// Exercicio 0001 
// Nome: Miller 
// Matricula: 449048 
// ------------------------- 
// --------- NAND ----------

module portaNAND ( output x, input m, input n );
// --   x = saida, m e n sao entradas.

assign x = ~(m&n);
//-- dependencias, x depende de m e n. O sinal  " ~ "  indica negacao.

endmodule //-- fim do modulo nandgate.

module aux; //-- modulo que ira preparar a funcao para execucao.

reg y, z;
//-- registradores, vao ser meus valores de entrada.

wire x;
//-- conexao(fio), vai ser a saida.

portaNAND executor(x, y, z);
//-- instancia, ira utilizar o primeiro modulo que foi usado.


initial begin:start
//--incia o programa, irei atribuir valores as entradas, simultaneamente.
y=0; z=0;
end
//-- encerra a atribuicao de valores as entradas.


initial begin
//-- Agora iniciaremos a tarefa principal do programa,
//-- negar/inverter os resultados da porta AND:

$display("Miller - 449048");
$display("Porta NAND");
$display(" ");

#1 $display("%b & %b = %b", y, z, x);

y=1; //z=0;--este valor de z ja esta ajustado.
#1 $display("%b & %b = %b", y, z, x);

y=0; z=1;
#1 $display("%b & %b = %b", y, z, x);

y=1; //z=1;--este valor de z ja esta ajustado.
#1 $display("%b & %b = %b", y, z, x);

end
endmodule//-- fim do aplicativo.

