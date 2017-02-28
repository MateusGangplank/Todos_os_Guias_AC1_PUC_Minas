// ------------------------- 
// Exemplo0013 - AND 
// Nome: Joao Augusto de Moura Araujo 
// Matricula: 451582
// ------------------------- 
// ------------------------- 
// -- and gate 
// ------------------------- 
module andgate ( output s, input p, input q, input r); 
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
$display("Exemplo0013 - Joao Augusto de Moura Araujo - 451582"); 
$display("Test AND gate"); 
$display("\na & b & c = s\n"); 
#1 a=0; b=0; c=0;
 $monitor("%b & %b & %b = %b", a, b, c, s); 
#1 a=0; b=0; c=1;
#1 a=0; b=1; c=0;
#1 a=0; b=1; c=1;
#1 a=1; b=0; c=0;
#1 a=1; b=0; c=1;
#1 a=1; b=1; c=0;
#1 a=1; b=1; c=1;
end 
endmodule // testandgate