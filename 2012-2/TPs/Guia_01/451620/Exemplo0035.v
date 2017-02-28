// -------------------------
// Exemplo0035 - F4
// Nome: TIAGO MATTA MACHADO ZAIDAN
// Matricula: 451620
// -------------------------
// -------------------------
// f4_gate
// -------------------------

module f1 (output s,
input  a,
input  b,
input [2:0] chave);

wire c0,c1,c2,c3,c4,c5,chave22,chave11,chave33,aa,bb,temp0,temp1,temp2,temp2a,temp2b,temp3a,temp3b,temp4a,temp4b,temp5a,temp5b,temp5c,temp6,temp7,temp8,temp9;

not not1 (aa,a);
not not2 (bb,b);
not not4 (chave11,chave[0]);
not not3 (chave22,chave[1]);
not not4 (chave33,chave[2]);

and and1 (temp0,aa,bb);
and and1a (c0,temp0,chave11);

and and2 (temp1,aa,b);
and and2a (c1,temp1,chave22);

and and3 (temp2a,a,bb);
and and3a (temp2b,chave22,chave[0]);
and and3b (c2,temp2a,temp2b);

and and4  (temp3a,a,bb);
and and4a (temp3b,chave[2],chave22);
and and4b (c3,temp3a,temp3b);

and and5  (temp4a,a,b);
and and5a (temp4b,chave33,chave[0]);
and and5b (c4,temp4a,temp4b);

and and6  (temp5a,a,b);
and and6a (temp5b,chave[2],chave[1]);
and and6b (temp5c,temp5a,temp5b);
and and6c (c5,temp5c,chave11);

or or1   (temp6,c0,c1);
or or2   (temp7,c2,c3);
or or3   (temp8,c4,c5);

or or4   (temp9,temp6,temp7);
or or5   (s,temp8,temp9);

endmodule // f4

module test_f1;
// ------------------------- definir dados
reg  x0,x1,x2,x3,x4,x5,x6;
reg  y0,y1,y2,y3,y4,y5,y6;

wire z0,z1,z2,z3,z4,z5,z6;

reg  [2:0]chave1;
reg  [2:0]chave2;
reg  [2:0]chave3;
reg  [2:0]chave4;
reg  [2:0]chave5;
reg  [2:0]chave6;
reg  [2:0]chave7;

f1  NOT   (z0, x0, y0,chave1);
f1  OR    (z1, x1, y1,chave2);
f1  NOR   (z2, x2, y2,chave3);
f1  AND   (z3, x3, y3,chave4);
f1  NAND  (z4, x4, y4,chave5);
f1  XOR   (z5, x5, y5,chave6);
f1  XNOR  (z6, x6, y6,chave7);

// ------------------------- parte principal
initial begin
$display("Exemplo0035 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Test LU's module");
x0 = 1; y0 = 0;
x1 = 1; y1 = 0;
x2 = 1; y2 = 0;
x3 = 1; y3 = 0;
x4 = 1; y4 = 0;
x5 = 1; y5 = 0;
x6 = 1; y6 = 0;

chave1 = 3'b000;
chave2 = 3'b001;
chave3 = 3'b010;
chave4 = 3'b011;
chave5 = 3'b100;
chave6 = 3'b101;
chave7 = 3'b110;

// projetar testes do modulo

#1 $display("chave = %3b  -->  %b   not    = %b",chave1,x0,z0);

#1 $display("chave = %3b  -->  %b   or   %b   = %b",chave2,x1,y1,z1);

#1 $display("chave = %3b  -->  %b   nor    %b   = %b",chave3,x2,y2,z2);

#1 $display("chave = %3b  -->  %b   and   %b   = %b",chave4,x3,y3,z3);

#1 $display("chave = %3b  -->  %b   nand    %b   = %b",chave5,x4,y4,z4);

#1 $display("chave = %3b  -->  %b   xor    %b   = %b",chave6,x5,y5,z5);

#1 $display("chave = %3b  -->  %b   xnor   %b   = %b",chave7,x6,y6,z6);
end
endmodule // test_f