// -------------------------
// Diversos
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

//--------------
//-- dff
//--------------
module dff ( output q, output qnot, input d, input clk );
	reg q, qnot;
	
	always @( posedge clk )
	begin
		q <= d; qnot <= ~d;
	end
endmodule // dff

//--------------
//-- tff
//--------------
module tff ( output q, output qnot,
				 input t, input clk,
				 input preset, input clear );

	reg q, qnot;

	always @( posedge clk or posedge preset or posedge clear)
	begin 
		if (clear ) 
		begin 
			q = 0; qnot = 1; 
		end 
		else if (preset) 
		begin 
			q = 1; qnot = 0; 
		end 
		else 
		begin 
			if ( t ) 
			begin 
				q <= ~q; qnot <= ~qnot; 
			end 
		end 
	end 
endmodule // tff

//--------------
//-- srff
//--------------
module srff ( output q, output qnot,
				  input s, input r, input clk );

	reg q, qnot;

	always @( posedge clk )
	begin
		if ( s & ~r )
		begin
			q <= 1; qnot <= 0;
		end
		else if ( ~s & r )
		begin
			q <= 0; qnot <= 1;
		end
		else if ( s & r )
		begin
			q <= 0; qnot <= 0; // arbitrary
		end
	end
endmodule // srff

//--------------
//-- jkff
//--------------
module jkff ( output q, output qnot,
				  input j, input k, input clk,
				  input clear, input preset);

	reg q, qnot;

	always @( posedge clk or posedge preset or posedge clear )
	begin
		if(clear)
		begin
			q = 0;
			qnot = 1;
		end
		else if(preset)
		begin
			q = 1;
			qnot = 0;
		end
		else if ( j & ~k ) 
		begin 
			q <= 1; qnot <= 0; 
		end 
		else if ( ~j & k ) 
		begin 
			q <= 0; qnot <= 1; 
		end 
		else if ( j & k ) 
		begin 
			q <= ~q; qnot <= ~qnot; 
		end
	end
endmodule // jkff

//--------------
//-- clock
//--------------
module clock ( clk );
	output clk;
	reg clk;
	initial begin
	   clk = 1'b0;
	end
	
	always begin
	   #5 clk = ~clk;
	end
endmodule // clock ( )

//--------------
//-- ram1x4
//--------------
module ram1x4(output [3:0]s, input[3:0]e, input clock,
					input rw, input addr, input clear);

	wire not0,not1,not2,not3;
	wire w;
	wire [3:0]q,qnot;
	
	not NOT1(not0,e[0]);
	not NOT2(not1,e[1]);
	not NOT3(not2,e[2]);
	not NOT4(not3,e[3]);
	
	and AND1(w,clock,rw,addr);
	
	jkff FP1(q[0],qnot[0],e[3],not3,w,0,clear);
	jkff FP2(q[1],qnot[1],e[2],not2,w,0,clear);
	jkff FP3(q[2],qnot[2],e[1],not1,w,0,clear);
	jkff FP4(q[3],qnot[3],e[0],not0,w,0,clear);
	
	wire [3:0] aux;
	
	assign aux[0] = q[3];
	assign aux[1] = q[2];
	assign aux[2] = q[1];
	assign aux[3] = q[0];
	
	and AND2(s[0],aux[0],addr);
	and AND3(s[1],aux[1],addr);
	and AND4(s[2],aux[2],addr);
	and AND5(s[3],aux[3],addr);

endmodule //ram1x4

//--------------
//-- mux1
//--------------
module mux1(output [3:0]s, input [3:0]i0,
				input [3:0]i1, input key);
	
	reg [3:0]s;
	
	always @(key or i1 or i0)
	begin
		if(~key)
		begin
			s = i0;
		end
		else
		begin
			s = i1;
		end
	end
endmodule // mux1

//--------------
//-- dmux1
//--------------
module dmux1(output s0, output s1,input a,input key);
	reg s0,s1;
	
	initial begin
		s0 = 0;
		s1 = 0;
	end
	always @(key or s0 or s1 or a)
		begin
			if(~key)
				begin
					s0 = a;
					s1 = 0;
				end
			else
				begin
					s0 = 0;
					s1 = a;
				end
		end
endmodule //dmux1

//--------------
//-- ram2x4
//--------------
module ram2x4(output [3:0]s, input [3:0]e, input clock,
			     input rw, input addr, input clear);
	reg demuxE;
	wire w0,w1;
	wire [3:0]aux0;
	wire [3:0]aux1;
	
	dmux1 DX1(w0, w1, demuxE, addr);
	ram1x4 RAM1(aux0, e, clock, rw, w0, clear);
	ram1x4 RAM2(aux1, e, clock, rw, w1, clear);
	mux1 MX1(s, aux0, aux1, addr);

	initial begin
		demuxE = 1'b1;
	end
endmodule // ram2x4

//--------------
//-- ram1x8
//--------------
module ram1x8(output [7:0]s,input[7:0]e,input clock,
				  input rw,input addr,input clear);
				  
	ram1x4 RAM1(s[3:0], e[3:0], clock, rw, addr, clear);
	ram1x4 RAM2(s[7:4], e[7:4], clock, rw, addr, clear);
	
