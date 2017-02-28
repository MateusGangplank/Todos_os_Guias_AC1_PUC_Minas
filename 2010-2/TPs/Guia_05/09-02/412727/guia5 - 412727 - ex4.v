module andNAND (s0 , a , b);

output s0;
input a , b;

output w0;
wire w0;

nand (w0 , a , b);
nand (s0 , w0, w0);

endmodule

module orNAND (s0 , a , b);

output s0;
input a , b;

output w0 , w1;
wire w0 , w1;

nand negarA (w0 , a , a);
nand negarB (w1 , b , b);
nand (s0 , w0 , w1);

endmodule


module xorNAND (s0 , a , b );

output s0;
input a , b;

output w0 , w1 , w2 , w3;
wire w0 , w1 , w2 , w3;

nand negarA(w0 , a , a);//--a negado
nand (w1 , w0 , b);//-- ~(~a.b)
nand negarB (w2 , b , b);//--~b
nand (w3 , a , w2);//--~(a.~b)
nand (s0 , w3 , w1);//--~(~(a.~b).~(~a.b));


endmodule

module meiasoma (s0 , s1 , a ,b);

output s0 , s1;
input a , b;

xorNAND xn1(s0 , a , b);
andNAND an1(s1 , a , b);

endmodule

module somacompleta (s0 , s1 , a , b , c);


output s0 , s1;
input a , b , c;

output w0 , w1 , w2;
wire w0 , w1 , w2;

meiasoma ms1(w0 , w1 , a , b);
meiasoma ms2(s0 , w2 , w0 , c);
orNAND on1(s1 , w1 , w2);




endmodule


module teste;


output s0 , s1 , s2;
reg a0 , a1 , b0 , b1;

output c0;
wire c0;

meiasoma ms1 (s0 , c0 , a0 , b0);
somacompleta sm2 (s1 , s2 , a1 , b1 , c0);

initial begin: start

a0 = 0 ; a1 = 0 ;  b0 = 0 ; b1 = 0;

end

initial begin: main


$display("Guia 5 - Exercicio 4\nAugusto Ferreira Andrade do Carmo\n\n");
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

