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

module seletor1in2out(s0, s1, address, data);
	output s0;
	output s1;
	input  address;
	input  data;
	
	reg s0;
	reg s1;
	
	initial begin
	 s0 = 0;
	 s1 = 0;
	end
	
	always @(address or data or s1 or s0)
	begin
		if(~address)
		begin
			s0 = data;
			s1 = 0;
		end
		else
		begin
			s1 = data;
			s0 = 0;
		end
	end
	
endmodule

module seletor2in1out(s, data0, data1, address);
	output [3:0]s;
	input  [3:0]data0;
	input  [3:0]data1;
	input  address;
	
	reg [3:0]s;
	
	always @(address or data1 or data0)
	begin
		if(~address)
		begin
			s = data0;
		end
		else
		begin
			s = data1;
		end
	end
endmodule	

module RAM2X4(o, data, address, rw, clk, clr);
	output [3:0]o;
	input  [3:0]data;
	input  address;
	input  rw;
	input  clk;
	input  clr;
	
	wire add0;
	wire add1;
	wire [3:0]r1;	
	wire [3:0]r2;	
	
	seletor1in2out SA(add0, add1, address, 1);
	
	RAM1X4 R1(r1, data, add0, rw, clk, clr);
	RAM1X4 R2(r2, data, add1, rw, clk, clr);
	
	seletor2in1out SB(o, r1, r2, address);
endmodule



// ---------------------------------------------
// -- PRINCIPAL
// ---------------------------------------------
module principal;
	reg addr, rw, clr;
	reg [3:0]data; 
	wire clk;
	wire [3:0]o;
	
	clock ck(clk);
	
	RAM2X4 T1(o, data, addr, rw, clk, clr);
	
	initial begin
		addr = 0;
		rw   = 0;
		clr  = 0;
		data = 4'b0000;
		$display("input\taddress\trw\tclk\tsaida");
		$monitor("%4b\t%b\t%b\t%b\t%4b",data,addr,rw,clk,o);
		#1 clr = 1;
		#1 clr = 0;
		#1 addr = 0; rw = 1; data = 4'b1100;
		#1 addr = 0; rw = 1;
		$display("------------------------------------");
		#1 addr = 0; rw = 1; // -- clock escreve no endereco 0
		// -- subiu clk = 1
		#1 addr = 0; rw = 0;
		#1 addr = 1;  data = 4'b1010;
		#1 addr = 1; rw = 1; // -- clock escreve no endereco 1
		#1 addr = 1; rw = 0;
		#1 addr = 1; rw = 0;
		$display("------------------------------------");
		#1 addr = 1; rw = 0;
		// -- desceu clk = 0
		#1 addr = 0; rw = 0;
		#1 addr = 0; rw = 0;
		#1 addr = 0; rw = 0;
		#1 addr = 0; rw = 0;
		$display("------------------------------------");
		#1 addr = 0; rw = 0; 
		// -- subiu clk = 1
		#1 addr = 1; rw = 0;
		#1 addr = 1; rw = 0;
		#1 addr = 1; rw = 0;	
		#1 addr = 1; rw = 0;
		$display("------------------------------------");
		#1 addr = 1; rw = 0;
		// -- desceu clk = 0
		#1 addr = 0; rw = 0;
		#1 addr = 0; rw = 0;
		#1 addr = 0; rw = 0;
		#1 addr = 0; rw = 0;
		$display("------------------------------------");
		#1 addr = 0; rw = 0;				
		// -- subiu clk = 1
		#1 addr = 1; rw = 0;
		#1 addr = 1; rw = 0;
		#1 addr = 1; rw = 0;
		#1 addr = 1; rw = 0;
		$display("------------------------------------");
		#1 addr = 1; rw = 0;
		// -- desceu clk = 0
		#1 addr = 0; rw = 0;
		#1 addr = 0; rw = 0;
		#1 addr = 0; rw = 0;
		#1 addr = 0; rw = 0;
		$display("------------------------------------");
		#1 addr = 0; rw = 0;
		
		$finish;
	end
	
endmodule