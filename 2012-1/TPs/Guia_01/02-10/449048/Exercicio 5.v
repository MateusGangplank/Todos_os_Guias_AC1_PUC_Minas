// ------------------------- 
// Exercicio 0005 
// Nome: Miller 
// Matricula: 449048 
// ------------------------- 
// --- NOR com De Morgan ---

module portaNORtwo ( output x, input m, input n );
// --   x = saida, m e n sao entradas.

assign x = (~m&~n);
//-- De Morgan: (a'+b')=(a.b)'

endmodule //-- fim do modulo portaNORtwo.

module executor; //-- modulo que ira preparar as variaveis para execucao.

reg y, z;
//-- variaveis de entrada.

wire x;
//-- variavel de saida (fio).

portaNORtwo executor(x, y, z);

initial begin:start
y=0; z=0;
end

initial begin

$display("Miller - 449048");
$display("Porta NOR - De Morgan");
$display(" ");
$display("De Morgan: (a' + b') = (a.b)' ");

$monitor("%b & %b = %b", y, z, x);

#1
#1 y=1;
#1 y=0; z=1;
#1 y=1;

end
endmodule
// -- fim do modulo.

