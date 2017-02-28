// ------------------------- 
// Exemplo4 - AND 3 portas
// Nome: Julio Miranda Machado
// Matricula: 435666-7 
// ------------------------- 
// ------------------------- 
// -- and gate 
// ------------------------- 
module andgate ( output s, 
input p, 
input q,
input z); 
assign s = (p & q) & z; 
endmodule // andgate 
// --------------------- 
// -- test and gate 
// --------------------- 
module testandgate; 
// ------------------------- dados locais 
reg a, b, c; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
andgate AND1 (s, a, b ,c); 
// ------------------------- preparacao 
initial begin:start 
a=0; b=0; c=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exemplo4 - Julio Miranda Machado- 435666-7"); 
$display("Test AND 3 portas gate"); 
$display("\na & b = s\n"); 
a=0;b=0;c=0; 
#1 $display("%b & %b & %b = %b", a, b, c, s); 
a=0; b=0;c=1; 
#1 $display("%b & %b & %b = %b", a, b, c, s); 
a=0; b=1;c=0; 
#1 $display("%b & %b & %b = %b", a, b, c, s); 
a=0; b=1;c=1; 
#1 $display("%b & %b & %b = %b", a, b, c, s); 
a=1;b=0;c=0;
#1 $display("%b & %b & %b = %b", a, b, c, s); 
a=1;b=0;c=1;
#1 $display("%b & %b & %b = %b", a, b, c, s); 
a=1;b=1;c=0;
#1 $display("%b & %b & %b = %b", a, b, c, s); 
a=1;b=1;c=1;
#1 $display("%b & %b & %b = %b", a, b, c, s); 

end 
endmodule // testandgate 