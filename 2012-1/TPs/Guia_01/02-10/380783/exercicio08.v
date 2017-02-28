// ------------------------- 
// Exercicio01-08 - AND com 3 portas
// Nome: Lucas Siqueira Chagas 
// Matricula: 380783
// ------------------------- 
// ------------------------- 
// -- and gate com 3 portas
// ------------------------- 
module andgate ( output s, 
input p, 
input q,
input r
); 
assign s = p & q & r; 
endmodule // andgate 
// --------------------- 
// -- test and gate 
// --------------------- 
module testandgate; 
// ------------------------- dados locais 
reg a, b, c; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
andgate AND1 (s, a, b, c); 
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0; c=0;
end 
// ------------------------- parte principal 
initial begin 
$display("Exercicio01-08 - Lucas Siqueira Chagas - 380783"); 
$display("Test AND gate com 3 portas"); 
$display("\na & b & c = s\n"); 
$monitor("(%b & %b & %b ) = %b", a, b, c, s);
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