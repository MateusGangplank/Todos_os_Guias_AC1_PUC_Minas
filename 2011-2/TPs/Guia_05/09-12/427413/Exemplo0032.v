
 // ------------------------- 
// Exemplo0032 - Somador e Subtração
// Nome: Gustavo Jota Resende
// Matricula: 427413
// ------------------------- 
// ------------------------- 
// full adder 
// ------------------------- 

module fullAdder (output [1:0] z,
input c,
input d,
input carryIn);
wire [1:0] x;
wire [1:0] y;
wire carryOut;
somador z1 (x, c, d);
somador z2 (y, x[1], d);
or o2 (carryOut, x[1], y[1]);
assign z[1] = carryOut;
assign z[0] = y[0]; 
endmodule // fullAdder 

module somador ( output [1:0] z,
input c,
input d);
wire zn ;
wire resultado ;
wire carryOut;
not n2 (zn, c);
and a2 (carryOut, zn, d);
xor x2 (resultado, a ,d);
assign z[1] = carryOut;
assign z[0] = resultado;

endmodule // somador

module somafinal ( output [5:0] z,
input [5:0] c,
input [5:0] d);
wire [1:0] k1;
wire [1:0] k2;
wire [1:0] k3;
wire [1:0] k4;
wire [1:0] k5;
wire [1:0] k6;
somador z1 (k1, c[0], d[0]); 
fullAdder z2 (k2, c[1], d[1], z1[1]);
fullAdder z3 (k3, c[2], d[2], z2[1]);
fullAdder z4 (k4, c[3], d[3], z3[1]);
fullAdder z5 (k5, c[4], d[4], z4[1]);
fullAdder z6 (k6, c[5], d[5], z5[1]);
assign z[0] = k1[0];
assign z[1] = k2[0];
assign z[2] = k3[0];
assign z[3] = k4[0];
assign z[4] = k5[0];
assign z[5] = k6[0];

endmodule // subfinal

module final ( output [5:0] f,
input [5:0] a,
input [5:0] b,
input carryIn);
wire[5:0] l;
wire[5:0] n;
wire [1:0] k1;
wire [1:0] k2;
wire [1:0] k3;
wire [1:0] k4;
wire [1:0] k5;
wire [1:0] k6;
somafinal o (l, a, b );
somador z1 (k1, c[0], d[0]); 
xor z2 (k2, c[1], l[1]);
xor z3 (k3, c[2], l[2]);
xor z4 (k4, c[3], l[3] );
xor z5 (k5, c[4], l[4]);
xor z6 (k6, c[5], l[5]);
assign f[0] = k1[0];
assign f[1] = k2[0];
assign f[2] = k3[0];
assign f[3] = k4[0];
assign f[4] = k5[0];
assign f[5] = k6[0];


endmodule // final

module test_fullAdder;  


// ------------------------- definir dados 
 

reg [5:0] a;
reg [5:0] b;
wire carry; 
wire [5:0] soma; 
wire [5:0] resultado;
somafinal modulo1 (soma, a, b);
final modulo3 (resultado, soma,  a, b);


// ------------------------- parte principal 
initial begin 
$display("Exemplo0021 - Gustavo Jota Resende - 427413"); 
$display("Test ALU's full adder e subtrator"); 
// projetar testes do somador complete

a = 6'b110110; b = 6'b010101; 
 

$monitor("Soma %6b + %6b = %6b", a, b, soma );  


$monitor("0 ou 1" , a, b,  resultado ); 

 
end 
endmodule // test_fullAdder 

//Teste
//Soma 110110 + 010101 = xxxxxx