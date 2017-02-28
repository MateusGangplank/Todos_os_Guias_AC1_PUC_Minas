// ------------------------- 
// Exerc0006
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453
// --------------------- 
// --------------------- 
module xorgate (output s, 
input p, 
input q); 
assign s = ~(p) & q | p & ~(q);
endmodule // xor
// --------------------- 
// -- test XORgate 
// --------------------- 
module testxorgate; 
// ------------------------- dados locais 
reg a,b; // definir registrador 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
xorgate XOR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a= 1'b0; 
b= 1'b0;  
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exerc0006 - Pedro Henrique Vilar Locatelli  - 427453"); 
$display("Test xor gate"); 
$display("\n a ^ b = s\n");
#1 $display("%b ^ %b = %b", a, b, s); 
a=1'b0; b=1'b1;
#1 $display("%b ^ %b = %b", a, b, s); 
a=1'b1; b=1'b0; 
#1 $display("%b ^ %b = %b", a, b, s); 
a=1'b1; b=1'b1; 
#1 $display("%b ^ %b = %b", a, b, s); 
end 
endmodule // testxorgate 