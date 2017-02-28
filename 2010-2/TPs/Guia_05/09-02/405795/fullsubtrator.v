// ---------------------
// FULL-SUBTRATOR-2B
// Nome: Daniel Sathler Silva
// Matricula: 405795
// ---------------------

// ---------------------
// -- halsubtrator
// ---------------------

module halfsubtrator (s, s0, a, b);
output s, s0;
input a, b;

wire s, s0;
reg p,q;

xor XOR1 ( s, a, b );
and AND1 ( s0, ~a, b);

endmodule // halfsubtrator

// ---------------------
// -- fullsubtrator
// ---------------------

module fullsubtrator (s, s0, Cin, a, b);
output s, s0;
input a, b, Cin;

wire s, s0, s1, s2, s3;
reg p,q,r;

halfsubtrator HALFSUBTRATOR1(s2, s3, a, b);
halfsubtrator HALFSUBTRATOR2(s, s1, s2, Cin);
or OR1(s0, s1, s3);


endmodule // fullsubtrator

// ---------------------
// -- fullsubtrator2b
// ---------------------

module fullsubtrator2b (s0, s1, s2, Cin, a, b, a1, b1);
 output s0, s1, s2;
 input  Cin, a, b, a1, b1;

 fullsubtrator FULLASUBTRATOR1(s0, s4, Cin, a, a1);
 fullsubtrator FULLASUBTRATOR2(s1, s2, s4, b, b1);
 
endmodule // fullsubtrator2b

// ---------------------
// -- test fullsubtrator2b
// ---------------------

module testfullsubtrator;
reg Cin, a, b, a1, b1;
wire s0, s1, s2;

// instancia
fullsubtrator2b FULLSUBTRATOR2B1 (s0, s1, s2, Cin, a, b, a1, b1);

// parte principal
initial begin

$display("FULLSUBTRATOR - Daniel Sathler Silva - 405795");
$display("Test FULLSUBTRATOR");
$display("\n(c) a   -  b  = s\n");
$monitor("(%b) %b %b - %b %b = %b %b %b", Cin, a, b, a1, b1, s0, s1, s2);
#1  Cin=0; a=0; b=0; a1=0; b1=0;
#1  Cin=0; a=0; b=0; a1=0; b1=1;
#1  Cin=0; a=0; b=0; a1=1; b1=0;
#1  Cin=0; a=0; b=0; a1=1; b1=1;
#1  Cin=0; a=0; b=1; a1=0; b1=0;
#1  Cin=0; a=0; b=1; a1=0; b1=1;
#1  Cin=0; a=0; b=1; a1=1; b1=0;
#1  Cin=0; a=0; b=1; a1=1; b1=1;
#1  Cin=0; a=1; b=0; a1=0; b1=0;
#1  Cin=0; a=1; b=0; a1=0; b1=1;
#1  Cin=0; a=1; b=0; a1=1; b1=0;
#1  Cin=0; a=1; b=0; a1=1; b1=1;
#1  Cin=0; a=1; b=1; a1=0; b1=0;
#1  Cin=0; a=1; b=1; a1=0; b1=1;
#1  Cin=0; a=1; b=1; a1=1; b1=0;
#1  Cin=0; a=1; b=1; a1=1; b1=1;

  


end
endmodule // testfullsubtrator2b