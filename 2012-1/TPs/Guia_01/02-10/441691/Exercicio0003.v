// --------------------- 
// Exercicio0003 - nxor 
// Nome: Gabriel Luiz M. G. Vieira 
// Matricula: 441691 
// --------------------- 
// --------------------- 
// -- nxor gate 
// --------------------- 
module nxorgate (output s, 
input p, 
input q); 
assign s = ~(p ^ q); 
endmodule // nxor 
// --------------------- 
// -- test nxorgate 
// --------------------- 
module testnxorgate; 
// ------------------------- dados locais 
reg a,b; // definir registrador 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
nxorgate NXOR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0;
b=0;  
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exercicio0003 - Gabriel Luiz M. G. Vieira - 441691"); 
$display("Test nxor gate");
$display("\n ~(a ^ b) = s\n");  
$monitor("~(%b ^ %b) = %b", a, b, s); 
#1 a=0; b=0; 
#1 a=0; b=1; 
#1 a=1; b=0; 
#1 a=1; b=1;  
end 
endmodule // testxorgate 