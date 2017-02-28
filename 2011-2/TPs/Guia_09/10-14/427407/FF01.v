// -------------------------
// FF01
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

module test_FF01;

reg pulse;
reg o;
wire a;
wire b;
wire c;
wire d;

jkff luma    (x, d, o, o, pulse);
jkff bonanza (x, c, o, o, d);
jkff bilara  (x, b, o, o, c);
jkff domada  (x, a, o, o, b);

initial begin
	$display("FF01 - Guilherme Terra - 427407");
	$display("Test FF (Down) asynchronous counter");

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

endmodule // test_FF01 
