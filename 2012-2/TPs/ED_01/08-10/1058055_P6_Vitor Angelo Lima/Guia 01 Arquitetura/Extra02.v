//Extra 02
//Nome: Vitor Angelo Lima
//Matrícula: 451621

module um(output n, input [0:7]m);
	wire a,b,c,d, e, f;
	assign a = m[0] | m[1];
	assign b = m[2] | m[3];
	assign c = m[4] | m[5];
	assign d = m[6] | m[7];
	assign e = a | b;
	assign f = c | d;
	assign n = e | f;
endmodule

module main;
	reg [0:7]r;
	wire p;
	um u1(p, r);
	
	initial begin
		r = 8'b0001_0001;
		#1 $display( "%b = %b", r, p);
	end
endmodule
