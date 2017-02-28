// ------------------------- 
// Exercicio03 - XNOR 
// Nome: Jorge Luis dos Santos Leal 
// Matricula: 417466 - 08/2011
// ------------------------- 
// ------------------------- 
// -- xnor gate 
// ------------------------- 
module xnorgate ( output[3:0]s, input[3:0]p, input[3:0]q); 
assign s = ( ~(p^q) ); 
endmodule // xnor 
// --------------------- 
// -- test xnor gate 
// --------------------- 
module testxnorgate; 
// ------------------------- dados locais 
reg[0:3]a,b; // definir registradores 
wire[0:3]s; // definir conexao (fio) 
// ------------------------- instancia 
xnorgate XNOR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=0; b=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exercicio03 - Jorge Luis dos Santos Leal - 417466"); 
$display("Test XNOR gate"); 
$display("\na & b = s\n"); 
a=0; b=2; 
$monitor("%b ^ %b = %b", a, b, s);
#1 a=0; b=3; // valores decimais 
#1 a=4'b0110; b=4'b0100; // valores binarios 
#1 a=4'd3; b=5; // decimal e decimal 
#1 a=4'o2; b=4; // octal e decimal 
#1 a=4'h7; b=4'o2; // hexadecimal e octal
end 
endmodule // testnandgate 


