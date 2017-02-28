module meiasoma (s0 , s1 , a ,b);

output s0 , s1;
input a , b;

xor (s0 , a , b);
and (s1 , a , b);

endmodule


module somacompleta (s0 , s1 , a , b , c);

output s0 , s1;

input a , b , c;

output w0 , w1 , w2 ;

wire w0 , w1 , w2;

xor (w0 , a , b);
xor (s0 , w0 , c);
and (w1 , w0 , c);
and (w2 , a , b);
or (s1 , w1 , w2);

//--usando duas meia-somas
//------------------------
//--output s0 , s1;
//--input a , b , c;
//--
//--output w0 , w1 , w2;
//--wire w0 , w1 , w2;
//--
//--meiasoma ms1(w0 , w1 , a , b);
//--meiasoma ms2(s0 , w2 , w0 , c);
//--or (s1 , w1 , w2);




endmodule


module teste;

output s0 , s1 , s2 , s3;

reg a0 , a1 , a2 , b0 , b1 , b2;

output c0 , c1;
wire c0 , c1;

meiasoma ms1(s0 , c0 , a0 , b0);
somacompleta sc1(s1 , c1 , a1 , b1 , c0);
somacompleta sc2(s2 , s3 , a2 , b2 , c1);

initial begin: start

a0 = 0 ; a1 = 0 ; a2 = 0 ; b0 = 0 ; b1 = 0 ; b2 = 0;
end



initial begin: main

$display("Guia 5 - Exercicio 1\nAugusto Ferreira Andrade do Carmo\n\n");
$display ("a0  a1  a2  b0  b1  b2    s3  s2  s1  s0");
$monitor ("%b   %b   %b   %b   %b   %b     %b   %b   %b   %b", a0 , a1 , a2 , b0 , b1 , b2 , s3 , s2 , s1 , s0);

#1 a0 = 0 ; a1 = 0 ; a2 = 0 ; b0 = 0 ; b1 = 0 ; b2 = 0;
#1 a0 = 0 ; a1 = 0 ; a2 = 0 ; b0 = 0 ; b1 = 0 ; b2 = 1;
#1 a0 = 0 ; a1 = 0 ; a2 = 0 ; b0 = 0 ; b1 = 1 ; b2 = 0;
#1 a0 = 0 ; a1 = 0 ; a2 = 0 ; b0 = 0 ; b1 = 1 ; b2 = 1;
#1 a0 = 0 ; a1 = 0 ; a2 = 0 ; b0 = 1 ; b1 = 0 ; b2 = 0;
#1 a0 = 0 ; a1 = 0 ; a2 = 0 ; b0 = 1 ; b1 = 0 ; b2 = 1;
#1 a0 = 0 ; a1 = 0 ; a2 = 0 ; b0 = 1 ; b1 = 1 ; b2 = 0;
#1 a0 = 0 ; a1 = 0 ; a2 = 0 ; b0 = 1 ; b1 = 1 ; b2 = 1;
#1 a0 = 0 ; a1 = 0 ; a2 = 1 ; b0 = 0 ; b1 = 0 ; b2 = 0;
#1 a0 = 0 ; a1 = 0 ; a2 = 1 ; b0 = 0 ; b1 = 0 ; b2 = 1;
#1 a0 = 0 ; a1 = 0 ; a2 = 1 ; b0 = 0 ; b1 = 1 ; b2 = 0;
#1 a0 = 0 ; a1 = 0 ; a2 = 1 ; b0 = 0 ; b1 = 1 ; b2 = 1;
#1 a0 = 0 ; a1 = 0 ; a2 = 1 ; b0 = 1 ; b1 = 0 ; b2 = 0;
#1 a0 = 0 ; a1 = 0 ; a2 = 1 ; b0 = 1 ; b1 = 0 ; b2 = 1;
#1 a0 = 0 ; a1 = 0 ; a2 = 1 ; b0 = 1 ; b1 = 1 ; b2 = 0;
#1 a0 = 0 ; a1 = 0 ; a2 = 1 ; b0 = 1 ; b1 = 1 ; b2 = 1;
#1 a0 = 0 ; a1 = 1 ; a2 = 0 ; b0 = 0 ; b1 = 0 ; b2 = 0;
#1 a0 = 0 ; a1 = 1 ; a2 = 0 ; b0 = 0 ; b1 = 0 ; b2 = 1;
#1 a0 = 0 ; a1 = 1 ; a2 = 0 ; b0 = 0 ; b1 = 1 ; b2 = 0;
#1 a0 = 0 ; a1 = 1 ; a2 = 0 ; b0 = 0 ; b1 = 1 ; b2 = 1;
#1 a0 = 0 ; a1 = 1 ; a2 = 0 ; b0 = 1 ; b1 = 0 ; b2 = 0;
#1 a0 = 0 ; a1 = 1 ; a2 = 0 ; b0 = 1 ; b1 = 0 ; b2 = 1;
#1 a0 = 0 ; a1 = 1 ; a2 = 0 ; b0 = 1 ; b1 = 1 ; b2 = 0;
#1 a0 = 0 ; a1 = 1 ; a2 = 0 ; b0 = 1 ; b1 = 1 ; b2 = 1;
#1 a0 = 0 ; a1 = 1 ; a2 = 1 ; b0 = 0 ; b1 = 0 ; b2 = 0;
#1 a0 = 0 ; a1 = 1 ; a2 = 1 ; b0 = 0 ; b1 = 0 ; b2 = 1;
#1 a0 = 0 ; a1 = 1 ; a2 = 1 ; b0 = 0 ; b1 = 1 ; b2 = 0;
#1 a0 = 0 ; a1 = 1 ; a2 = 1 ; b0 = 0 ; b1 = 1 ; b2 = 1;
#1 a0 = 0 ; a1 = 1 ; a2 = 1 ; b0 = 1 ; b1 = 0 ; b2 = 0;
#1 a0 = 0 ; a1 = 1 ; a2 = 1 ; b0 = 1 ; b1 = 0 ; b2 = 1;
#1 a0 = 0 ; a1 = 1 ; a2 = 1 ; b0 = 1 ; b1 = 1 ; b2 = 0;
#1 a0 = 0 ; a1 = 1 ; a2 = 1 ; b0 = 1 ; b1 = 1 ; b2 = 1;

