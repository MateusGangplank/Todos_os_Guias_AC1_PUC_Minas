// -------------------------
// FF02
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

module test_FF02;

reg pulse;
reg o;
wire a;
wire b;
wire c;
wire d;
wire qb;
wire qc;
wire qd;

jkff luma    (qd, d, o, o, pulse);
jkff bonanza (qc, c, o, o, qd);
jkff bilara  (qb, b, o, o, qc);
jkff domada  (x , a, o, o, qb);

initial begin
	$display("FF02 - Guilherme Terra - 427407");
	$display("Test FF (Up) asynchronous counter");

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

endmodule // test_FF02 
