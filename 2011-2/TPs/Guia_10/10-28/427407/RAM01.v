// -------------------------
// RAM01
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

module andGate (output s,
                input x, input y, input z);
assign s = x & y & z;
endmodule // andGate

module test_RAM01;

reg addr, rw, clk;
reg in1, in2, in3, in4;
wire s0, s1, s2, s3, s4, p;

andGate fox   (s0, addr, rw, clk);

jkff favorita (s1,p,in1,in1,s0);
jkff bilara   (s2,p,in2,in2,s0);
jkff domada   (s3,p,in3,in3,s0);
jkff gaia     (s4,p,in4,in4,s0);

initial begin
	$display("RAM01 - Guilherme Terra - 427407");
	$display("Test memoria RAM 1x4");

	addr = 0; rw = 0; clk = 0; in1 = 0; in2 = 0; in3 = 0; in4 = 0;
#1	$display("\n%b %b %b %b",s1,s2,s3,s4);
	addr = 1; rw = 1; clk = 0; in1 = 1; in2 = 0; in3 = 1; in4 = 0;
#1	$display("\n%b %b %b %b",s1,s2,s3,s4);
	addr = 1; rw = 1; clk = 1; in1 = 1; in2 = 0; in3 = 1; in4 = 0;
#1	$display("\n%b %b %b %b",s1,s2,s3,s4);

end

endmodule // test_RAM01 
