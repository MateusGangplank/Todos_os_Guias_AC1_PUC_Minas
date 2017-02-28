// ------------------------- 
// Exercicio05 - NOR 
// Nome: Luhan Mairinck 
// Matricula: 446987 
// -------------------------
 
// ------------------------- 
// -- nor gate usando de Morgan
// ------------------------- 

module norgate ( output s, 
                input p, q); 

// propriedade de Morgan
assign s = (~p & ~q); 

endmodule // norgate 

// --------------------- 
// -- test nor gate 
// --------------------- 

module testnorgate; 

// ------------------------- dados locais 
reg a, b; // definir registradores 

wire s; // definir conexao (fio) 

// ------------------------- instancia 
norgate NOR1 (s, a, b); 

// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0; 
end 

// ------------------------- parte principal 
initial begin 
$display("Exercicio05 - Luhan Mairinck - 999999"); 
$display("NOR gate por de Morgan"); 
$display("\na & b = s\n"); 
a=0; b=0; 

$monitor("%b & %b = %b", a, b, s); 
#1 a=0; b=1; 

#1 a=1; b=0; 

#1 a=1; b=1; 

end 
endmodule // testnorgate 