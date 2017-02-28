// -------------------------
// Exemplo0035 - 
// Nome: Thais Mairink
// Matricula: 441710
// -------------------------
// -------------------------
// valor maio, menor, igual a outro
// -------------------------

module AmaiorB (output  s0,input  a,input  b);

wire nb;

not NOT1(nb,b);
and AND1(s0,a,nb);

endmodule //AmaiorB

module AmaiorB4 (output  s0, input [2:0] a,input [2:0] b);

wire c0,c1,c2;

AmaiorB AMB0(c0,a[0],b[0]);
AmaiorB AMB1(c1,a[1],b[1]);
AmaiorB AMB2(c2,a[2],b[2]);

or OR1(s0,c0,c1,c2);

endmodule  //AmaiorB4

module BmaiorA (output  s0,input  a,input  b);

wire na;

not NOT1(na,a);
and AND1(s0,na,b);

endmodule//BmaiorA

module BmaiorA4 (output  s0,input [2:0] a,input [2:0] b);

wire c0,c1,c2;

BmaiorA BMA0(c0,a[0],b[0]);
BmaiorA BMA1(c1,a[1],b[1]);
BmaiorA BMA2(c2,a[2],b[2]);

or OR1(s0,c0,c1,c2);

endmodule//BmaiorA4

module igual (output  s0,input  a,input  b);

xnor XNOR1(s0,a,b);

endmodule //igual

module igual4 (output  s0,input [2:0] a,input [2:0] b);

wire c0,c1,c2;

igual igual0(c0,a[0],b[0]);
igual igual1(c1,a[1],b[1]);
igual igual2(c2,a[2],b[2]);

and AND1(s0,c0,c1,c2);

endmodule//igual4

module main (output  s0, output  s1, output  s2,input  [2:0] a,input  [2:0] b);

AmaiorB4 A0(s0,a,b);
BmaiorA4 B0(s1,a,b);
igual4 I0(s2,a,b);

endmodule//main

module test_main;
// ------------------------- definir dados
reg [2:0] x,y;
wire g,h,i;
main modulo1 (g,h, i, x, y);
// ------------------------- parte principal
initial begin
$display("Exemplo0035 - Thais Mairink - 441710");
$display("Test LU's module");

#1 x = 3'b000; y = 3'b000;

   $display("  a    b  A>B B>A  Igual");
#1 $monitor("%3b  %3b = %1b   %1b   %1b ",x,y,g,h,i);
		#1 x = 3'b000; y = 3'b001;
		#1 x = 3'b001; y = 3'b000;
		#1 x = 3'b001; y = 3'b001;
		#1 x = 3'b001; y = 3'b011;
		#1 x = 3'b000; y = 3'b000;
		#1 x = 3'b011; y = 3'b110;
		#1 x = 3'b000; y = 3'b000;

end
endmodule // test_somador