
 // ------------------------- 
// Exemplo0031 - Somador e Subtração
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




module f2 ( output [1:0] s,
input a,
input b,
input carryIn);
wire [1:0] x;
wire [1:0] y;
wire b_out;
subtractor s1 (x, a, b);
subtractor s2 (y, x[1], b);
or o1 (b_out, x[1], y[1]);
assign s[1] = b_out;
assign s[0] = y[0];   
endmodule // f2

module subtractor ( output [1:0] s,
input a,
input b);
wire sn ;
wire resultado ;
wire b_out;
not n1 (sn, a);
and a1 (b_out, sn, b);
xor x1 (resultado, a ,b);
assign s[1] = b_out;
assign s[0] = resultado;

endmodule // subtractor

module subfinal ( output [5:0] s,
input [5:0] a,
input [5:0] b);
wire [1:0] t1;
wire [1:0] t2;
wire [1:0] t3;
wire [1:0] t4;
wire [1:0] t5;
wire [1:0] t6;
subtractor s1 (t1, a[0], b[0]); 
f2 s2 (t2, a[1], b[1], s1[1]);
f2 s3 (t3, a[2], b[2], s2[1]);
f2 s4 (t4, a[3], b[3], s3[1]);
f2 s5 (t5, a[4], b[4], s4[1]);
f2 s6 (t6, a[5], b[5], s5[1]);
assign s[0] = t1[0];
assign s[1] = t2[0];
assign s[2] = t3[0];
assign s[3] = t4[0];
assign s[4] = t5[0];
assign s[5] = t6[0];

endmodule // subfinal

module final ( output [5:0] f,
input [5:0] a,
input [5:0] b,
input carryIn,
input b_out);
wire[5:0] k;
wire[5:0] l;
wire[5:0] n;
subfinal t (k, a, b );
somafinal o (l, a, b );
and a1 (n, k, l);
assign f = n ;

endmodule // final





module test_fullAdder;  


// ------------------------- definir dados 
 

reg [5:0] a;
reg [5:0] b;
reg [5:0] c;
reg [5:0] d;
wire carry; 
wire [5:0] soma; 
wire [5:0] subtracao;
wire [5:0] resultado;
subfinal modulo2 (subtracao, a, b); 
somafinal modulo1 (soma, c, d);
final modulo3 (resultado, c, d, a, b);


// ------------------------- parte principal 
initial begin 
$display("Exemplo0021 - Gustavo Jota Resende - 427413"); 
$display("Test ALU's full adder e subtrator"); 
// projetar testes do somador complete

a = 6'b110110; b = 6'b010101; c = 6'b110110; d = 6'b010101;  
$monitor("Subtracao %6b - %6b = %6b", a, b, subtracao ); 
 

$monitor("Soma %6b + %6b = %6b", c, d, soma );  


$monitor("Soma & Subtracao" , a, b, c, d, resultado ); 

 
end 
endmodule // test_fullAdder 

//Teste
//Soma 110110 + 010101 = xxxxxx