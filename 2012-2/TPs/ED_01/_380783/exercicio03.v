// --------------------- 
// Exercicio01-03 - XNOR
// Nome: Lucas Siqueira Chagas	 
// Matricula: 380783
// --------------------- 
// --------------------- 
// -- XNOR
// --------------------- 
module xnorgate (output s, 
input p, 
input q); 
assign s = ~(p^q); 
endmodule // xnorgate 
// --------------------- 
// -- test xnorgate 
// --------------------- 
module testxnorgate; 
// ------------------------- dados locais 
reg a,b; // definir registrador 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
xnorgate XNOR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0; 
b=0;
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exercicio01-03 - Lucas Siqueira Chagas - 380783"); 
$display("Test xnor gate"); 
$display("\n ~(a ^ b) = s\n"); 
a=0; b=0;
$monitor("~(%b ^ %b) = %b", a, b, s);
#1 a=0; b=1;
#1 a=1; b=0;
#1 a=1; b=1;
end 
endmodule // testxnorgate 