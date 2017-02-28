// --------------------- 
// Extra1.v - nor 
// Nome: Gustavo Jota Resende 
// Matricula: 427413
// --------------------- 
// --------------------- 
// -- xor gate 
// --------------------- 
module norgate (output [0:3] s, 
input [0:3] p, 
input [0:3] q); 
assign s =~(p & q); 
endmodule // nor 
// --------------------- 
// -- test norgate 
// --------------------- 
module testnorgate; 
// ------------------------- dados locais 
reg [0:3] a,b; // definir registrador 
wire [0:3] s; // definir conexao (fio) 
// ------------------------- instancia 
norgate NOR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
a=4'b0011; // 4 valores binarios 
b=4'b0101; // 4 valores binarios 
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exta1 - Gustavo Jota Resende - 427413"); 
$display("Test nor gate"); 
$display("\n a ^ b = s\n"); 
$monitor("%b ^ %b = %b", a, b, s); 
#1 a=0; b=0; // valores decimais 
#1 a=4'b0010; b=4'b0001; // valores binarios 
#1 a=4'd1; b=3; // decimal e decimal 
#1 a=4'o5; b=2; // octal e decimal 
#1 a=4'hA; b=3; // hexadecimal e decimal 
#1 a=4'h9; b=4'o3; // hexadecimal e octal 
end 
endmodule // testnorgate 

// 
// Versao Teste 
// 0.1 01. ( OK ) identificacao de programa 
// Resultados: 0011 ^ 0101 = 1110, 0000 ^ 0000 = 1111, 0010 ^ 0001 = 1111, 0001 ^ 0011 = 1110, 0101 ^ 0010 = 1111, 1010 ^ 0011 = 1101, 1001 ^ 0011 = 1110