#1 a0 = 1 ; a1 = 0 ; a2 = 0 ; b0 = 0 ; b1 = 0 ; b2 = 0;
#1 a0 = 1 ; a1 = 0 ; a2 = 0 ; b0 = 0 ; b1 = 0 ; b2 = 1;
#1 a0 = 1 ; a1 = 0 ; a2 = 0 ; b0 = 0 ; b1 = 1 ; b2 = 0;
#1 a0 = 1 ; a1 = 0 ; a2 = 0 ; b0 = 0 ; b1 = 1 ; b2 = 1;
#1 a0 = 1 ; a1 = 0 ; a2 = 0 ; b0 = 1 ; b1 = 0 ; b2 = 0;
#1 a0 = 1 ; a1 = 0 ; a2 = 0 ; b0 = 1 ; b1 = 0 ; b2 = 1;
#1 a0 = 1 ; a1 = 0 ; a2 = 0 ; b0 = 1 ; b1 = 1 ; b2 = 0;
#1 a0 = 1 ; a1 = 0 ; a2 = 0 ; b0 = 1 ; b1 = 1 ; b2 = 1;
#1 a0 = 1 ; a1 = 0 ; a2 = 1 ; b0 = 0 ; b1 = 0 ; b2 = 0;
#1 a0 = 1 ; a1 = 0 ; a2 = 1 ; b0 = 0 ; b1 = 0 ; b2 = 1;
#1 a0 = 1 ; a1 = 0 ; a2 = 1 ; b0 = 0 ; b1 = 1 ; b2 = 0;
#1 a0 = 1 ; a1 = 0 ; a2 = 1 ; b0 = 0 ; b1 = 1 ; b2 = 1;
#1 a0 = 1 ; a1 = 0 ; a2 = 1 ; b0 = 1 ; b1 = 0 ; b2 = 0;
#1 a0 = 1 ; a1 = 0 ; a2 = 1 ; b0 = 1 ; b1 = 0 ; b2 = 1;
#1 a0 = 1 ; a1 = 0 ; a2 = 1 ; b0 = 1 ; b1 = 1 ; b2 = 0;
#1 a0 = 1 ; a1 = 0 ; a2 = 1 ; b0 = 1 ; b1 = 1 ; b2 = 1;
#1 a0 = 1 ; a1 = 1 ; a2 = 0 ; b0 = 0 ; b1 = 0 ; b2 = 0;
#1 a0 = 1 ; a1 = 1 ; a2 = 0 ; b0 = 0 ; b1 = 0 ; b2 = 1;
#1 a0 = 1 ; a1 = 1 ; a2 = 0 ; b0 = 0 ; b1 = 1 ; b2 = 0;
#1 a0 = 1 ; a1 = 1 ; a2 = 0 ; b0 = 0 ; b1 = 1 ; b2 = 1;
#1 a0 = 1 ; a1 = 1 ; a2 = 0 ; b0 = 1 ; b1 = 0 ; b2 = 0;
#1 a0 = 1 ; a1 = 1 ; a2 = 0 ; b0 = 1 ; b1 = 0 ; b2 = 1;
#1 a0 = 1 ; a1 = 1 ; a2 = 0 ; b0 = 1 ; b1 = 1 ; b2 = 0;
#1 a0 = 1 ; a1 = 1 ; a2 = 0 ; b0 = 1 ; b1 = 1 ; b2 = 1;
#1 a0 = 1 ; a1 = 1 ; a2 = 1 ; b0 = 0 ; b1 = 0 ; b2 = 0;
#1 a0 = 1 ; a1 = 1 ; a2 = 1 ; b0 = 0 ; b1 = 0 ; b2 = 1;
#1 a0 = 1 ; a1 = 1 ; a2 = 1 ; b0 = 0 ; b1 = 1 ; b2 = 0;
#1 a0 = 1 ; a1 = 1 ; a2 = 1 ; b0 = 0 ; b1 = 1 ; b2 = 1;
#1 a0 = 1 ; a1 = 1 ; a2 = 1 ; b0 = 1 ; b1 = 0 ; b2 = 0;
#1 a0 = 1 ; a1 = 1 ; a2 = 1 ; b0 = 1 ; b1 = 0 ; b2 = 1;
#1 a0 = 1 ; a1 = 1 ; a2 = 1 ; b0 = 1 ; b1 = 1 ; b2 = 0;
#1 a0 = 1 ; a1 = 1 ; a2 = 1 ; b0 = 1 ; b1 = 1 ; b2 = 1;

end



endmodule