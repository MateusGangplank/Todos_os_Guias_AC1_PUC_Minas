// ---------------------
// Guia08
// Nome: Lucas Teixeira Santos
// Matricula: 415383
// ---------------------

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

module or_nand (s,a,b,c);
output s;
input a,b,c;
wire nota,notb,notc;
nand NAND1 (nota,a);
nand NAND2 (notb,b);
nand NAND3 (notc,c);
nand NAND4 (s,nota,notb,notc);
endmodule

module and_nand (s,a,b);
output s;
input a,b;
wire s1;
nand NAND1 (s1,a,b);
nand NAND2 (s,s1);
endmodule

module and_nand2 (s,a,b,c);
output s;
input a,b,c;
wire s1;
nand NAND1 (s1,a,b,c);
nand NAND2 (s,s1);
endmodule

module funcao (a,s);
output s;
input  [3:0]a;
wire a2,a3,a0,e1,e2,e3;
nand NAND1 (a2,a[2]);
nand NAND2 (a0,a[0]);
nand NAND3 (a3,a[3]);
and_nand AND1 (e1,a2,a[1]);
and_nand AND2 (e2,a3,a[1]);
and_nand2 AND3 (e3,a[3],a[2],a0);
or_nand OR1 (s,e1,e2,e3);
endmodule

module testexs;
reg [3:0]a;
wire s;
funcao F (a,s);

initial begin
      $display("Guia 08 Ex04 - Lucas Teixeira Santos - 415383");
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
/* test
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