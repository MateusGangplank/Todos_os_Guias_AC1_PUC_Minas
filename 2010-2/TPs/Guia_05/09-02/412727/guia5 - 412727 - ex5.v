module xorNOR (s0 , a , b);

output s0;
input a , b;

output w0 , w1 , w2 , w3;
wire w0 , w1 , w2 , w3;

nor negarA (w0 , a , a);
nor (w1 , w0 , b);
nor negarB (w2 , b , b);
nor (w3 , a , w2);
nor (w4 , w3 , w1);
nor (s0 , w4 , w4);

endmodule

module andNOR (s0 , a , b);

output s0;
input a , b;

output w0 , w1;
wire w0 , w1;

nor negarA (w0 , a , a);
nor negarB (w1 , b , b);
nor (s0 , w0 , w1);

endmodule


module orNOR (s0 , a , b);

output s0;
input a , b;

output w0;
wire w0;

nor (w0 , a , b);
nor (s0 , w0 , w0);

endmodule

module meiadiferenca (s0 , s1 , a , b);

output s0 , s1;

input a , b;

output w0;
wire w0;

xorNOR xn1(s0 , a , b);
nor naegarA(w0 , a , a);
andNOR an1(s1 , w0 , b);

endmodule

module diferencacompleta (s0 , s1 , a , b , c);

output s0 , s1;
input a , b , c;

output w0 , w1 , w2;
wire w0 , w1 , w2;


meiadiferenca md1(s0 , w0 , a , b);
meiadiferenca md2(s1 , w1 , w0 , c);
orNOR on1(s2 , w1 , w2);

endmodule


module teste;

output s0 , s1 , s2;
reg a0 , a1 , b0 , b1;

output c0;
wire c0;

meiadiferenca md1(s0 , c0 , a0 , b0);
diferencacompleta dc1(s1 , s2 , a1 , b1 , c0);

initial begin: start

a0 = 0 ; a1 = 0 ;  b0 = 0 ; b1 = 0;

end

initial begin: main

$display("Guia 5 - Exercicio 5\nAugusto Ferreira Andrade do Carmo\n\n");
$display("a0 a1 b0 b1   s0 s1 s2");
$monitor("%b  %b  %b  %b    %b  %b  %b", a0 , a1 , b0 , b1 , s2 , s1 , s0);

#1 a0 = 0 ; a1 = 0 ;  b0 = 0 ; b1 = 0;
#1 a0 = 0 ; a1 = 0 ;  b0 = 0 ; b1 = 1;
#1 a0 = 0 ; a1 = 0 ;  b0 = 1 ; b1 = 0;
#1 a0 = 0 ; a1 = 0 ;  b0 = 1 ; b1 = 1;
#1 a0 = 0 ; a1 = 1 ;  b0 = 0 ; b1 = 0;
#1 a0 = 0 ; a1 = 1 ;  b0 = 0 ; b1 = 1;
#1 a0 = 0 ; a1 = 1 ;  b0 = 1 ; b1 = 0;
#1 a0 = 0 ; a1 = 1 ;  b0 = 1 ; b1 = 1;
#1 a0 = 1 ; a1 = 0 ;  b0 = 0 ; b1 = 0;
#1 a0 = 1 ; a1 = 0 ;  b0 = 0 ; b1 = 1;
#1 a0 = 1 ; a1 = 0 ;  b0 = 1 ; b1 = 0;
#1 a0 = 1 ; a1 = 0 ;  b0 = 1 ; b1 = 1;
#1 a0 = 1 ; a1 = 1 ;  b0 = 0 ; b1 = 0;
#1 a0 = 1 ; a1 = 1 ;  b0 = 0 ; b1 = 1;
#1 a0 = 1 ; a1 = 1 ;  b0 = 1 ; b1 = 0;
#1 a0 = 1 ; a1 = 1 ;  b0 = 1 ; b1 = 1;

end

endmodule