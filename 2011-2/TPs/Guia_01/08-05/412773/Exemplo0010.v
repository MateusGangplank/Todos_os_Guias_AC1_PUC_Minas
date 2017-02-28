// Exemplo0009 - OR
// Nome: Silvino Henrique Santos de Souza
// Matricula: 412773
// ------------------------- 
// ------------------------- 
// -- or gate 
// ------------------------- 
module orgate ( output s, 
input p, 
input q, input r); 
assign s = (p | q | r); 
endmodule // orgate 
// --------------------- 
// -- test o gate 
// --------------------- 
module testorgate; 
// ------------------------- dados locais 
reg a, b, c; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
orgate OR1 (s, a, b, c); 
// ------------------------- preparacao 
initial begin:start 
a=0; b=0; c=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0009 - Silvino Henrique Santos de Souza - 412773");
$display("Test OR gate"); 
$display("\na | b | c = s\n"); 
a=0; b=0; c=0; 
#1 $display("%b | %b | %b = %b", a, b, c, s); 
a=0; b=0; c=1; 
#1 $display("%b | %b | %b = %b", a, b, c, s); 
a=0; b=1; c=0; 
#1 $display("%b | %b | %b = %b", a, b, c, s); 
a=0; b=1; c=1;
#1 $display("%b | %b | %b = %b", a, b, c, s); 
a=1; b=0; c=0;
#1 $display("%b | %b | %b = %b", a, b, c, s); 
a=1; b=0; c=1;
#1 $display("%b | %b | %b = %b", a, b, c, s); 
a=1; b=1; c=0;
#1 $display("%b | %b | %b = %b", a, b, c, s); 
a=1; b=1; c=1;
#1 $display("%b | %b | %b = %b", a, b, c, s); 
end 
endmodule // testorgate