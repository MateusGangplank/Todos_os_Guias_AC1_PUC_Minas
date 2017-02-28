// ------------------------- 
// Guia10Exerc04
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453 
// ------------------------- 

module demux ( D, sel, y0, y1);
input D;
input sel;
output y0,y1;
wire y0,y1,N;
and g1(y0, D, N);
and g2(y1, D, sel);
not g0(N, sel);
endmodule


module mux (Y, A, B, sel);
output [3:0] Y;
input [3:0] A, B;
input sel;
reg [3:0] Y;
always @(A or B or sel)
if (sel == 1'b0)
Y = A;
else
Y = B;
endmodule

module mux2 (Y, A, B, sel);
output [7:0] Y;
input [7:0] A, B;
input sel;
reg [7:0] Y;
always @(A or B or sel)
if (sel == 1'b0)
Y = A;
else
Y = B;
endmodule

module dff ( output q, output qnot, 
input d, input clk, input clear ); 
reg q, qnot; 

always @( posedge clk ) 
begin 
	if ( ~clear ) 
		begin 
		q <= 0; qnot <= ~q; 
	end 
	q <= d; qnot <= ~q;
end 
endmodule // dff 

module ram1x1 ( output w, input addr, input rw,
input clk, input inpu, input clear );
wire s1,s2,s3,s4;

and and1 (s1, addr, rw);
and and2 (s2, s1, clk);

dff kai (s3, s4, inpu, clk, clear);

and and3 (w, addr, s3);

endmodule

module ram1x4 ( output [3:0] we, input addr, input rw,
input clk, input [3:0] inpu, input clear );

ram1x1 Rodrigo ( we[0], addr, rw, clk, inpu[0], clear);
ram1x1 Gustavo ( we[1], addr, rw, clk, inpu[1], clear);
ram1x1 Ana ( we[2], addr, rw, clk, inpu[2], clear);
ram1x1 Larissa ( we[3], addr, rw, clk, inpu[3], clear);

endmodule

module ram1x8 ( output [7:0] we, input addr, input rw,
input clk, input [7:0] inpu, input clear );

ram1x4 Renata (we[3:0], addr, rw, clk, inpu[3:0], clear);
ram1x4 Inacio (we[7:4], addr, rw, clk, inpu[7:4], clear);


endmodule

module ram2x4 (output [3:0] we, input addr, input rw,
input clk, input [3:0] inpu, input clear);
wire dms0,dms1,s1,s2,s3,s4,s5;
wire [3:0] aw, bw;

demux dm1 (1'b1, addr, dms0, dms1);

ram1x4 Cater (aw, dms0, rw, clk, inpu, clear);
ram1x4 Raphael (bw, dms1, rw, clk, inpu, clear);

mux m1 (we, aw, bw, addr);

endmodule

module ram2x8 (output [7:0] we, input addr, input rw,
input clk, input [7:0] inpu, input clear);
wire dms0,dms1,s1,s2,s3,s4,s5;
wire [7:0] aw, bw;

demux dm1 (1'b1, addr, dms0, dms1);

ram1x8 Cater (aw, dms0, rw, clk, inpu, clear);
ram1x8 Raphael (bw, dms1, rw, clk, inpu, clear);

mux2 m1 (we, aw, bw, addr);

endmodule
 

module test; 
// ------------------------- definir dados 
wire [0:7] we; 
reg addr, rw, clk, clear;
reg [7:0] inpu;

ram2x8 ramiel (we,addr,rw,clk,inpu,clear);
// ------------------------- parte principal 
initial begin 
$display("Guia10Exerc04 - Pedro Henrique Vilar Locatelli - 427453"); 

   $monitor ( "%4d\t%1b\t%1b\t%1b\t%8b\t%1b\t%1b%1b%1b%1b%1b%1b%1b%1b", $time, addr, rw, clk, inpu, clear, we[0],we[1],we[2],we[3],we[4],we[5],we[6],we[7]); 
	#1 clear = 0;
	#1 clear = 1;
//	#1 clear = 0;
	#1 clk = 0;
	#1 inpu = 8'b10100101;
	#1 addr = 1;
	#1 rw = 1;
	#1 clk = 1;
	#1 clk = 0;
	#1 addr = 0;
	#1 inpu = 8'b11101110;
	#1 clk = 1;
	#1 clk = 0;
	#1 rw = 0;
	#1 addr = 1;
	#1 addr = 0;
	
	
	
	
end
endmodule