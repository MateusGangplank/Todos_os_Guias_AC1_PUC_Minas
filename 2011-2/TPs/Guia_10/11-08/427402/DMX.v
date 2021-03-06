// --------------------
// --- DMX e MUX
// --- Felipe Ferreira Andrade do Carmo
// --- Exercicio 03
// --------------------

//
//  Demux
//
module DMX ( output out1, output out2, output out3, output out4, input [0:1] sel);

and AND1 (out1,~sel[0],~sel[1]);
and AND1 (out2,~sel[0],sel[1]);
and AND1 (out3,sel[0], ~sel[1]);
and AND1 (out4, sel[0], sel[1]);

endmodule

//
// MUX
// nao consegui fazer

module MUX (output [0:7] resp, input [0:7] int1,input [0:7] int2,input [0:7] int3,input [0:7] int4);

or OR1 (resp [0] , int1 [0], int2 [0], int3 [0], int4 [0]);
or OR1 (resp [1] , int1 [1], int2 [1], int3 [1], int4 [1]);
or OR1 (resp [2] , int1 [2], int2 [2], int3 [2], int4 [2]);
or OR1 (resp [3] , int1 [3], int2 [3], int3 [3], int4 [3]);
or OR1 (resp [4] , int1 [4], int2 [4], int3 [4], int4 [4]);
or OR1 (resp [5] , int1 [5], int2 [5], int3 [5], int4 [5]);
or OR1 (resp [6] , int1 [6], int2 [6], int3 [6], int4 [6]);
or OR1 (resp [7] , int1 [7], int2 [7], int3 [7], int4 [7]);
endmodule



//
//  Demux de 8 op�oes
//
module DMX8 ( output out1, output out2, output out3, output out4, output out5,
            output out6, output out7, output out8, input [0:2] sel);

and AND1 (out1,~sel[0],~sel[1], ~sel[2]);
and AND2 (out2,~sel[0],sel[1] , ~sel[2]);
and AND3 (out3,sel[0], ~sel[1], ~sel[2]);
and AND4 (out4, sel[0], sel[1], ~sel[2]);

and AND5 (out5, sel[0], ~sel[1], ~sel[2]);
and AND6 (out6, sel[0], ~sel[1],  sel[2]);
and AND7 (out7, sel[0],  sel[1], ~sel[2]);
and AND8 (out8, sel[0], sel[1],   sel[2]);

endmodule




//
// MUX 8
// nao consegui fazer

module MUX8 (output [0:7] resp, input [0:7] int1,input [0:7] int2,input [0:7] int3,input [0:7] int4,
             input [0:7] int5, input [0:7] int6, input [0:7] int7, input [0:7] int8);

or OR1 (resp [0] , int1 [0], int2 [0], int3 [0], int4 [0], int5 [0], int6 [0], int7 [0], int8 [0]);
or OR1 (resp [1] , int1 [1], int2 [1], int3 [1], int4 [1], int5 [1], int6 [1], int7 [1], int8 [1]);
or OR1 (resp [2] , int1 [2], int2 [2], int3 [2], int4 [2], int5 [2], int6 [2], int7 [2], int8 [2]);
or OR1 (resp [3] , int1 [3], int2 [3], int3 [3], int4 [3], int5 [3], int6 [3], int7 [3], int8 [3]);
or OR1 (resp [4] , int1 [4], int2 [4], int3 [4], int4 [4], int5 [4], int6 [4], int7 [4], int8 [4]);
or OR1 (resp [5] , int1 [5], int2 [5], int3 [5], int4 [5], int5 [5], int6 [5], int7 [5], int8 [5]);
or OR1 (resp [6] , int1 [6], int2 [6], int3 [6], int4 [6], int5 [6], int6 [6], int7 [6], int8 [6]);
or OR1 (resp [7] , int1 [7], int2 [7], int3 [7], int4 [7], int5 [7], int6 [7], int7 [7], int8 [7]);
endmodule

//
//  TESTE
//

/*module TESTE;

reg [0:1] sel;
wire  a, b, c, d, e;
DMX  H1( a, b, c, d, sel);

initial begin

#1
sel = 00;
#1
$display ("%1b   %1b    %1b   %1b", d, c ,b,a);
#1
sel = 01;
#1
$display ("%1b   %1b    %1b   %1b", d, c ,b,a);
#1
sel = 10;
#1
$display ("%1b   %1b    %1b   %1b", d, c ,b,a);
#1
sel = 11;
#1
$display ("%1b   %1b    %1b   %1b", d, c ,b,a);

end
endmodule
*/






