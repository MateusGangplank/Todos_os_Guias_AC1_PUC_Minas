
// ------------------------- 
// Exercicio 01 - 01
// Nome: Lorena Danielle Gonçalves Bento 
// Matricula: 435049 
// ------------------------- 
// ------------------------- 
// -- nand gate 
// -------------------------  
module nandgate (output s, input a, input b); 
assign s = (~(a&b)); // criar vinculo permanente 
// (dependencia) 
endmodule // nandgate 
// --------------------- 
// -- test nand gate 
// --------------------- 
module testnandgate; 
// ------------------------- dados locais 
reg a, b; // definir registrador 
// (variavel independente) 
wire s; // definir conexao (fio) 
// (variavel dependente )
// ------------------------- instancia 
nandgate NAND1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0;b=0; 
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exercicio01 - Lorena Danielle Gonçalves Bento - 435049"); 
$display("Test nand gate"); 
$display("\n (~(a ^ b)) = s\n"); 
$display("%b & %b = %b", a, b, s); 
a=0; b=0;
#1 $display("%b & %b = %b", a, b, s); 
a=0;b=1;
#1 $display("%b & %b = %b", a, b, s);  
a=1;b=0; 
#1 $display("%b & %b = %b", a, b, s); 
a=1;b=1; 
#1 $display("%b & %b = %b", a, b, s); 
end 
endmodule // testnandgate 
