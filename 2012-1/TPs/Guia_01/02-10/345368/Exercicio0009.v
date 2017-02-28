// ------------------------- 
// Exercicio0009 - NOR
// Nome: Marcio Santana Correa 
// Matricula: 345368
// ------------------------- 
// ------------------------- 
// -- and gate1 
// ------------------------- 
module andgate1 ( output s, input p, input q, input r ); 
assign s = p & q & r; 
endmodule // andgate 
// --------------------- 
// -- and gate2 
// --------------------- 
module andgate2 ( output x, input s );
assign x = s & s;
endmodule // andgate

module testandgate;
// ------------------------- dados locais 
reg a;
reg b;
reg c; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
andgate1 AND1 (s, a, b, c);
andgate2 AND2 (x, s);
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0; c=0;
end 
// ------------------------- parte principal 
initial begin 
$display("Exercicio0009 - Marcio Santana Correa 345368"); 
$display("Test AND gate com 3 entradas."); 
$display("\na & b & c = s\n"); 
a=0; b=0; c=0;
$monitor("%b & %b & %b = %b", a, b, c, x); 
#1 a=0; b=0; c=1;
#1 a=0; b=1; c=0;
#1 a=0; b=1; c=1;
#1 a=1; b=0; c=0;
#1 a=1; b=0; c=1;
#1 a=1; b=1; c=0;
#1 a=1; b=1; c=1;
end 
endmodule // testandgate 