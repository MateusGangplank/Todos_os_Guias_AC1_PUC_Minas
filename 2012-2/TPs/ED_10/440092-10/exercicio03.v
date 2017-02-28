// ----------------------------------------------
// -- Ailton Gomes	
// -- 440092
// ----------------------------------------------
`include "JK.v"

module RAM1X4(o, data, address, rw, clk, clr);
	output [3:0]o;
	input  [3:0]data;
	input  address;
	input  rw;
	input  clk;
	input  clr;
	
	wire [3:0]q;
	wire [3:0]qnot;
	wire [3:0]n;
	wire w;
	
	not N0(n[0], data[3]);
	not N1(n[1], data[2]);
	not N2(n[2], data[1]);
	not N3(n[3], data[0]);
	
	and  E(w, address, rw, clk);
	
	jkff A(q[3], qnot[3], data[3], n[0], w, 0, clr);
	jkff B(q[2], qnot[2], data[2], n[1], w, 0, clr);
	jkff C(q[1], qnot[1], data[1], n[2], w, 0, clr);
	jkff D(q[0], qnot[0], data[0], n[3], w, 0, clr);

	and o0(o[0], q[0], address);
	and o1(o[1], q[1], address);
	and o2(o[2], q[2], address);
	and o3(o[3], q[3], address);
	
endmodule	

module RAM1X8(o, data, address, rw, clk, clr);
	output [7:0]o;
	input  [7:0]data;
	input  address;
	input  rw;
	input  clk;
	input  clr;	
	
	RAM1X4 R1(o[3:0], data[3:0], address, rw, clk, clr);
	RAM1X4 R2(o[7:4], data[7:4], address, rw, clk, clr);
	
endmodule



// ---------------------------------------------
// -- PRINCIPAL
// ---------------------------------------------
module principal;
	reg addr, rw, clr;
	reg [7:0]data; 
	wire clk;
	wire [7:0]o;
	
	clock ck(clk);
	
	RAM1X8 T1(o, data, addr, rw, clk, clr);
	
	initial begin
		addr = 0;
		rw   = 0;
		clr  = 0;
		data = 8'b00000000;
		$display("input\taddress\trw\tclk\tsaida");
		$monitor("%4b\t%b\t%b\t%b\t%4b",data,addr,rw,clk,o);
		#1 clr = 1;
		#1 clr = 0;
		#1 addr = 1; rw = 1; 
		#1 addr = 1; rw = 1; data = 8'b00001100;
		$display("------------------------------------");
		#1 addr = 1; rw = 1;
		// -- subiu clk = 1
		#1 addr = 1; rw = 1;
		#1 addr = 1; rw = 1; 
		#1 addr = 1; rw = 1;
		#1 addr = 1; rw = 1;
		#1 addr = 1; rw = 1; data = 8'b00001010;
		$display("------------------------------------");
		#1 addr = 1; rw = 1;
		// -- desceu clk = 0
		#1 addr = 1; rw = 1;
		#1 addr = 1; rw = 1;
		#1 addr = 1; rw = 1;
		#1 addr = 1; rw = 1; data = 8'b10101010;
		$display("------------------------------------");
		#1 addr = 0; rw = 1; 
		// -- subiu clk = 1
		#1 addr = 1; rw = 1;
		#1 addr = 1; rw = 1;
		#1 addr = 1; rw = 1;	
		#1 addr = 1; rw = 1;
		$display("------------------------------------");
		#1 addr = 1; rw = 1;
		// -- desceu clk = 0
		#1 addr = 1; rw = 1;
		#1 addr = 1; rw = 1;
		#1 addr = 1; rw = 1;
		#1 addr = 1; rw = 1;
		$display("------------------------------------");
		#1 addr = 1; rw = 1;				
		// -- subiu clk = 1
		#1 addr = 1; rw = 1;
		#1 addr = 1; rw = 1;
		#1 addr = 1; rw = 1;
		#1 addr = 1; rw = 1;
		$display("------------------------------------");
		#1 addr = 1; rw = 1;
		// -- desceu clk = 0
		#1 addr = 0; rw = 1;
		#1 addr = 0; rw = 1;
		#1 addr = 0; rw = 1;
		#1 addr = 0; rw = 1;
		$display("------------------------------------");
		#1 addr = 0; rw = 1;
		
		$finish;
	end
	
endmodule