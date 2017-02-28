module meiasoma (s0 , s1 , a ,b);

output s0 , s1;
input a , b;

xor (s0 , a , b);
and (s1 , a , b);

endmodule


module teste;


output s0 , s1 , s2 , s3;
reg a0 , a1 , b0 , b1;

output w0 , w1 , w2 , w3;
wire w0 , w1 , w2 , w3;

and (s0 , a0 , b0);
and (w0 , a1 , b0);
and (w1 , a0 , b1);
meiasoma ms1 (s1 , w2 , w0 , w1);
and (w3 , a1 , b1);
meiasoma ms2 (s2 , s3 , w2 , w3);

initial begin: start

a0 = 0 ; a1 = 0 ; b0 = 0 ; b1 = 0;

end

initial begin: main


$display("Guia 5 - Exercicio 3\nAugusto Ferreira Andrade do Carmo\n\n");
$display("a0 a1 b0 b1   s0 s1 s2 s3");
$monitor("%b  %b  %b  %b    %b  %b  %b  %b", a0 , a1 , b0 , b1 , s3 , s2 , s1 , s0);

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