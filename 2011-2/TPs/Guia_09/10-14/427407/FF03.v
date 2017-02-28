// -------------------------
// FF03
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

module orGate (output s,
               input a, input b);
assign s = a | b;
endmodule // orGate

module andGate (output s,
                input a, input b, input c, input d);
assign s = (a & b & c & d);
endmodule // andGate

module notGate (output s,
                input a);
assign s = ~a;
endmodule // notGate

module test_FF03;

reg pulse;
reg o;
wire a;
wire b;
wire c;
wire d;
wire qna;
wire qnb;
wire qnc;
wire qnd;
wire na, nb, nc, ou, e;

jkff domada  (d, qna, o, o, pulse);
jkff bilara  (c, qnb, o, o, d);
jkff bonanza (b, qnc, o, o, c);
jkff luma    (a, qnd, o, o, b);

notGate foxa (na, qna);
notGate foxb (nb, qnc);
notGate foxc (nc, o);
andGate danubio (ou, na, qnb, nb, qnc);
orGate quebeck (e, ou, nc);

initial begin
	$display("FF03 - Guilherme Terra - 427407");
	$display("Test FF (Down) Decade counter");

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

endmodule // test_FF03 
