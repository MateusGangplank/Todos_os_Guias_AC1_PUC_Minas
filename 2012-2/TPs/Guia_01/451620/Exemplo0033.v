// -------------------------
// Exemplo0033 - F4
// Nome: TIAGO MATTA MACHADO ZAIDAN
// Matricula: 451620
// -------------------------
// -------------------------
// f4_gate
// -------------------------

module f1 (output s1,
input  a,
input  b,
input chave);
wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9;

or or1     (c0,a,b);
and and1   (c1,a,b);
nor nor1   (c2,a,b);
nand nand1 (c3,a,b);
not not1   (c4,chave);
buf buf1   (c5,chave);
and and2   (c6,c0,c4);
and and3   (c7,c1,c4);
and and4   (c8,c2,c5);
and and5   (c9,c3,c5);
or or2     (s1,c6,c8);

endmodule // f4

module f2 (output s2,
input  a,
input  b,
input chave);
wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9;

or or1     (c0,a,b);
and and1   (c1,a,b);
nor nor1   (c2,a,b);
nand nand1 (c3,a,b);
not not1   (c4,chave);
buf buf1   (c5,chave);
and and2   (c6,c0,c4);
and and3   (c7,c1,c4);
and and4   (c8,c2,c5);
and and5   (c9,c3,c5);
or or2     (s2,c7,c9);

endmodule // f4

module test_f4;
// ------------------------- definir dados
reg  x,a;
reg  y,b;
reg  x2,a2;
reg  y2,b2;
reg  chave1,chave2;
wire z,c;
wire z2,c2;
f1  OR  (z, x, y,chave1);
f2  AND (c, a, b,chave1);

f1  NOR  (z2, x2, y2,chave2);
f2  NAND (c2, a2, b2,chave2);

// ------------------------- parte principal
initial begin
$display("Exemplo0033 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Test LU's module");
x = 1; y = 0;
a = 1; b = 0;
x2 = 1; y2 = 0;
a2 = 1; b2 = 0;
chave1 = 0; chave2 = 1;
// projetar testes do modulo

#1 $display("chave = %b  -->  %b   or    %b = %b",chave1,x,y,z);

#1 $display("chave = %b  -->  %b   and  %b = %b",chave1,a,b,c);

#1 $display("chave = %b  -->  %b   nor    %b = %b",chave2,x2,y2,z2);

#1 $display("chave = %b  -->  %b   nand  %b = %b",chave2,a2,b2,c2);
end
endmodule // test_f4