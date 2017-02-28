//------------------------- 
// Exemplo0004 - OR 
// Nome: Lucas Siqueira Chagas 
// Matricula: 380783
// ------------------------- 
// ------------------------- 
// -- or gate 
// ------------------------- 
module orgate ( output s, 
input p, q); 
assign s = p | q; 
endmodule // orgate 
// --------------------- 
// -- test or gate 
// --------------------- 
module testorgate; 
// ------------------------- dados locais 
reg a, b; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
orgate OR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0004 - Lucas Siqueira Chagas - 380783"); 
$display("Test OR gate"); 
$display("\na OR b = s\n");  //linha alterada
a=0; b=0; 
#1 $display("%b OR %b = %b", a, b, s);  //linha alterada
a=0; b=1; 
#1 $display("%b OR %b = %b", a, b, s);  //linha alterada
a=1; b=0; 
#1 $display("%b OR %b = %b", a, b, s);  //linha alterada
a=1; b=1; 
#1 $display("%b OR %b = %b", a, b, s);  //linha alterada
end 
endmodule // testorgate 