// ------------------------- 
// Exemplo0035 - F4 
// Nome: Ursula Rosa Monteiro de Castro
// Matricula: 427468
// ------------------------- 
// ------------------------- 
// neg4b 
// ------------------------- 
module neg4b (output [3:0] s, input [3:0] a); 


not NOT1 (s[0], a[0]);
not NOT2 (s[1], a[1]);
not NOT3 (s[2], a[2]);
not NOT4 (s[3], a[3]);

endmodule // neg4b

// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [3:0] nota,output [3:0] notb, output [3:0] ou, output [3:0] notou,
output [3:0] e, output [3:0] note, output [3:0] oux, output [3:0] notoux,input [3:0] a, 
input [3:0] b); 

neg4b NEG4a (nota, a);
neg4b NEG4b (notb, b);

and AND1 (e[0], a[0], b[0]);
and AND2 (e[1], a[1], b[1]);
and AND3 (e[2], a[2], b[2]);
and AND4 (e[3], a[3], b[3]);

neg4b NEG4e (note, e);

or OR1 (ou[0], a[0], b[0]);
or OR2 (ou[1], a[1], b[1]);
or OR3 (ou[2], a[2], b[2]);
or OR4 (ou[3], a[3], b[3]);

neg4b NEG4ou (notou, ou);

xor XOR1 (oux[0], a[0], b[0]);
xor XOR2 (oux[1], a[1], b[1]);
xor XOR3 (oux[2], a[2], b[2]);
xor XOR4 (oux[3], a[3], b[3]);

neg4b NEG4oux (notoux, oux);

endmodule // f4 
// ------------------------- 

module test_f4; 
// ------------------------- definir dados 
reg [3:0] x; 
reg [3:0] y; 
wire [3:0] a, b, c, d, e, f, g, h; 
f4 modulo (a, b, c, d, e, f, g, h, x, y); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0035 -  Ursula Rosa - 427468"); 
$display("Test LU's module"); 
x = 4'b0011; y = 4'b0101;
// projetar testes do modulo 
#1 $monitor("A %3b - B %3b = NOT A %3b - NOT B %3b - OR %3b - NOR %3b - \n AND %3b - NAND %3b - XOR %3b - XNOR %3b \n \n", x, y, a, b, c, d, e, f, g, h); 
#1 x = 4'b1010; y = 4'b1101;
#1 x = 4'b1111; y = 4'b1111;
#1 x = 4'b1000; y = 4'b0001;
#1 x = 4'b1010; y = 4'b0101;
end 
endmodule // test_f4 