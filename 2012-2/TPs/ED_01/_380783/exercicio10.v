// ------------------------- 
// Exercicio01-09 - OR com 3 portas e 4 entradas
// Nome: Lucas Siqueira Chagas 
// Matricula: 380783
// ------------------------- 
// ------------------------- 
// -- or gate com 2 portas de 3 entradas
// ------------------------- 
module orgate ( output s, 
input p, 
input q
); 
assign s = p | q; 
endmodule // orgate 
// --------------------- 
// -- test or gate 
// --------------------- 
module testorgate; 
// ------------------------- dados locais 
reg a, b, c, d; // definir registradores 
wire s1, s2, s; // definir conexao (fio) 
// ------------------------- instancia 
orgate OR1 (s1, a, b); 
orgate OR2 (s2, c, d);
orgate OR3 (s, s1, s2);
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0; c=0; d=0;
end 
// ------------------------- parte principal 
initial begin 
$display("Exercicio01-10 - Lucas Siqueira Chagas - 380783"); 
$display("Test OR gate com 2 portas de 4 entradas"); 
$display("\na | b | c | d = s\n"); 
$monitor("(%b | %b | %b | %b) = %b", a, b, c, d, s);
#1 a=0; b=0; c=0; d=0; 
#1 a=0; b=0; c=0; d=1;
#1 a=0; b=0; c=1; d=0;
#1 a=0; b=0; c=1; d=1;
#1 a=0; b=1; c=0; d=0;
#1 a=0; b=1; c=0; d=1;
#1 a=0; b=1; c=1; d=0;
#1 a=0; b=1; c=1; d=1;
#1 a=1; b=0; c=0; d=0; 
#1 a=1; b=0; c=0; d=1;
#1 a=1; b=0; c=1; d=0;
#1 a=1; b=0; c=1; d=1;
#1 a=1; b=1; c=0; d=0;
#1 a=1; b=1; c=0; d=1;
#1 a=1; b=1; c=1; d=0;
#1 a=1; b=1; c=1; d=1;

end 
endmodule