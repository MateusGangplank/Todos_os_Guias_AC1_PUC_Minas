// ------------------------- 
// Exercicio01-09 - OR com 2 portas e 3 entradas
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
reg a, b, c; // definir registradores 
wire s1, s; // definir conexao (fio) 
// ------------------------- instancia 
orgate OR1 (s1, a, b); 
orgate OR2 (s, s1, c);
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0; c=0;
end 
// ------------------------- parte principal 
initial begin 
$display("Exercicio01-09 - Lucas Siqueira Chagas - 380783"); 
$display("Test OR gate com 2 portas de 2 entradas"); 
$display("\na | b | c = s\n"); 
$monitor("(%b | %b | %b ) = %b", a, b, c, s);
#1 a=0; b=0; c=0; 
#1 a=0; b=0; c=1;
#1 a=0; b=1; c=0;
#1 a=0; b=1; c=1;
#1 a=1; b=0; c=0;
#1 a=1; b=0; c=1;
#1 a=1; b=1; c=0;
#1 a=1; b=1; c=1;

end 
endmodule