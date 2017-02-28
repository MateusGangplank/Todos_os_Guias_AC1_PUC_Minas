// Nome: Gabriel Luiz M. G. Vieira 
// Matricula: 441691 
// ------------------------- 
// ------------------------- 

`include "clock.v"

module FFJK(output q, output qnot, input j, input k,input clk, input clr);
reg q, qnot; 
always @( posedge clk ) 
begin
 if(clr)
  begin
  q <= 0; qnot <= 1;
  end
else 
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
endmodule

module RAM1x1(output out, input addr, input rw, input clk, input in, input clr);
wire k,c,q,qnot,out;

and AND1(c,addr,rw,clk);
not NOT1(k,in);
FFJK JK1(q,qnot,in,k,c,clr);
and AND2(out,addr,q);
endmodule

module RAM1x4(output [3:0] out, input addr, input rw, input clk, input [3:0] in, input clr);

RAM1x1 R1x1 (out[0],addr,rw,clk,in[0],clr);
RAM1x1 R1x2 (out[1],addr,rw,clk,in[1],clr);
RAM1x1 R1x3 (out[2],addr,rw,clk,in[2],clr);
RAM1x1 R1x4 (out[3],addr,rw,clk,in[3],clr);

endmodule


module mux(output [3:0] s, input [3:0] a, input [3:0] b, input addr, input clk);
reg [3:0] s;

always @ (posedge clk)
begin
if(addr)
begin
s = b;
end
else
begin
s = a;
end
end

endmodule


module dmux(output s0, output s1, input addr,input clk);
reg s0,s1;

always @ (posedge clk)
begin
if(addr)
begin
s0 = 0; s1 = 1;
end
else
begin
s0 = 1; s1 = 0;
end
end

endmodule

module RAM2x4(output [3:0] out, input addr, input rw, input clk, input [3:0] in, input clr);
wire [3:0]a,b;
wire dmx0,dmx1;

dmux DMX1(dmx0,dmx1,addr,clk);
RAM1x4 R4x1(a,dmx0,rw,clk,in,clr); 
RAM1x4 R4x2(b,dmx1,rw,clk,in,clr);
mux MUX1(out,a,b,addr,clk);

endmodule

module RAM1x8(output [7:0] out, input addr, input rw, input clk, input [7:0] in, input clr);

RAM1x4 R4x1 (out[7:4],addr,rw,clk,in[7:4],clr);
RAM1x4 R4x2 (out[3:0],addr,rw,clk,in[3:0],clr);

endmodule

module mux8(output [7:0] s, input [7:0] a, input [7:0] b, input addr, input clk);
reg [7:0] s;

always @ (posedge clk)
begin
if(addr)
begin
s = b;
end
else
begin
s = a;
end
end

endmodule


module RAM2x8(output [7:0] out, input addr, input rw, input clk, input [7:0] in, input clr);
wire [7:0] a,b;
wire dmx0,dmx1;

dmux DMX1(dmx0,dmx1,addr,clk);
RAM2x4 R24x1 (a[7:4],dmx0,rw,clk,in[7:4],clr);
RAM2x4 R24x2 (b[7:4],dmx0,rw,clk,in[7:4],clr);
RAM2x4 R24x3 (a[3:0],dmx1,rw,clk,in[3:0],clr);
RAM2x4 R24x4 (b[3:0],dmx1,rw,clk,in[3:0],clr);
mux8 MUX1(out,a,b,addr,clk);

endmodule


module mux8x8(output [7:0] s, input [7:0] i0, input [7:0] i1,input [7:0] i2, input [7:0] i3,
					input [7:0] i4, input [7:0] i5,input [7:0] i6, input [7:0] i7, input [2:0] addr, input clk);
reg [7:0] s;

always @ (posedge clk)
begin
	if(addr[0])
		begin
			s = i1;
		end
	else
		begin
			if(addr[1])
				begin
					s = i2;
				end
			else
				begin
					if(addr[1] && addr[0])
						begin
							s = i3;
						end
					else
						begin
							if(addr[2])
								begin
									s = i4;
								end
							else
								begin
									if(addr[2] && addr[0])
										begin
											s = i5;
										end
									else
										begin
											if(addr[2] && addr[1])
												begin
													s = i6;
												end
											else
												begin
													if(addr[2] && addr[1] && addr[0])
														begin
															s = i7;
														end
													else
														begin
															s = i0;
														end
												end
										end
								end
						end
				end
		end
end
endmodule


module dmux8x8(output s0, output s1, output s2, output s3, output s4, output s5,
					output s6, output s7, input [2:0] addr,input clk);
reg s0,s1,s2,s3,s4,s5,s6,s7;

always @ (posedge clk)
begin
	if(addr[0])
		begin
			s0 = 0; s1 = 1; s2 = 0; s3 = 0; s4 = 0; s5 = 0; s6 = 0; s7 = 0; 
		end
	else
		begin
			if(addr[1])
				begin
					s0 = 0; s1 = 0; s2 = 1; s3 = 0; s4 = 0; s5 = 0; s6 = 0; s7 = 0;
				end
			else
				begin
					if(addr[1] && addr[0])
						begin
							s0 = 0; s1 = 0; s2 = 0; s3 = 1; s4 = 0; s5 = 0; s6 = 0; s7 = 0; 
						end
					else
						begin
							if(addr[2])
								begin
									s0 = 0; s1 = 0; s2 = 0; s3 = 0; s4 = 1; s5 = 0; s6 = 0; s7 = 0;
								end
							else
								begin
									if(addr[2] && addr[0])
										begin
											s0 = 0; s1 = 0; s2 = 0; s3 = 0; s4 = 0; s5 = 1; s6 = 0; s7 = 0;
										end
									else
										begin
											if(addr[2] && addr[1])
												begin
													s0 = 0; s1 = 0; s2 = 0; s3 = 0; s4 = 0; s5 = 0; s6 = 1; s7 = 0;
												end
											else
												begin
													if(addr[2] && addr[1] && addr[0])
														begin
															s0 = 0; s1 = 0; s2 = 0; s3 = 0; s4 = 0; s5 = 0; s6 = 0; s7 = 1;
														end
													else
														begin
															s0 = 1; s1 = 0; s2 = 0; s3 = 0; s4 = 0; s5 = 0; s6 = 0; s7 = 0;
														end
												end
										end
								end
						end
				end
		end
end

endmodule

module RAM8x8(output [7:0] out, input [2:0] addr, input rw, input clk,input [7:0] in, input clr);
wire dmx0,dmx1,dmx2,dmx3,dmx4,dmx5,dmx6,dmx7;
wire [7:0] s0,s1,s2,s3,s4,s5,s6,s7;

dmux8x8 DMX1(dmx0,dmx1,dmx2,dmx3,dmx4,dmx5,dmx6,dmx7,addr,clk);
RAM1x8 R8x1(s0,dmx0,rw,clk,in,clr);
RAM1x8 R8x2(s1,dmx1,rw,clk,in,clr);
RAM1x8 R8x3(s2,dmx2,rw,clk,in,clr);
RAM1x8 R8x4(s3,dmx3,rw,clk,in,clr);
RAM1x8 R8x5(s4,dmx4,rw,clk,in,clr);
RAM1x8 R8x6(s5,dmx5,rw,clk,in,clr);
RAM1x8 R8x7(s6,dmx6,rw,clk,in,clr);
RAM1x8 R8x8(s7,dmx7,rw,clk,in,clr);
mux8x8 MUX1(out,s0,s1,s2,s3,s4,s5,s6,s7,addr,clk);

endmodule

module RAM1x16(output [15:0] out, input addr, input rw, input clk, input [15:0] in, input clr);

RAM1x8 R8x1(out[15:8],addr,rw,clk,in[15:8],clr);
RAM1x8 R8x2(out[7:0],addr,rw,clk,in[7:0],clr);

endmodule

module mux4x8(output [7:0] s, input [7:0] a, input [7:0] b, input [7:0] c,
		 input [7:0] d, input [1:0] addr, input clk);
reg [7:0] s;
always @ (posedge clk) begin
	if(addr[0])	
		begin
			s=b;
		end
	else
		begin
			if(addr[1])
				begin
					s=c;
				end
			else
				begin
					if(addr[1] && addr[0])
						begin
							s=d;
						end
					else
						begin
							s=a;
						end
				end
		end
end

endmodule

module dmux4x8(output d0, output d1, output d2, output d3, input [1:0] addr, input clk);
reg d0,d1,d2,d3;

always @ (posedge clk) begin
	if(addr[0])	
		begin
			d0 = 0; d1 = 1; d2 = 0; d3 = 0;
		end
	else
		begin
			if(addr[1])
				begin
					d0 = 0; d1 = 0; d2 = 1; d3 = 0;
				end
			else
				begin
					if(addr[1] && addr[0])
						begin
							d0 = 0; d1 = 0; d2 = 0; d3 = 1;
						end
					else
						begin
							d0 = 1; d1 = 0; d2 = 0; d3 = 0;
						end
				end
		end
end

endmodule

module RAM4x8(output [7:0] out, input [1:0] addr, input rw, input clk, input [7:0] in, input clr);
wire dmx0,dmx1,dmx2,dmx3;
wire [7:0] s0,s1,s2,s3;

dmux4x8 DMX1(dmx0,dmx1,dmx2,dmx3,addr,clk);
RAM1x8 R8x1(s0,dmx0,rw,clk,in,clr);
RAM1x8 R8x2(s1,dmx1,rw,clk,in,clr);
RAM1x8 R8x3(s2,dmx2,rw,clk,in,clr);
RAM1x8 R8x4(s3,dmx3,rw,clk,in,clr);
mux4x8 MUX1(out,s0,s1,s2,s3,addr,clk);

endmodule


module test_4x8;
reg r,clr;
reg [1:0] a;
reg [7:0] i;
wire clock;
wire [7:0] o;

clock clk(clock);

RAM4x8 test(o,a,r,clock,i,clr);
initial begin
#12 clr=1;
#6 clr=0;
a=2'b00; r=1; i=8'b00000000;
$display("Guia 10 - Exercicio 07 - RAM 4x8 - Gabriel Luiz M. G. Vieira ~ 441691");
$display("ADDR  RW CLK      IN       OUT");
$monitor(" %b    %b   %b    %b   %b",a,r,clock,i,o);
#6 a=2'b00; r=1; i=8'b00001001;
#6
#6 a=2'b01; r=1; i=8'b11001010;
#6
#6 a=2'b10; r=1; i=8'b10000101;
#6
#6 a=2'b11; r=1; i=8'b10000001;
#6
#6 r=0;
#6 a=2'b00;
#6 a=2'b01; 
#6 a=2'b10; 
#6 a=2'b11;
#6 $finish;
end
endmodule