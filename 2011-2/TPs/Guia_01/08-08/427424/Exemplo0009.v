// ------------------------- 
// Exemplo0009 - AND 
// Nome: Jônatas Sena Ferreira 
// Matricula: 427424 
// ------------------------- 
// ------------------------- 
// -- and gate 
// ------------------------- 
module andgate ( output s, 
input p, 
input q); 
assign s = p & q; 
endmodule // andgate 
// --------------------- 
// -- test and gate 
// --------------------- 
module testandgate; 
// ------------------------- dados locais 
reg a, b, c; // definir registradores 
wire s, s2; // definir conexao (fio) 
// ------------------------- instancia 
andgate AND2 (s, a, b); 
andgate AND3 (s2, c, s);
// ------------------------- preparacao 
initial begin:start 
a=0; b=0; c=0;
end 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0009 - Jônatas Sena Ferreira - 427424"); 
$display("Test AND2 gate"); 
$display("\na & b & c = s\n"); 
a=0; b=0; c=0;
#1 $display("%b & %b & %b = %b", a, b, c, s2); 
a=0; b=1; c=0;
#1 $display("%b & %b & %b = %b", a, b, c, s2);  
a=1; b=0; c=0;
#1 $display("%b & %b & %b = %b", a, b, c, s2);  
a=1; b=1; c=0;
#1 $display("%b & %b & %b = %b", a, b, c, s2);  
a=0; b=0; c=1;
#1 $display("%b & %b & %b = %b", a, b, c, s2); 
a=0; b=1; c=1;
#1 $display("%b & %b & %b = %b", a, b, c, s2);  
a=1; b=0; c=1;
#1 $display("%b & %b & %b = %b", a, b, c, s2);  
a=1; b=1; c=1;
#1 $display("%b & %b & %b = %b", a, b, c, s2);  
end 
endmodule // testandgate 