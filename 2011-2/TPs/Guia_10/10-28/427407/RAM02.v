// -------------------------
// RAM02
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

module ram1x4 (output s1, output s2, output s3, output s4,
              input in1, input in2, input in3, input in4,
				  input addr, input rw, input clk);
andGate fox   (s0, addr, rw, clk);
jkff favorita (s1,p,in1,in1,s0);
jkff bilara   (s2,p,in2,in2,s0);
jkff domada   (s3,p,in3,in3,s0);
jkff gaia     (s4,p,in4,in4,s0);
endmodule // ram1x4

module test_RAM02;

reg addr, rw, clk;
reg a,b,c,d,e,f,g,h;
wire s1,s2,s3,s4,s5,s6,s7,s8;

ram1x4 domada (s1,s2,s3,s4,a,b,c,d,addr,rw,clk);
ram1x4 bilara (s5,s6,s7,s8,e,f,g,h,addr,rw,clk);



initial begin
	$display("RAM02 - Guilherme Terra - 427407");
	$display("Test memoria RAM 1x4");

	addr = 0; rw = 0; clk = 0; a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0;
#1	$display("\n%b %b %b %b %b %b %b %b",s1,s2,s3,s4,s5,s6,s7,s8);
	addr = 1; rw = 1; clk = 1; a = 1; b = 0; c = 1; d = 0; e = 1; f = 0; g = 1; h = 1;
#1	$display("\n%b %b %b %b %b %b %b %b",s1,s2,s3,s4,s5,s6,s7,s8);

end

endmodule // test_RAM02 
