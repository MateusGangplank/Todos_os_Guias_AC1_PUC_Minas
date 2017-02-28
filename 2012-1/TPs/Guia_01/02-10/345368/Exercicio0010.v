// ------------------------- 
// Exercicio0010 - NOR
// Nome: Marcio Santana Correa 
// Matricula: 345368
// ------------------------- 
// ------------------------- 
// -- or gate 1
// ------------------------- 
module orgate1 ( output s, input p, input q, input r ); 
assign s = p | q | r; 
endmodule // orgate 
// --------------------- 
// -- or gate 2
// --------------------- 
module orgate2 ( output x, input s ); 
assign x = s | s; 
endmodule // orgate

module testorgate; 
// ------------------------- dados locais 
reg a, b, c; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
orgate1 OR1 (s, a, b, c);
orgate2 OR2 (x, s);
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0; c=0;
end 
// ------------------------- parte principal 
initial begin 
$display("Exercicio10 - Marcio Santana Correa - 345368"); 
$display("Test OR gate"); 
$display("\na | b | c = s\n"); 
a=0; b=0; c=0;
$monitor("%b | %b | %b = %b", a, b, c, x); 
#1 a=0; b=0; c=1;
#1 a=0; b=1; c=0;
#1 a=0; b=1; c=1;
#1 a=1; b=0; c=0;
#1 a=1; b=0; c=1;
#1 a=1; b=1; c=0;
#1 a=1; b=1; c=1;
end 
endmodule // testorgate 