endmodule // ram1x8

//--------------
//-- ram2x8
//--------------
module ram2x8(output[7:0]s, input[7:0]e, input clock,
				  input rw, input [1:0]addr, input clear);
	
	reg entradaDmux;
	wire [3:0]w;
	wire [7:0]aux0,aux1,aux2,aux3;
	
	dmux2 DX2(w, entradaDmux, addr);
	
	ram2x4 RAM1(aux0[3:0], e[3:0], clock, rw, w[0], clear);
	ram2x4 RAM2(aux0[7:4], e[7:4], clock, rw, w[0], clear);
	
	ram2x4 RAM3(aux1[3:0], e[3:0], clock, rw, w[1], clear);
	ram2x4 RAM4(aux1[7:4], e[7:4], clock, rw, w[1], clear);

	ram2x4 RAM5(aux2[3:0], e[3:0], clock, rw, w[2], clear);
	ram2x4 RAM6(aux2[7:4], e[7:4], clock, rw, w[2], clear);
	
	ram2x4 RAM7(aux3[3:0], e[3:0], clock, rw, w[3], clear);
	ram2x4 RAM8(aux3[7:4], e[7:4], clock, rw, w[3], clear);
		
	mux2 MX1(s, aux0, aux1, aux2, aux3, addr);

endmodule // ram4x8


//--------------
//-- mux2
//--------------
module mux2(output[7:0]s, input[7:0]i0, input[7:0]i1,
				input[7:0]i2,input[7:0]i3,input [1:0] key);
	reg [7:0]s;
	
	always @ (key or i0 or i1 or i2 or i3)
	begin
		if(key == 0)
			s = i0;
		else if(key == 1)
			s = i1;
		else if(key == 2)
			s = i2;
		else if(key == 3)
			s = i3;
	end
endmodule // mux2

//--------------
//-- dmux2
//--------------
module dmux2(output [3:0]s, input x, input [1:0]key);
	reg [3:0]s;
	
	initial begin
		s = 0;
	end
	
	always @ (key or posedge x or s)
	begin
		if(key == 0)
			s = 4'b0001;
		else if(key == 1)
			s = 4'b0010;
		else if(key == 2)
			s = 4'b0100;
		else if(key == 3)
			s = 4'b1000;
	end
	
	always @(negedge x)
	begin
		s = 0;
	end
endmodule //dmux2

//--------------
//-- mux3
//--------------
module mux3(output[7:0]s, input[7:0]i0, input[7:0]i1,
				input[7:0]i2,input[7:0]i3,input[7:0]i4,
				input[7:0]i5,input[7:0]i6,input[7:0]i7, input [2:0] key);
				
	reg [7:0]s;
	
	always @ (key or i0 or i1 or i2 or i3 or i4 or i5 or i6 or i7)
	begin
		if(key == 0)
			s = i0;
		else if(key == 1)
			s = i1;
		else if(key == 2)
			s = i2;
		else if(key == 3)
			s = i3;
		else if(key == 4)
			s = i4;
		else if(key == 5)
			s = i5;
		else if(key == 6)
			s = i6;
		else
			s = i7;
	end
endmodule // mux3

//--------------
//-- dmux3
//--------------
module dmux3(output [7:0]s, input x, input [2:0]key);

	reg [7:0]s;

	initial begin
		s = 0;
	end
	
	always @ (key or posedge x or s)
	begin
		if(key == 0)
			s = 8'b00000001;
		else if(key == 1)
			s = 8'b00000010;
		else if(key == 2)
			s = 8'b00000100;
		else if(key == 3)
			s = 8'b00001000;
		else if(key == 4)
			s = 8'b00010000;
		else if(key == 5)
			s = 8'b00100000;
		else if(key == 6)
			s = 8'b01000000;
		else if(key == 7)
			s = 8'b10000000;
	end
	
	always @(negedge x)
	begin
		s = 0;
	end
endmodule // dmux3

//--------------
//-- ram8x8
//--------------
module ram8x8(output [7:0]s, input[7:0]e, input clock,
				  input rw, input [2:0]addr, input clear);
		
		wire [7:0] aux;
		reg entradaDmux;
		wire [7:0] w0,w1,w2,w3,w4,w5,w6,w7;
		
		dmux3 DX1(aux, entradaDmux,addr);
		
		ram1x8 RAM1(w0, e, clock, rw, aux[0], clear);
		ram1x8 RAM2(w1, e, clock, rw, aux[1], clear);
		ram1x8 RAM3(w2, e, clock, rw, aux[2], clear);
		ram1x8 RAM4(w3, e, clock, rw, aux[3], clear);
		ram1x8 RAM5(w4, e, clock, rw, aux[4], clear);
		ram1x8 RAM6(w5, e, clock, rw, aux[5], clear);
		ram1x8 RAM7(w6, e, clock, rw, aux[6], clear);
		ram1x8 RAM8(w7, e, clock, rw, aux[7], clear);
		
		mux3 MX1(s, w0, w1, w2, w3, w4, w5, w6, w7, addr);

endmodule // ram8x8