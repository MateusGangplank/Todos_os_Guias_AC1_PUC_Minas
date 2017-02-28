// --------------------- 
// Exercicio01-01 - NAND
// Nome: Lucas Siqueira Chagas	 
// Matricula: 380783
// --------------------- 
// --------------------- 
// -- Nand
// --------------------- 
module nandgate (output s, 
input p, 
input q); 
assign s = ~(p&q); 
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
$display("Exercicio01-01 - Lucas Siqueira Chagas - 380783"); 
$display("Test nand gate"); 
$display("\n a NAND b = s\n"); 
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