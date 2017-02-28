// ---------------------
// PUC-Minas - Instituto de Informática
// ARQ1 Guia-08 Exercicio 01
// Data de entrega: 28-31/03/2011
// Nome: Pedro Tronbin
// Matricula: 410473
// ---------------------

module funcao (a,s);

// 1 ~ 0010[2] 
// 2 ~ 0011[3] + 0110[6] + 1010[10] + 1100[12] 
// 3 ~ 0111[7] + 1110[14] + 1011[11]

// (2,3)  001_  (6,7) 011_
// (12,14) 11_0 (10,11) 101_

// (2,3,6,7) 0_1_  = B
// (2,3,10,11) _01_ = A
// + (12,14) 11_0  = C

//   2  3  6  7  10  11  12  14
//A  x  x         x  x
//B  x  x  x  x
//C                       x  x

//     A            B             C
//  ~b.c      +    ~a.c    +   a.b.~d
// ~a[2].a[1] + ~a[3].a[1] + a[3].a[2].~a[0]

output s;
input  [3:0]a;
wire a2,a3,a0,e1,e2,e3;

not NOT1 (a2,a[2]);
not NOT2 (a0,a[0]);
not NOT3 (a3,a[3]);
and AND1 (e1,a2,a[1]);
and AND2 (e2,a3,a[1]);
and AND3 (e3,a[3],a[2],a0);
or OR1 (s,e1,e2,e3);
endmodule

module testexs;

reg [3:0]a;
wire s;
funcao F (a,s);

initial begin

      $display("Guia 08 Exercicio01 - Pedro Tronbin - 410473");
      $display("AAAA  |  s");
a = 4'b0000;
#1	 $monitor("%4b  |  %b", a,s);
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

    AAAA  |  s
    0000  |  0
    0001  |  0
    0010  |  1
    0011  |  1
    0100  |  0
    0101  |  0
    0110  |  1
    0111  |  1
    1000  |  0
    1001  |  0
    1010  |  1
    1011  |  1
    1100  |  1
    1101  |  0
    1110  |  1
    1111  |  0

/*