// ----------------------------------------------
// -- Alexandre Palmieri Sad
// -- 440265
// ----------------------------------------------
`include "JK.v"

module RAM1X4(o, data, address, rw, clk, clr);
	output [3:0]o;
	input  [3:0]data;
	input  address;
	input  rw;
	input  clk;
	input  clr;
	
	wire [3:0]n;
	wire [3:0]q;
	wire [3:0]qnot;
	wire w;
	
	and  E(w, address, rw, clk);
	
	not  N0(n[0], data[3]);
	not  N1(n[1], data[2]);
	not  N2(n[2], data[1]);
	not  N3(n[3], data[0]);
	
	jkff A(q[0], qnot[0], data[3], n[0], w, 0, clr);
	jkff B(q[1], qnot[1], data[2], n[1], w, 0, clr);
	jkff C(q[2], qnot[2], data[1], n[2], w, 0, clr);
	jkff D(q[3], qnot[3], data[0], n[3], w, 0, clr);
	
	and o0(o[0], address, q[3]);
	and o1(o[1], address, q[2]);
	and o2(o[2], address, q[1]);
	and o3(o[3], address, q[0]);
endmodule

module principal;
	reg addr, rw, clr;
	reg [3:0]data; 
	wire clk;
	wire [3:0]o;
	
	clock ck(clk);
	
	RAM1X4 R1(o, data, addr, rw, clk, clr);
	
	// --ram1x4 r1(o, data, clk, rw, addr, clr);
	
	initial begin:start
		addr = 0;
		rw   = 0;
		clr  = 0;
		data = 4'b0000;
	end
	
	initial begin
		$display("input\taddress\trw\tclk\tsaida");
		$monitor("%4b\t%b\t%b\t%b\t%4b",data,addr,rw,clk, o);
		#1 clr = 1;
		#1 clr = 0;
		#1 addr = 1; rw = 1; data = 4'b1100;
		#1 addr = 1; rw = 1;
		#1 addr = 0; rw = 1;
		#1 addr = 1; rw = 1; 
		#1 addr = 1; rw = 1; data = 4'b0011;
		#1 addr = 0; rw = 1;
		#1 addr = 0; rw = 1;
		#1 addr = 1; rw = 1;
		#1 addr = 1; rw = 1; data = 4'b1010;
		#1 addr = 1; rw = 1;
		#1 addr = 1; rw = 1;
		$finish;
	end
	
endmodule