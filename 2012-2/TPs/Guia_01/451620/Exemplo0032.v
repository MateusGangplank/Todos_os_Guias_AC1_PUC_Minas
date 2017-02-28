// -------------------------
// Exemplo0032 - F4
// Nome: TIAGO MATTA MACHADO ZAIDAN
// Matricula: 451620
// -------------------------
// -------------------------
// f4_gate
// -------------------------

module f4 (output s,
input  a,
input  b,
input chave);
wire c0,c1,c2,c3,c4,c5,c6;
or or1   (c0,a,b);
and and1 (c1,a,b);
not not1 (c2,chave);
buf buf1 (c4,chave);
and and2 (c5,c2,c0);
and and3 (c6,c4,c1);
or or2   (s,c5,c6);

endmodule // for4

module test_f4;
// ------------------------- definir dados
reg  x,a;
reg  y,b;
reg  chave1,chave2;
wire z,c;
f4  OR  (z, x, y,chave1);
f4  AND (c, a, b,chave2);
// ------------------------- parte principal
initial begin
$display("Exemplo0032 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Test LU's module");
x = 1; y = 0;
a = 1; b = 0;
chave1 = 0; chave2 = 1;
// projetar testes do modulo

#1 $display("chave = %b  -->  %b   or    %b = %b",chave1,x,y,z);

#1 $display("chave = %b  -->  %b   and  %b = %b",chave2,a,b,c);
end
endmodule // test_f4