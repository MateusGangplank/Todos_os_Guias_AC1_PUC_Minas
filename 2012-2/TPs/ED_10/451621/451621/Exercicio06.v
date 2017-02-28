//Nome: Vitor Angelo Lima
//Matricula: 451621

`include "jkff.v"

module teste;
	wire clk;
	wire [7:0] s0, s1, s;
	wire [3:0] n;
	reg  [15:0] j;
	reg addr, rw;
	reg pulse;

	initial begin
		j = 16'b1111111111111111; addr = 0; rw = 0; pulse = 1;
	end

	jkff JKFF07 ( s0[7], n[3], j[7], ~j[7], pulse & ~addr & ~rw );
	jkff JKFF06 ( s0[6], n[2], j[6], ~j[6], pulse & ~addr & ~rw );
	jkff JKFF05 ( s0[5], n[1], j[5], ~j[5], pulse & ~addr & ~rw );
	jkff JKFF04 ( s0[4], n[0], j[4], ~j[4], pulse & ~addr & ~rw );
	jkff JKFF03 ( s0[3], n[3], j[3], ~j[3], pulse & ~addr & ~rw );
	jkff JKFF02 ( s0[2], n[2], j[2], ~j[2], pulse & ~addr & ~rw );
	jkff JKFF01 ( s0[1], n[1], j[1], ~j[1], pulse & ~addr & ~rw );
	jkff JKFF00 ( s0[0], n[0], j[0], ~j[0], pulse & ~addr & ~rw );
	
	jkff JKFF18 ( s1[7], n[3], j[15], ~j[15], pulse & ~addr & ~rw );
	jkff JKFF17 ( s1[6], n[2], j[14], ~j[14], pulse & ~addr & ~rw );
	jkff JKFF16 ( s1[5], n[1], j[13], ~j[13], pulse & ~addr & ~rw );
	jkff JKFF15 ( s1[4], n[0], j[12], ~j[12], pulse & ~addr & ~rw );
	jkff JKFF13 ( s1[3], n[3], j[11], ~j[11], pulse & ~addr & ~rw );
	jkff JKFF12 ( s1[2], n[2], j[10], ~j[10], pulse & ~addr & ~rw );
	jkff JKFF11 ( s1[1], n[1], j[9], ~j[9], pulse & ~addr & ~rw );
	jkff JKFF10 ( s1[0], n[0], j[8], ~j[8], pulse & ~addr & ~rw );
	
	//result rs ( s, s0, s1, addr );
	
	initial begin
		$monitor ( "%d %8b_%8b", $time, s1, s0 );
		#1 pulse = 0; j= 16'b0000_0000_0101_1001;
		#1 pulse = 1;
		#1 pulse = 0; j= 16'b0101_1001_1001_1010;
		#1 pulse = 1;
		#1 pulse = 0; j= 16'b1001_1010_0011_1000;
		#1 pulse = 1;
		#1 pulse = 0; j= 16'b0011_1000_1111_1111;
		#1 pulse = 1;
		#1 pulse = 0; j= 16'b1111_1111_0010_0100;
		#1 pulse = 1;
		#1 pulse = 0; j= 16'b0010_0100_1010_1010;
		#1 pulse = 1;
		#1 pulse = 0; j= 16'b1010_1010_1001_0001;
		#1 pulse = 1;
		#1 pulse = 0; j= 16'b1001_0001_0000_0000;
		#1 pulse = 1;
end

endmodule
