// ------------------------- 
// Exemplo0021 - FULL ADDER 
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453 
// ------------------------- 
// ------------------------- 
// full adder 
// ------------------------- 
module xorgate (output [2:0] sxor,
					 input [5:0] w,
					 input [5:0] x);
assign sxor = (w ^ x);
endmodule
module andgate (output [2:0] sand,
					 input [5:0] w,
					 input [5:0] x);
assign sand = (w & x);
endmodule
module orgate (output [2:0] sor,
					input [5:0] w,
					input [5:0] x);
assign sor = (w | x);
endmodule
module test_fullAdder; 
// ------------------------- definir dados 
reg [5:0] y; 
reg [5:0] z; 
reg [5:0] carry; 
wire [2:0] sxor; 
wire [2:0] s0f; 
wire [2:0] sand1; 
wire [2:0] sand2; 
wire [2:0] s1f; 
xorgate s00 ( sxor, carry, y );
xorgate s01 ( s0f, sxor, z );
andgate s10 ( sand1, carry, y );
andgate s11 ( sand2, sxor, z );
orgate s12 ( s1f, sand1, sand2 );
// ------------------------- parte principal 
initial begin 
$display("Exemplo0021 - Pedro Henrique Vilar Locatelli - 427453"); 
$display("Test ALU's full adder"); 
// projetar testes do somador complete
#1 y = 6'b000001; z = 6'b000001; carry = 6'b000000;
$monitor("%b + %b = %b%b", y, z, s1f, s0f ); 
#2 y = 6'b000101; z = 6'b000101; carry = 6'b000000;
end 
endmodule // test_fullAdder 