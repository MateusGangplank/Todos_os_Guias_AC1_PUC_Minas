//Nome: Vitor Angelo Lima
//Matricula: 451621

`include "jkff.v"

module teste;
	wire clk;
	wire [3:0] s;
	wire [3:0] n;
	reg  [3:0] j;
	reg addr, rw;
	reg pulse;

	initial begin
		j = 4'b1111;
		addr = 0; rw = 0;
		pulse = 1;
	end

	jkff JKFF03 ( s[3], n[3], j[3], ~j[3], pulse & ~addr & ~rw );
	jkff JKFF02 ( s[2], n[2], j[2], ~j[2], pulse & ~addr & ~rw );
	jkff JKFF01 ( s[1], n[1], j[1], ~j[1], pulse & ~addr & ~rw );
	jkff JKFF00 ( s[0], n[0], j[0], ~j[0], pulse & ~addr & ~rw );

	initial begin
	$monitor ( "%4b", s );
		#1 pulse = 0; j= 4'b0000;
		#1 pulse = 1;
		#1 pulse = 0; j= 4'b0101;
		#1 pulse = 1;
		#1 pulse = 0; j= 4'b1010;
		#1 pulse = 1;
		#1 pulse = 0; j= 4'b1001;
		#1 pulse = 1;
		#1 pulse = 0; j= 4'b0000; rw = 1;
		#1 pulse = 1;
		#1 pulse = 0; j= 4'b0101;
		#1 pulse = 1;
		#1 pulse = 0; j= 4'b1010;
		#1 pulse = 1;
		#1 pulse = 0; j= 4'b1001;
		#1 pulse = 1;
end

endmodule
