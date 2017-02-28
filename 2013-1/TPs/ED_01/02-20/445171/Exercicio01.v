// --------------------- 
// Exemplo0006
// Nome: Raphael Quintao 
// Matricula: 445171 
// ---------------------

 
module nandgate (output s, input p, input q); 
assign s = ~(p & q) ; 
endmodule // xor 
// --------------------- 
// -- test xorgate 
// --------------------- 
module testnandgate; 
// ------------------------- dados locais 
reg a,b; // definir registrador 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
nandgate nand1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0;  
b=0; 
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exercicio 01 - Raphael Quintao - 445171"); 
$display("Test NAND gate"); 
$display("\n~(a & b) = s\n"); 
a=0; b=0; 
#1 $display("~(%b & %b) = %b", a, b, s); 
a=0; b=1; 
#1 $display("~(%b & %b) = %b", a, b, s); 
a=1; b=0; 
#1 $display("~(%b & %b) = %b", a, b, s); 
a=1; b=1; 
#1 $display("~(%b & %b) = %b", a, b, s);
end 
endmodule // testxorgate 