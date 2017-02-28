// ---------------------
// Guia08
// Nome: Lucas Teixeira Santos
// Matricula: 415383
// ---------------------

module funcao (a,s);
// 0 ~ 0000 [0]
// 1 ~ 0010 [2]  0100 [4] +  1000 [8]
// 2 ~ 1001 [9]
// 3 ~ 1011 [11] + 1101 [13]

// (0,2) 00_0 [A] + (0,4) 0_00  [B]
// (8,9) 100_ [C]
// (9,11) 10_1 [D] + (9,13) 1_01 [E]

///  0  2  4  8  9  11  13
//A  x  x
//B  x     x
//C           x  x
//D              x  x
//E              x      x

// (~a.~b.~d) + (~a.~c.~d) + (a.~b.~c) + (a.~b.d) + (a.~c.d)

output s;
input  [3:0]a;
wire e1,e2,e3,e4,e5;
wire nota,notb,notc,notd;
not NOT1 (nota,a[3]);
not NOT2 (notb,a[2]);
not NOT3 (notc,a[1]);
not NOT4 (notd,a[0]);
and AND1 (e1,nota,notb,notd);
and AND2 (e2,nota,notc,notd);
and AND3 (e3,a[3],notb,notc);
and AND4 (e4,a[3],notb,a[0]);
and AND5 (e5,a[3],notc,a[0]);
or OR1 (s,e1,e2,e3,e4,e5);
endmodule

module testexs;
reg [3:0]a;
wire s;
funcao F (a,s);

initial begin
      $display("Guia 08 Ex02 - Lucas Teixeira Santos - 415383");
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
    0000  |  1
    0001  |  0
    0010  |  1
    0011  |  0
    0100  |  1
    0101  |  0
    0110  |  0
    0111  |  0
    1000  |  1
    1001  |  1
    1010  |  0
    1011  |  1
    1100  |  0
    1101  |  1
    1110  |  0
    1111  |  0
/*