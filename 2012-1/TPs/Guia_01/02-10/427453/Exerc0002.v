// ------------------------- 
// Exerc0002
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453
// --------------------- 
// --------------------- 
module norgate (output s, 
input p, 
input q); 
assign s = ~(p | q); 
endmodule // nor
// --------------------- 
// -- test NORgate 
// --------------------- 
module testnorgate; 
// ------------------------- dados locais 
reg a,b; // definir registrador 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
norgate NOR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a= 1'b0; 
b= 1'b0;  
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exerc0002 - Pedro Henrique Vilar Locatelli  - 427453"); 
$display("Test nor gate"); 
$display("\n a ^ b = s\n");
$monitor("%b ^ %b = %b", a, b, s); 
#1 a=1'b0; b=1'b1;
#1 a=1'b1; b=1'b0; 
#1 a=1'b1; b=1'b1; 
end 
endmodule // testnorgate 