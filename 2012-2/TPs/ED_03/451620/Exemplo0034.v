// -------------------------
// Exemplo0034 - F4
// Nome: TIAGO MATTA MACHADO ZAIDAN
// Matricula: 451620
// -------------------------
// -------------------------
// f4_gate
// -------------------------

module f1 (output s,
input  a,
input  b,
input [1:0] chave);

wire c0,c1,c2,c3,c4,c5,chave22,chave11,aa,bb,temp0,temp1,temp2,temp3a,temp3b,temp4a,temp4b,temp5a,temp5b,temp6,temp7,temp8,temp9;

not not1 (aa,a);
not not2 (bb,b);
not not3 (chave22,chave[1]);
not not4 (chave11,chave[0]);

and and1 (temp0,aa,bb);
and and1a (c0,temp0,chave[0]);

and and2 (temp1,a,chave22);
and and2a (c1,temp1,chave11);

and and3 (temp2,b,chave22);
and and3a (c2,temp2,chave11);

and and4 (temp3a,aa,b);
and and4a (temp3b,chave[1],chave11);
and and4b (c3,temp3a,temp3b);

and and5  (temp4a,a,b);
and and5a (temp4b,chave[1],chave[0]);
and and5b (c4,temp4a,temp4b);

and and6  (temp5a,a,bb);
and and6a (temp5b,chave[1],chave11);
and and6b (c5,temp5a,temp5b);

or or1   (temp6,c0,c1);
or or2   (temp7,c2,c3);
or or3   (temp8,c4,c5);

or or4   (temp9,temp6,temp7);
or or5   (s,temp8,temp9);

endmodule // f4

module test_f1;
// ------------------------- definir dados
reg  x0,x1,x2,x3;
reg  y0,y1,y2,y3;

wire z0,z1,z2,z3;

reg  [1:0]chave1;
reg  [1:0]chave2;
reg  [1:0]chave3;
reg  [1:0]chave4;

f1  OR    (z0, x0, y0,chave1);
f1  NOR   (z1, x1, y1,chave2);
f1  XOR   (z2, x2, y2,chave3);
f1  XNOR  (z3, x3, y3,chave4);

// ------------------------- parte principal
initial begin
$display("Exemplo0034 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Test LU's module");
x0 = 1; y0 = 0;
x1 = 1; y1 = 0;
x2 = 1; y2 = 0;
x3 = 1; y3 = 0;

chave1 = 2'b00;
chave2 = 2'b01;
chave3 = 2'b10;
chave4 = 2'b11;

// projetar testes do modulo

#1 $display("chave = %2b  -->  %b   or    %b    = %b",chave1,x0,y0,z0);

#1 $display("chave = %2b  -->  %b   nor    %b   = %b",chave2,x1,y1,z1);

#1 $display("chave = %2b  -->  %b   xor    %b   = %b",chave3,x2,y2,z2);

#1 $display("chave = %2b  -->  %b   xnor   %b   = %b",chave4,x3,y3,z3);
end
endmodule // test_f