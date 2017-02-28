// ------------------------- 
// Exemplo0010 - OR 
// Nome: Jônatas Sena Ferreira 
// Matricula: 427424 
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
reg a, b, c; // definir registradores 
wire s, s2; // definir conexao (fio) 
// ------------------------- instancia 
orgate OR1 (s, a, b); 
orgate OR2 (s2, c, s);
// ------------------------- preparacao 
initial begin:start 
a=0; b=0; c=0;
end 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0010 - Jônatas Sena Ferreira - 427424"); 
$display("Test OR2 gate"); 
$display("\na | b | c = s\n"); 
a=0; b=0; c=0;
#1 $display("%b | %b | %b = %b", a, b, c, s2); 
a=0; b=1; c=0;
#1 $display("%b | %b | %b = %b", a, b, c, s2); 
a=1; b=0; c=0;
#1 $display("%b | %b | %b = %b", a, b, c, s2);
a=1; b=1; c=0;
#1 $display("%b | %b | %b = %b", a, b, c, s2);
a=0; b=0; c=1;
#1 $display("%b | %b | %b = %b", a, b, c, s2); 
a=0; b=1; c=1;
#1 $display("%b | %b | %b = %b", a, b, c, s2); 
a=1; b=0; c=1;
#1 $display("%b | %b | %b = %b", a, b, c, s2); 
a=1; b=1; c=1;
#1 $display("%b | %b | %b = %b", a, b, c, s2); 
 
end 
endmodule // testorgate 