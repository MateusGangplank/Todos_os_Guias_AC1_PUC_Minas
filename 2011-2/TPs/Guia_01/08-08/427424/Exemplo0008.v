// --------------------- 
// Exemplo0008 - xnor 
// Nome: Jônatas Sena Ferreira 
// Matricula: 427424 
// --------------------- 
// --------------------- 
// -- xnor gate 
// --------------------- 
module xnorgate (output [0:3] s, 
input [0:3] p, 
input [0:3] q); 
assign s = ~(p ^ q); 
endmodule // xnor 
// --------------------- 
// -- test xnorgate 
// --------------------- 
module testxnorgate; 
// ------------------------- dados locais 
reg [0:3] a,b; // definir registrador 
wire [0:3] s; // definir conexao (fio) 
// ------------------------- instancia 
xnorgate XNOR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=4'b0011; // 4 valores binarios 
b=4'b0101; // 4 valores binarios 
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exemplo0008 - Jônatas Sena Ferreira - 427424"); 
$display("Test xnor gate"); 
$display("\n ~(a ^ b) = s\n"); 
$monitor("~(%b ^ %b) = %b", a, b, s); 
#1 a=0; b=0; // valores decimais 
#1 a=4'b0010; b=4'b0001; // valores binarios 
#1 a=4'd1; b=3; // decimal e decimal 
#1 a=4'o5; b=2; // octal e decimal 
#1 a=4'hA; b=3; // hexadecimal e decimal 
#1 a=4'h9; b=4'o3; // hexadecimal e octal 
end 
endmodule // testxnorgate 