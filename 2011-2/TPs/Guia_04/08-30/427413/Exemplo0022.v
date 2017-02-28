
 // ------------------------- 
// Exemplo0022 - FULL ADDER 
// Nome: Gustavo Jota Resende
// Matricula: 427413
// ------------------------- 
// ------------------------- 
// full adder 
// ------------------------- 
module fullAdder (output [5:0] s, 
input [5:0] a, 
input [5:0] b, 
input [5:0] c,
input carryIn); 
assign s = ((s3 & carryIn) | s3 )  ;
endmodule // fullAdder 

module f4 (output [5:0] s, 
input [5:0] a, 
input [5:0] b);
assign s1 = (a | b);
endmodule // f4 

module f3 (output [5:0] s2, 
input [5:0] a, 
input [5:0] b); 
 assign s2 = (a & b); 
	endmodule // f3

module f5 (output [5:0] s2, 
input [5:0] a, 
input [5:0] b); 
 assign s3 = (a ^ b); 
endmodule // f5
	
module test_fullAdder;  


// ------------------------- definir dados 
reg [5:0] x; 
reg [5:0] y; 
wire [5:0] z; 
wire [5:0] k; 
wire [5:0] w;
wire [5:0] t;
wire carry; 
wire [5:0] diferenca; 
f4 modulo (z, x, y); 
f3 modulo2 (k, x, y); 
f5 modulo3 (w, x, y);
fullAdder modulo4 (t,diferenca, x , y, carry);
 


// ------------------------- parte principal 
initial begin 
$display("Exemplo0022 - Gustavo Jota Resende - 427413"); 
$display("Test ALU's full adder"); 
// projetar testes do somador complete

x = 6'b100011; y = 6'b100101; 
$monitor("%b (& ou |) %b com chave %b = %b", y, x, diferenca, t, carry );  
end 
endmodule // test_fullAdder 

//Teste
//100101 (& ou |) 100011 com chave zzzzzz = 00000xz