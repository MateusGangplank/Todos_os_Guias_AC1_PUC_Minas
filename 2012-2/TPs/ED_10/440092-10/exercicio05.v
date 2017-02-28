// ----------------------------------------------
// -- Ailton Gomes	
// -- 440092
// ----------------------------------------------

`include "JK.v"


// ----------------------------------------------
// -- RAM 1 endreco para 4 bits
// ----------------------------------------------
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

// ----------------------------------------------
// -- DMUX para 2 enderecos
// ----------------------------------------------
module DMUX1Bit(s0, s1, address, data);
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

// ----------------------------------------------
// -- DMUX para 8 enderecos
// ----------------------------------------------
module DMUX3Bit(s, address, data);
	output [7:0]s;
	input  [2:0]address;
	input  data;
	
	reg [7:0]s;
	
	initial begin
		s = 3'b000;	
	end
	
	always @(address or data or s)
	begin
		if(address == 3'b000)
			s = 8'b00000001;
		else if(address == 3'b001)
			s = 8'b00000010;
		else if(address == 3'b010)
			s = 8'b00000100;
		else if(address == 3'b011)	
			s = 8'b00001000;
		else if(address == 3'b100)
			s = 8'b00010000;
		else if(address == 3'b101)
			s = 8'b00100000;
		else if(address == 3'b110)
			s = 8'b01000000;
		else if(address == 3'b111)
			s = 8'b10000000;
	end
	
endmodule

// ----------------------------------------------
// -- MUX para selecinar dois inputs de 4 Bits
// ----------------------------------------------
module MUX4Bits(s, data0, data1, address);
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

// ----------------------------------------------
// -- MUX para selecinar 8 inputs de 8 Bits
// ----------------------------------------------
module MUX8Bits3op(s, data0, data1, data2, data3, 
					 data4, data5, data6, data7, addr);
	output [7:0]s;
	input  [7:0]data0;
	input  [7:0]data1;
	input  [7:0]data2;
	input  [7:0]data3;
	input  [7:0]data4;
	input  [7:0]data5;
	input  [7:0]data6;
	input  [7:0]data7;	
	input  [2:0]addr;
	
	reg [7:0]s;
	
	always @(addr or data1 or data0)
	begin
		if(addr == 3'b000)
			s = data0;
		else if(addr == 3'b001)
			s = data1;
		else if(addr == 3'b010)
			s = data2;
		else if(addr == 3'b011)
			s = data3;
		else if(addr == 3'b100)
			s = data4;
		else if(addr == 3'b101)
			s = data5;
		else if(addr == 3'b110)
			s = data6;
		else if(addr == 3'b111)
			s = data7;
	end
endmodule

// ----------------------------------------------
// -- RAM com 2 enderecos para 4 bits
// ----------------------------------------------
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
	
	DMUX1Bit SA(add0, add1, address, 1);
	
	RAM1X4 R1(r1, data, add0, rw, clk, clr);
	RAM1X4 R2(r2, data, add1, rw, clk, clr);
	
	MUX4Bits SB(o, r1, r2, address);
endmodule	

// ----------------------------------------------
// -- RAM com 1 endereco para 8 bits
// ----------------------------------------------
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


// ----------------------------------------------
// -- MUX para selecionar 2 inputs de 8 bits
// ----------------------------------------------
module MUX8Bits(s, data0, data1, address);
	output [7:0]s;
	input  [7:0]data0;
	input  [7:0]data1;
	input  address;
	
	reg [7:0]s;
	
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

// ----------------------------------------------
// -- RAM com 2 enderecos para 8 Bits usando RAM1X8
// ----------------------------------------------
module RAM2X8alternativo(o, data, address, rw, clk, clr);
	output [7:0]o;
	input  [7:0]data;
	input  address;
	input  rw;
	input  clk;
	input  clr;
	
	wire add0;
	wire add1;
	wire [7:0]r1;	
	wire [7:0]r2;	
	
	DMUX1Bit SA(add0, add1, address, 1);
	
	RAM1X8 R1(r1, data, add0, rw, clk, clr);
	RAM1X8 R2(r2, data, add1, rw, clk, clr);
	
	MUX8Bits SB(o, r1, r2, address);
endmodule

// ----------------------------------------------
// -- RAM para 2 enderecos de 8 bits usando RAM2X4
// ----------------------------------------------
module RAM2X8(o, data, address, rw, clk, clr);
	output [7:0]o;
	input  [7:0]data;
	input  address;
	input  rw;
	input  clk;
	input  clr;
	
	wire add0;
	wire add1;
	wire [7:0]r1;	
	wire [7:0]r2;	
	
	DMUX1Bit SA(add0, add1, address, 1);
	
	RAM2X4 R1(r1[3:0], data[3:0], add0, rw, clk, clr);
	RAM2X4 R2(r1[7:4], data[7:4], add0, rw, clk, clr);
	RAM2X4 R3(r2[3:0], data[3:0], add1, rw, clk, clr);
	RAM2X4 R4(r2[7:4], data[7:4], add1, rw, clk, clr);
	
	MUX8Bits SB(o, r1, r2, address);
endmodule

// ----------------------------------------------
// -- RAM para 8 enderecos de 8 bits usando RAM1X8
// ----------------------------------------------
module RAM8X8(o, data, address, rw, clk, clr);
	output [7:0]o;
	input  [7:0]data;
	input  [2:0]address;
	input  rw;
	input  clk;
	input  clr;
	
	wire [7:0]add;
	wire [7:0]r1,r2,r3,r4,r5,r6,r7,r8;
	
	DMUX3Bit SA(add, address, 1);
	
	RAM1X8 R1(r1, data, add[0], rw, clk, clr);
	RAM1X8 R2(r2, data, add[1], rw, clk, clr);
	RAM1X8 R3(r3, data, add[2], rw, clk, clr);
	RAM1X8 R4(r4, data, add[3], rw, clk, clr);
	RAM1X8 R5(r5, data, add[4], rw, clk, clr);
	RAM1X8 R6(r6, data, add[5], rw, clk, clr);
	RAM1X8 R7(r7, data, add[6], rw, clk, clr);
	RAM1X8 R8(r8, data, add[7], rw, clk, clr);
	
	MUX8Bits3op SB(o,r1,r2,r3,r4,r5,r6,r7,r8,address);
	
	
endmodule

// ---------------------------------------------
// -- PRINCIPAL
// ---------------------------------------------
module principal;
	reg [2:0]addr; 
	reg rw, clr;
	reg [7:0]data; 
	wire clk;
	wire [7:0]o;
	
	clock ck(clk);
	
	RAM8X8 T1(o, data, addr, rw, clk, clr);
	
	initial begin
		addr = 0;
		rw   = 0;
		clr  = 0;
		data = 8'b00000000;
		$display("input\t\taddress\trw\tclk\tsaida");
		$monitor("%4b\t%b\t%b\t%b\t%4b",data,addr,rw,clk,o);
		#1 clr = 1;
		#1 clr = 0;
		#1 addr = 0; rw = 1; data = 8'b10101010;
		#1 addr = 0; rw = 1;
		$display("------------------------------------");
		#1 addr = 0; rw = 1; // -- clock escreve no endereco 0
		// -- subiu clk = 1
		#1 addr = 0; rw = 0;
		#1 addr = 1;  data = 8'b11111111;
		#1 addr = 1; rw = 1; // -- clock escreve no endereco 1
		#1 addr = 1; rw = 0;
		#1 addr = 1; rw = 0;
		$display("------------------------------------");
		#1 addr = 1; rw = 0;
		// -- desce o clock
		#4
		#1 rw = 1;
		// -- sobe o clock
		#1 addr = 3'b010; rw = 1; data = 8'b00000010;
		#1 addr = 0; rw = 1;
		$display("------------------------------------");
		#1 addr = 0; rw = 1; // -- clock escreve no endereco 0
		// -- subiu clk = 1
		#1 addr = 0; rw = 0;
		#1 addr = 1;  data = 8'b11111111;
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