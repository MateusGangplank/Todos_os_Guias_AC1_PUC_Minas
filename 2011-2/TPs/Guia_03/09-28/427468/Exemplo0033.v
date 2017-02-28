// ------------------------- 
// Exemplo0034 - F4 
// Nome: Ursula Rosa Monteiro de Castro
// Matricula: 427468
// ------------------------- 
// ------------------------- 
// optador1b 
// ------------------------- 
module op1b (output s, input a, input b, input c); 
// --descrição
wire s1, s2;

and AND1 (s1, ~c, a);
and AND2 (s2, c, b);
or OR1 (s, s1, s2);

endmodule // op1b 
// ------------------------- 
// ------------------------- 
// optador4b 
// ------------------------- 
module op4b (output [3:0] s, input [3:0] a, input [3:0] b,input c); 
// --descrição

op1b OP1 (s[0], a[0], b[0], c);
op1b OP2 (s[1], a[1], b[1], c);
op1b OP3 (s[2], a[2], b[2], c);
op1b OP4 (s[3], a[3], b[3], c);

endmodule // op4b 

// ------------------------- 
module selI1b (output s, input a, input c); 

xor xor1 (s, a, c);
endmodule // selI1b 

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
module f4 (output [3:0] s1,output [3:0] s2, input [3:0] a, input [3:0] b,input c); 

wire [3:0] fioAND, fioOR;

and AND1 (fioAND[0], a[0], b[0]);
and AND2 (fioAND[1], a[1], b[1]);
and AND3 (fioAND[2], a[2], b[2]);
and AND4 (fioAND[3], a[3], b[3]);

or OR1 (fioOR[0], a[0], b[0]);
or OR2 (fioOR[1], a[1], b[1]);
or OR3 (fioOR[2], a[2], b[2]);
or OR4 (fioOR[3], a[3], b[3]);

selI4b si1 (s1, fioAND, c);
selI4b si2 (s2, fioOR, c);

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
$display("Exemplo0033 -  Ursula Rosa - 427468"); 
$display("Test LU's module"); 
x = 4'b0011; y = 4'b0101; c=0;
// projetar testes do modulo 
#1 $monitor("%3b %3b option: %1b == %3b also %3b",x,y,c,z1,z2); 
#1 c=1;
#1 x = 4'b1010; y = 4'b1101; c=0;
#1 x = 4'b1010; y = 4'b1101; c=1;
#1 x = 4'b1111; y = 4'b1111; c=0;
#1 x = 4'b1111; y = 4'b1111; c=1;
#1 x = 4'b0100; y = 4'b0010; c=0;
#1 x = 4'b0000; y = 4'b1000; c=1;
#1 x = 4'b1011; y = 4'b0101; c=0;
#1 x = 4'b1010; y = 4'b0101; c=1;
end 
endmodule // test_f4 