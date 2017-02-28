//Nome: Vitor Angelo Lima
//Matricula: 451621

`include "jkff.v"
module result ( output [7:0] s, input [3:0] a, input [3:0] b, input [3:0] c, input [3:0] d,  input z );
	wire [3:0] a1, b1, c1, d1;
	wire n;
	
	not ( n, z );
	and ( a1[0], a[0], n );
	and ( a1[1], a[1], n );
	and ( a1[2], a[2], n );
	and ( a1[3], a[3], n );
	and ( b1[0], b[0], n );
	and ( b1[1], b[1], n );
	and ( b1[2], b[2], n );
	and ( b1[3], b[3], n );
	
	and ( c1[0], c[0], z );
	and ( c1[1], c[1], z );
	and ( c1[2], c[2], z );
	and ( c1[3], c[3], z );
	and ( d1[0], d[0], z );
	and ( d1[1], d[1], z );
	and ( d1[2], d[2], z );
	and ( d1[3], d[3], z );
	
	or ( s[0], a1[0], c1[0] );
	or ( s[1], a1[1], c1[1] );
	or ( s[2], a1[2], c1[2] );
	or ( s[3], a1[3], c1[3] );
	or ( s[4], b1[0], d1[0] );
	or ( s[5], b1[1], d1[1] );
	or ( s[6], b1[2], d1[2] );
	or ( s[7], b1[3], d1[3] );
endmodule

module teste;
	wire clk;
	wire [3:0] s0, s1, s2, s3;
	wire [7:0] s;
	wire [3:0] n;
	reg  [7:0] j;
	reg addr, rw;
	reg pulse;

	initial begin
		j = 8'b11111111; addr = 0; rw = 0; pulse = 1;
	end

	jkff JKFF03 ( s0[3], n[3], j[3], ~j[3], pulse & ~addr & ~rw );
	jkff JKFF02 ( s0[2], n[2], j[2], ~j[2], pulse & ~addr & ~rw );
	jkff JKFF01 ( s0[1], n[1], j[1], ~j[1], pulse & ~addr & ~rw );
	jkff JKFF00 ( s0[0], n[0], j[0], ~j[0], pulse & ~addr & ~rw );
	
	jkff JKFF13 ( s1[3], n[3], j[7], ~j[7], pulse & ~addr & ~rw );
	jkff JKFF12 ( s1[2], n[2], j[6], ~j[6], pulse & ~addr & ~rw );
	jkff JKFF11 ( s1[1], n[1], j[5], ~j[5], pulse & ~addr & ~rw );
	jkff JKFF10 ( s1[0], n[0], j[4], ~j[4], pulse & ~addr & ~rw );
	
	jkff JKFF23 ( s2[3], n[3], j[3], ~j[3], pulse & addr & ~rw );
	jkff JKFF22 ( s2[2], n[2], j[2], ~j[2], pulse & addr & ~rw );
	jkff JKFF21 ( s2[1], n[1], j[1], ~j[1], pulse & addr & ~rw );
	jkff JKFF20 ( s2[0], n[0], j[0], ~j[0], pulse & addr & ~rw );
	
	jkff JKFF33 ( s3[3], n[3], j[7], ~j[7], pulse & addr & ~rw );
	jkff JKFF32 ( s3[2], n[2], j[6], ~j[6], pulse & addr & ~rw );
	jkff JKFF31 ( s3[1], n[1], j[5], ~j[5], pulse & addr & ~rw );
	jkff JKFF30 ( s3[0], n[0], j[4], ~j[4], pulse & addr & ~rw );	
	
	
	result rs ( s, s0, s1, s2, s3, addr );
	
	initial begin
		$monitor ( "%d %1b: %8b", $time, addr, s );
		#1 pulse = 0; j= 8'b0000_0000;
		#1 pulse = 1;
		#1 pulse = 0; j= 8'b0101_1001;
		#1 pulse = 1;
		#1 pulse = 0; j= 8'b1001_1010;
		#1 pulse = 1;
		#1 pulse = 0; j= 8'b0011_1000; 
		#1 pulse = 1; addr = 1;
		#1 pulse = 0; j= 8'b1111_1111;
		#1 pulse = 1;
		#1 pulse = 0; j= 8'b0010_0100;
		#1 pulse = 1;
		#1 pulse = 0; j= 8'b1010_1010;
		#1 pulse = 1; 
		#1 pulse = 0; j= 8'b1001_0001;
		#1 pulse = 1;
end

endmodule
