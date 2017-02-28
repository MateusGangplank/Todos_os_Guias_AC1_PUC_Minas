// -------------------------
// Exercicio0009 - AND 
// Nome: Gabriel Luiz M. G. Vieira 
// Matricula: 441691 
// ------------------------- 
// ------------------------- 
// -- and gate & and gate2 
// ------------------------- 
module andgate ( output s1, 
input p, 
input q); 
assign s1 = p & q; 
endmodule // andgate 

module andgate2 ( output s2, 
input s1, 
input r); 
assign s2 = s1 & r; 
endmodule // andgate2 
// --------------------- 
// -- test and gate 
// --------------------- 
module testandgate; 
// ------------------------- dados locais 
reg a, b ,c; // definir registradores 
wire s1,s2; // definir conexao (fio) 
// ------------------------- instancia 
andgate AND1 (s1, a, b);                   // DEFINIR EM OUTRO MODULO
andgate2 AND2 (s2, s1, c);  
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0; c=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exercicio0009 - Gabriel Luiz M. G. Vieira - 441691"); 
$display("Test AND gate"); 
$display("\na & b & c = s1\n");

$monitor("%b & %b & %b = %b", a, b, c, s2); 

#1a=0; b=0; c=1;
#1a=0; b=1; c=0;
#1a=0; b=1; c=1;
#1a=1; b=0; c=0; 
#1a=1; b=0; c=1;
#1a=1; b=1; c=0;
#1a=1; b=1; c=1;

end 
endmodule // testandgate 