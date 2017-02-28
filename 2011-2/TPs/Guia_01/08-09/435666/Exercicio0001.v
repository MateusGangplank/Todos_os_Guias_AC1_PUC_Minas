// ------------------------- 
// Exemplo1 - NAND 
// Nome: Julio Miranda Machado
// Matricula: 435666-7  
// ------------------------- 
// ------------------------- 
// -- NAND gate 
// ------------------------- 
module nandgate ( output s, 
input p, q); 
assign s = p ~& q; 
endmodule 
// --------------------- 
// -- test NAND gate 
// --------------------- 
module testnandgate; 
// ------------------------- dados locais 
reg a, b; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
nandgate OR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0; b=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exemplo1 - Julio Miranda Machado- 435666-7"); 
$display("Test NAND gate"); 
$display("\na & b = s\n"); 
a=0; b=0; 
#1 $display("%b & %b = %b", a, b, s); 
a=0; b=1; 
#1 $display("%b & %b = %b", a, b, s); 
a=1; b=0; 
#1 $display("%b & %b = %b", a, b, s); 
a=1; b=1; 
#1 $display("%b & %b = %b", a, b, s); 
end 
endmodule // testnandgate 