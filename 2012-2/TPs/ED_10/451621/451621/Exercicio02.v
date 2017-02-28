//Nome: Vitor Angelo Lima
//Matricula: 451621

`include "jkff.v"
module result ( output [3:0] s, input [3:0] a, input [3:0] b, input c );
	wire [3:0] a1, b1;
	wire n;
	
	not ( n, c );
	and ( a1[0], a[0], n );
	and ( a1[1], a[1], n );
	and ( a1[2], a[2], n );
	and ( a1[3], a[3], n );
	
	and ( b1[0], b[0], c );
	and ( b1[1], b[1], c );
	and ( b1[2], b[2], c );
	and ( b1[3], b[3], c );
	
	or ( s[0], a1[0], b1[0] );
	or ( s[1], a1[1], b1[1] );
	or ( s[2], a1[2], b1[2] );
	or ( s[3], a1[3], b1[3] );	
endmodule

module teste;
	wire clk;
	wire [3:0] s0, s1, s;
	wire [3:0] n;
	reg  [3:0] j;
	reg addr, rw;
	reg pulse;

	initial begin
		j = 4'b1111;
		addr = 0; rw = 0;
		pulse = 1;
	end

	jkff JKFF03 ( s0[3], n[3], j[3], ~j[3], pulse & ~addr & ~rw );
	jkff JKFF02 ( s0[2], n[2], j[2], ~j[2], pulse & ~addr & ~rw );
	jkff JKFF01 ( s0[1], n[1], j[1], ~j[1], pulse & ~addr & ~rw );
	jkff JKFF00 ( s0[0], n[0], j[0], ~j[0], pulse & ~addr & ~rw );
	
	jkff JKFF13 ( s1[3], n[3], j[3], ~j[3], pulse & addr & ~rw );
	jkff JKFF12 ( s1[2], n[2], j[2], ~j[2], pulse & addr & ~rw );
	jkff JKFF11 ( s1[1], n[1], j[1], ~j[1], pulse & addr & ~rw );
	jkff JKFF10 ( s1[0], n[0], j[0], ~j[0], pulse & addr & ~rw );
	
	result rs ( s, s0, s1, addr );
	
	initial begin
		$monitor ( "%d %4b", $time, s );
		#1 pulse = 0; j= 4'b0000;
		#1 pulse = 1;
		#1 pulse = 0; j= 4'b0101;
		#1 pulse = 1;
		#1 pulse = 0; j= 4'b1010;
		#1 pulse = 1;
		#1 pulse = 0; j= 4'b1001;
		#1 pulse = 1; addr = 1;
		#1 pulse = 0; j= 4'b0000;
		#1 pulse = 1;
		#1 pulse = 0; j= 4'b0101;
		#1 pulse = 1;
		#1 pulse = 0; j= 4'b1010;
		#1 pulse = 1;
		#1 pulse = 0; j= 4'b1001;
		#1 pulse = 1;
end

endmodule
