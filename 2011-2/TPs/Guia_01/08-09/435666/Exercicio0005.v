// ------------------------- 
// Exemplo5 - OR 3 portas
// Nome: Julio Miranda Machado
// Matricula: 435666-7 
// ------------------------- 
// ------------------------- 
// -- or gate 
// ------------------------- 
module orgate ( output s, 
input p, 
input q,
input z); 
assign s = p | q | z; 
endmodule // orgate 
// --------------------- 
// -- test or gate 
// --------------------- 
module testorgate; 
// ------------------------- dados locais 
reg a, b, c; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
orgate AND1 (s, a, b ,c); 
// ------------------------- preparacao 
initial begin:start 
a=0; b=0; c=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exemplo5 - Julio Miranda Machado- 435666-7"); 
$display("Test OR 3 portas gate"); 
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
endmodule // testorgate 