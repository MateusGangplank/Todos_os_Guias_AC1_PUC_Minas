// ------------------------- 
// Exercicio0006
// Nome: Pedro Henrique Vilar Locatelli
// Matricula: 427453
// ------------------------- 
// --------------------- 
module comple1 (output [7:0] s, 
input [7:0] r); 

assign s = ~r; 
endmodule
// --------------------- 
// -- test comple 
// --------------------- 
module testcomple; 
// ------------------------- dados locais 
reg [7:0] a; // definir registrador 
wire [7:0] s; // definir conexao (fio) 
// ------------------------- instancia 
comple1 ari1 (s, a); 
// ------------------------- preparacao 
initial begin:start 
a= 8'b00001100; 
end 
// ------------------------- parte principal 
initial begin:main 
$display("Exerc0006 - Pedro Henrique Vilar Locatelli  - 427453"); 
$display("Test comple1"); 
$monitor("%b = %b", a, s); 
#1 a = 8'b01001100;
#1 a = 8'b00101100;
end 
endmodule