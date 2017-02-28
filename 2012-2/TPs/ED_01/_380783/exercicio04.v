// --------------------- 
// Exercicio01-04 - NAND
// Nome: Lucas Siqueira Chagas	 
// Matricula: 380783
// --------------------- 
// --------------------- 
// -- NAND
// --------------------- 
module nandgate (output s, 
input p, 
input q); 
assign s = ~p|~q; 
endmodule // nandgate 
// --------------------- 
// -- test nandgate 
// --------------------- 
module testnandgate; 
// ------------------------- dados locais 
reg a,b; // definir registrador 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
nandgate NAND1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0; 
b=0;
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exercicio01-04 - Lucas Siqueira Chagas - 380783"); 
$display("Test NAND gate por de morgan"); 
$display("\n (~a | ~b) = s\n"); 
a=0; b=0;
$monitor("(~%b | ~%b) = %b", a, b, s);
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
end 
endmodule // testnandgate 