// ------------------------- 
// Exemplo0032 - F4 
// Nome: Ursula Rosa Monteiro de Castro
// Matricula: 427468
// ------------------------- 
// ------------------------- 
// optador1b 
// ------------------------- 
module optador1b (output s, input a, input b, input c); 
// --descrição
wire s1, s2;

and AND1 (s1, ~c, a);
and AND2 (s2, c, b);
or OR1 (s, s1, s2);

endmodule // optador1b 
// ------------------------- 
// ------------------------- 
// optador4b 
// ------------------------- 
module optador4b (output [3:0] s, input [3:0] a, input [3:0] b,input c); 
// --descrição

optador1b OP1 (s[0], a[0], b[0], c);
optador1b OP2 (s[1], a[1], b[1], c);
optador1b OP3 (s[2], a[2], b[2], c);
optador1b OP4 (s[3], a[3], b[3], c);

endmodule // optador4b 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [3:0] s, input [3:0] d, input [3:0] e,input f); 
// -- descrição
wire [3:0] fioAND, fioOR;

and AND1 (fioAND[0], d[0], e[0]);
and AND2 (fioAND[1], d[1], e[1]);
and AND3 (fioAND[2], d[2], e[2]);
and AND4 (fioAND[3], d[3], e[3]);

or OR1 (fioOR[0], d[0], e[0]);
or OR2 (fioOR[1], d[1], e[1]);
or OR3 (fioOR[2], d[2], e[2]);
or OR4 (fioOR[3], d[3], e[3]);

optador4b OP1 (s, fioAND, fioOR, f);

endmodule // f4 
// ------------------------- 
module test_f4; 
// ------------------------- definir dados 
reg [3:0] p; 
reg [3:0] t; 
reg f;
wire [3:0] z; 
f4 modulo (z, p, t, f); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0032 - Ursula Rosa - 427468"); 
$display("Test LU's module"); 
p = 4'b0011; t = 4'b0101; f=0;
// projetar testes do modulo 
#1 $monitor("%3b %3b option: %1b == %3b",p,t,f,z); 
#1 f=1;
#1 p = 4'b0010; t = 4'b1101; f=0;
#1 p = 4'b0010; t = 4'b1101; f=1;
#1 p = 4'b0111; t = 4'b1111; f=0;
#1 p = 4'b0111; t = 4'b1111; f=1;
#1 p = 4'b1001; t = 4'b0000; f=0;
#1 p = 4'b1000; t = 4'b0000; f=1;
#1 p = 4'b1010; t = 4'b0101; f=0;
#1 p = 4'b1010; t = 4'b0101; f=1;
end 
endmodule // test_f4 