// ---------------------
// PUC-Minas - Instituto de Informática
// ARQ1 Guia-08 Exercicio 03
// Data de entrega: 28-31/03/2011
// Nome: Pedro Tronbin
// Matricula: 410473
// ---------------------


module funcao (a,s);

// f = m(0,1,4,5,7,8,9,13,14,15,17,19,20,21,22,27,29,30,31)
// 0 - 00000(0)
// 1 - 00001(1), 00100(4),01000(8),
// 2 - 00101(5), 01001(9), 10001(17), 10100(20),
// 3 - 00111(7), 01101(13), 01110(14), 10011(19), 10101(21), 10110(22)
// 4 - 01111(15), 11011(27), 11101(29), 11110(30)
// 5 - 11111(31)

//g(2)
// (0,1) 0000_ - (4,5) 0010_ - (8,9) 0100_ - (1,17) _0001 - (21,20) 1010_
// (7,15) 0_111 - (13,29) _1101 - (19,27) 1_011 - (14,30) _1110 - (20,22) 101_0
// (30,31) 1111_

//g(4)
// (0,1,4,5) 00_0_ A
// (0,1,8,9) 0_00_ B
// (1,17) C (20,21) J
// (7,15) D, (13,29) E, (19,27) F, (14,30)G, (20,22)H, (30,31) I

//  00 01 04 05 07 08 09 13 14 15 17 19 20 21 22 27 29 30 31
//A x  x  x  x
//B x  x           x   x
//C    x                          x          
//D             x               x
//E                       x                         x
//F                                   x           x
//G                          x                         x
//H                                     x      x
//I                                                    x x
//J                                     x  x

// ~a~b~d (A) + ~a~c~d (B) + ~b~c~de (C)
// + ~acde (D) + bc~de (E) + a~cde (F) + 
// + bcd~e (G) + a~bc~e (H) + abcd (I) + a~bc~d (J)

output s;
input  [4:0]a;
wire na,nb,nc,nd,ne;
wire e1,e2,e3,e4,e5,e6,e7,e8,e9,e10;

not NOTA (na,a[4]);
not NOTB (nb,a[3]);
not NOTC (nc,a[2]);
not NOTD (nd,a[1]);
not NOTE (ne,a[0]);

and AND1 (e1,na,nb,nd);
and AND2 (e2,na,nc,nd);
and AND3 (e3,nb,nc,nd,a[0]);
and AND4 (e4,na,a[2],a[1],a[0]);
and AND5 (e5,a[3],a[2],nd,a[0]);
and AND6 (e6,a[4],nc,a[1],a[0]);
and AND7 (e7,a[3],a[2],a[1],ne);
and AND8 (e8,a[4],nb,a[2],ne);
and AND9 (e9,a[4],a[3],a[2],a[1]);
and AND10 (e10,a[4],nb,a[2],nd);
or OR1 (s,e1,e2,e3,e4,e5,e6,e7,e8,e9,e10);

endmodule

module testexs;

reg [4:0]a;
wire s;
funcao F (a,s);

initial begin

      $display("Guia 08 Exercicio03 - Pedro Tronbin - 410473");
      $display("AAAAA  |  s");
a = 4'b0000;
#1	 $monitor("%5b  |  %b", a,s);
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
#1 a=a+1;
 end

endmodule 
/* SAIDAS

    AAAAA  |  s
    00000  |  1
    00001  |  1
    00010  |  0
    00011  |  0
    00100  |  1
    00101  |  1
    00110  |  0
    00111  |  1
    01000  |  1
    01001  |  1
    01010  |  0
    01011  |  0
    01100  |  0
    01101  |  1
    01110  |  1
    01111  |  1
    10000  |  0
    10001  |  1
    10010  |  0
    10011  |  1
    10100  |  1
    10101  |  1
    10110  |  1
    10111  |  0
    11000  |  0
    11001  |  0
    11010  |  0
    11011  |  1
    11100  |  0
    11101  |  1
    11110  |  1
    11111  |  1
/*