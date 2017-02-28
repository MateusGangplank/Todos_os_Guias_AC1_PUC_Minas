// -------------------------
// FF04
// Nome: Guilherme Andrade Salum Terra 
// Matricula: 427407
// ------------------------- 

module jkff ( output q, output qnot, 
              input j, input k, input clk ); 

reg q, qnot; 

always @( posedge clk ) 
begin 
 if ( j & ~k ) 
begin 
 q <= 1; qnot <= 0; 
end 
else 
 if ( ~j & k ) 
begin 
 q <= 0; qnot <= 1; 
end 
else 
 if ( j & k ) 
begin 
 q <= ~q; qnot <= ~qnot; 
end 

end 
endmodule // jkff 

module nandaGate (output s,
                 input a, input b);
assign s = ~(a & b);
endmodule // nandaGate

module nandGate (output s,
                 input a, input b, input c, input d);
assign s = ~(a & b & c & d);
endmodule // nandGate

module notGate (output s,
                input a);
assign s = ~a;
endmodule // notGate

module test_FF04;

reg pulse;
reg o;
reg clr;
wire a;
wire b;
wire c;
wire d;
wire qna;
wire qnb;
wire qnc;
wire qnd;
wire na, nb, ou, e;

jkff domada  (d, qna, o, o, pulse);
jkff bilara  (c, qnb, o, o, qna);
jkff bonanza (b, qnc, o, o, qnb);
jkff luma    (a, qnd, o, o, qnc);

notGate foxa (na, d);
notGate foxb (nb, b);
nandGate danubio (ou, na, c, nb, a);
nandaGate quebeck (e, clr, ou);

initial begin
	$display("FF04 - Guilherme Terra - 427407");
	$display("Test FF (Up) Decade counter");

	pulse = 1; o = 1;
#1	$display("\n%b %b %b %b",a,b,c,d);
	pulse = 0; o = 1;
#1	$display("\n%b %b %b %b",a,b,c,d);
	pulse = 1; o = 1;
#1	$display("\n%b %b %b %b",a,b,c,d);
	pulse = 0; o = 1;
#1	$display("\n%b %b %b %b",a,b,c,d);
	pulse = 1; o = 1;
#1	$display("\n%b %b %b %b",a,b,c,d);
	pulse = 0; o = 1;
#1	$display("\n%b %b %b %b",a,b,c,d);
	pulse = 1; o = 1;
#1	$display("\n%b %b %b %b",a,b,c,d);
	pulse = 0; o = 1;
#1	$display("\n%b %b %b %b",a,b,c,d);

end

endmodule // test_FF04 
