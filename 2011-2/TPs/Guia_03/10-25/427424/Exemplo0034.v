// ------------------------- 
// Exemplo0034 - F4 
// Nome: Jonatas Sena Ferreira
// Matricula: 427424
// ------------------------- 
// ------------------------- 
// optador1b 
// ------------------------- 
module op1b (output s, input a, input b, input c); 

wire s1, s2;

and AND1 (s1, ~c, a);
and AND2 (s2, c, b);
or OR1 (s, s1, s2);

endmodule // op1b 

// ------------------------- 
// optador4b 
// ------------------------- 
module op4b (output [3:0] s, input [3:0] a, input [3:0] b,input c); 

op1b OP1 (s[0], a[0], b[0], c);
op1b OP2 (s[1], a[1], b[1], c);
op1b OP3 (s[2], a[2], b[2], c);
op1b OP4 (s[3], a[3], b[3], c);

endmodule // op4b 

// ------------------------- 
// SelI1b 
// ------------------------- 
module selI1b (output s, input a, input c); 

xor XOR1 (s, a, c);
endmodule // selI1b 
 
// ------------------------- 
// SelI4b 
// ------------------------- 
module selI4b (output [3:0] s, input [3:0] a, input c); 

xor XOR0 (s[0], a[0], c);
xor XOR1 (s[1], a[1], c);
xor XOR2 (s[2], a[2], c);
xor XOR3 (s[3], a[3], c);
endmodule // selI4b 

// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [3:0] s,output [3:0] ns,input [3:0] a, input [3:0] b,input c); 

wire [3:0] fioXOR, fioOR, fioOOUT, fioNOUT;

xor XOR1 (fioXOR[0], a[0], b[0]);
xor XOR2 (fioXOR[1], a[1], b[1]);
xor XOR3 (fioXOR[2], a[2], b[2]);
xor XOR4 (fioXOR[3], a[3], b[3]);

or OR1 (fioOR[0], a[0], b[0]);
or OR2 (fioOR[1], a[1], b[1]);
or OR3 (fioOR[2], a[2], b[2]);
or OR4 (fioOR[3], a[3], b[3]);

op4b op1 (s, fioOR, fioXOR, c);

assign ns = ~s;

endmodule // f4 
// ------------------------- 
module test_f4; 
// ------------------------- definir dados 
reg [3:0] x; 
reg [3:0] y; 
reg c;
wire [3:0] z1, z2; 
f4 modulo (z1, z2, x, y, c); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0034 - Jonatas Sena Ferreira - 427424"); 
$display("Test LU's module"); 
x = 4'b0011; y = 4'b0101; c=0;
// projetar testes do modulo 
#1 $monitor("%3b %3b option: %1b = %3b also %3b",x,y,c,z1,z2); 
#1 c=1;
#1 x = 4'b1010; y = 4'b1100; c=0;
#1 x = 4'b0010; y = 4'b1101; c=1;
#1 x = 4'b1111; y = 4'b1111; c=0;
#1 x = 4'b1111; y = 4'b1111; c=1;
#1 x = 4'b0100; y = 4'b0000; c=0;
#1 x = 4'b0001; y = 4'b0100; c=1;
#1 x = 4'b1010; y = 4'b0101; c=0;
#1 x = 4'b1010; y = 4'b1101; c=1;
end 
endmodule // test_f4 