// ------------------------- 
// Exercicio 0002 
// Nome: Miller 
// Matricula: 449048 
// ------------------------- 
// --------- NOR -----------

module portaNOR(output s, input j, input k);
assign s = ~(j|k);

endmodule // -- fim do modulo portaNOR.

module aux;
reg a, b; // -- entradas.
wire s; // -- saidas

portaNOR severinoquebragralho(s, a, b); // -- ira executar o modulo.

initial begin: start
a=0; b=0;
end

initial begin

$display("Miller - 449048");
$display("Porta NOR");
$display(" ");
$monitor("%b & %b = %b", a, b, s);

#1 a=0; b=0;
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;

end
endmodule //-- fim do aplicativo.