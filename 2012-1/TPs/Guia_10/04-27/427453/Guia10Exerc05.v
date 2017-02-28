// ------------------------- 
// Guia10Exerc05
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

module demux8 ( D, sel, y0, y1, y2, y3, y4, y5, y6, y7);
input D;
input [2:0] sel;
output y0,y1,y2,y3,y4,y5,y6,y7;

always @( sel or y0 or y1 or y2 or y3 or y4 or y5 or y6 or y7 ) 
begin 
	if ( D == 1'b1 )
		begin
		if ( sel == 3'b000 ) 
			begin 
			y0=1'b1; y1=0; y2=0; y3=0; y4=0; y5=0; y6=0; y7=0;
		end 
		else
		if ( sel == 3'b001 ) 
			begin 
			y0=0;y1=1;y2=0;y3=0;y4=0;y5=0;y6=0;y7=0;
		end 
		else
		if ( sel == 3'b010 ) 
			begin 
			y0=0;y1=0;y2=1;y3=0;y4=0;y5=0;y6=0;y7=0;
		end 
		else
		if ( sel == 3'b011 ) 
			begin 
			y0=0;y1=0;y2=0;y3=1;y4=0;y5=0;y6=0;y7=0;
		end 
		else
		if ( sel == 3'b100 ) 
			begin 
			y0=0;y1=0;y2=0;y3=0;y4=1;y5=0;y6=0;y7=0;
		end 
		else
		if ( sel == 3'b101 ) 
			begin 
			y0=0;y1=0;y2=0;y3=0;y4=0;y5=1;y6=0;y7=0;
		end 
		else
		if ( sel == 3'b110 ) 
			begin 
			y0=0;y1=0;y2=0;y3=0;y4=0;y5=0;y6=1;y7=0;
		end 
		else
		if ( sel == 3'b111 ) 
			begin 
			y0=0;y1=0;y2=0;y3=0;y4=0;y5=0;y6=0;y7=1;
		end 
	end
	else
			y0=0;y1=0;y2=0;y3=0;y4=0;y5=0;y6=0;y7=0;
end 
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

module mux8 (Y, A, B, C, D, E, F, G, H, sel);
output [7:0] Y;
input [7:0] A, B, C, D, E, F, G, H;
input [2:0] sel;
reg [7:0] Y;
always @(A or B or C or D or E or F or G or H or sel)
		if ( sel == 3'b000 ) 
			begin 
			Y=A;
		end 
		else
		if ( sel == 3'b001 ) 
			begin 
			Y=B;
		end 
		else
		if ( sel == 3'b010 ) 
			begin 
			Y=C;
		end 
		else
		if ( sel == 3'b011 ) 
			begin 
			Y=D;
		end 
		else
		if ( sel == 3'b100 ) 
			begin 
			Y=E;
		end 
		else
		if ( sel == 3'b101 ) 
			begin 
			Y=F;
		end 
		else
		if ( sel == 3'b110 ) 
			begin 
			Y=G;
		end 
		else
		if ( sel == 3'b111 ) 
			begin 
			Y=H;
		end 
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

module ram8x8 (output [7:0] we, input [2:0] addr, input rw,
input clk, input [7:0] inpu, input clear);
wire dms0,dms1,dms2,dms3,dms4,dms5,dmsd,dms7;
wire [7:0] aw, bw, cw, dw, ew, fw, gw, hw;

demux8 dm8 (1'b1, addr, dms0, dms1, dms2, dms3, dms4, dms5, dms6, dms7);

ram1x8 Cater (aw, dms0, rw, clk, inpu, clear);
ram1x8 Raphael (bw, dms1, rw, clk, inpu, clear);
ram1x8 Mirian (cw, dm2, rw, clk, inpu, clear);
ram1x8 Dino (dw, dms3, rw, clk, inpu, clear);
ram1x8 Leona (ew, dms4, rw, clk, inpu, clear);
ram1x8 Terra (fw, dms5, rw, clk, inpu, clear);
ram1x8 Kyontera (gw, dms6, rw, clk, inpu, clear);
ram1x8 Gilda (hw, dms7, rw, clk, inpu, clear);

mux8 m8 (we, aw, bw, cw, dw, ew, fw, gw, hw, addr);

endmodule
 

module test; 
// ------------------------- definir dados 
wire [0:7] we; 
reg rw, clk, clear;
reg [7:0] inpu;
reg [2:0] addr;

ram8x8 ramiel (we,addr,rw,clk,inpu,clear);
// ------------------------- parte principal 
initial begin 
$display("Guia10Exerc05 - Pedro Henrique Vilar Locatelli - 427453"); 

   $monitor ( "%4d\t%3b\t%1b\t%1b\t%8b\t%1b\t%1b%1b%1b%1b%1b%1b%1b%1b", $time, addr, rw, clk, inpu, clear, we[0],we[1],we[2],we[3],we[4],we[5],we[6],we[7]); 
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