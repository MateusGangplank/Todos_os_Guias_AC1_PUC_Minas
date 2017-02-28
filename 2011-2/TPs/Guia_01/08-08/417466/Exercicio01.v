// ------------------------- 
// Exercicio01 - NAND 
// Nome: Jorge Luis dos Santos Leal 
// Matricula: 417466 
// ------------------------- 
// ------------------------- 
// -- nand gate 
// -------------------------
module andgate ( output s, input p, input q); 
assign s = ( ~(p&q) )  ; 
endmodule // nandgate 
// --------------------- 
// -- test nand gate 
// --------------------- 
module testnandgate; 
// ------------------------- dados locais 
reg a, b; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
andgate NAND1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0; b=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exercicio01 - Jorge Luis dos Santos Leal - 417466"); 
$display("Test NAND gate"); 
$display("\na & b = s\n"); 
a=0; b=0; 
#1 $display("~(%b & %b) = %b", a, b, s); 
a=0; b=1; 
#1 $display("~(%b & %b) = %b", a, b, s); 
a=1; b=0; 
#1 $display("~(%b & %b) = %b", a, b, s); 
a=1; b=1; 
#1 $display("~(%b & %b) = %b", a, b, s); 
end 
endmodule // testnandgate 


