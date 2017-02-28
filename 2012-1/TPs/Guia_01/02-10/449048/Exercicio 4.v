// ------------------------- 
// Exercicio 0004 
// Nome: Miller 
// Matricula: 449048 
// ------------------------- 
// -- NAND com De Morgan --

module portaNANDmorgan ( output x, input m, input n );
// --   x = saida, m e n sao entradas.

assign x = (~m|~n);
//-- De Morgan: (a'+b')=(a.b)'

endmodule //-- fim do modulo portaNANDmorgan.

module aux; //-- modulo que ira preparar as variaveis para execucao.

reg y, z;
//-- variaveis de entrada.

wire x;
//-- variavel de saida.

portaNANDmorgan executor(x, y, z);

initial begin:start
y=0; z=0;
end

initial begin

$display("Miller - 449048");
$display("Porta NAND - De Morgan");
$display(" ");
$display("De Morgan: (a' + b') = (a.b)' ");

$monitor("%b & %b = %b", y, z, x);

#1
#1 y=1;
#1 y=0; z=1;
#1 y=1;

end
endmodule
// -- fim do modulo NAND De Morgan.

