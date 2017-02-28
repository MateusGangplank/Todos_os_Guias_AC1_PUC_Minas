// -------------------------
// Nome: Marcio Enio Gonçalves Dutra Junior
// Matricula: 441698
// -------------------------
 
// --------------------------- 
// -- Flip-Flop JK
// --------------------------- 

module jkff ( output q, output qnot,input j, input k, input clk, input preset , input clear ); 
	reg q, qnot;

	always @(posedge clk or posedge preset or posedge clear)
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

// --------------------------- 
// -- Memoria 1x1
// --------------------------- 

module mem1x1 ( output s, input addr,input rw, input data, input clk, input clear ); 
	wire w1,w2,w3;
	wire dontcare1;
	
	and a1(w1, addr, rw, clk);
	not n1(w2, data);
	jkff jk1(w3, dontcare1, data, w2, w1, 0, clear);
	and a2(s,w3,addr);
endmodule

// --------------------------- 
// -- Memoria 1x2
// --------------------------- 

module mem1x2 ( output[1:0] s, input addr,input rw, input[1:0] data, input clk, input clear ); 
	wire w1,w2,w3;
	
	mem1x1 m1(s[0],addr,rw,data[0],clk,clear);
	mem1x1 m2(s[1],addr,rw,data[1],clk,clear);
endmodule

// --------------------------- 
// -- Memoria 1x4
// --------------------------- 

module mem1x4 ( output[3:0] s, input addr,input rw, input[3:0] data, input clk, input clear ); 
	wire[1:0] w1,w2,w3;
	
	mem1x2 m1(s[1:0],addr,rw,data[1:0],clk,clear);
	mem1x2 m2(s[3:2],addr,rw,data[3:2],clk,clear);
endmodule

// --------------------------- 
// -- Memoria 2x4
// --------------------------- 

module mem2x4 ( output[3:0] s, input addr,input rw, input[3:0] data, input clk, input clear ); 
	wire w1,w2,w3;
	wire[3:0] s1,s2;
	
	not(w3, addr);
	and a1(w1, addr, 1);
	and a2(w2, w3, 1);
	
	mem1x4 m1(s1,w1,rw,data[3:0],clk,clear);
	mem1x4 m2(s2,w2,rw,data[3:0],clk,clear);
	
	assign s = addr? s1:s2;
endmodule

// --------------------------- 
// -- Memoria 1x8
// --------------------------- 

module mem1x8 ( output[7:0] s, input addr,input rw, input[7:0] data, input clk, input clear ); 
	mem1x4 m1(s[3:0],addr,rw,data[3:0],clk,clear);
	mem1x4 m2(s[7:4],addr,rw,data[7:4],clk,clear);
endmodule

// --------------------------- 
// -- Memoria 4x8
// --------------------------- 

module mem4x8 ( output[7:0] s, input[1:0] addr,input rw, input[7:0] data, input clk, input clear ); 
	wire w1,w2,w3,w4,w5,w6,w7,w8;
	wire[7:0] s1,s2,s3,s4;
	
	and (w1, addr[0], 1);
	and (w2, addr[1], 1);
	and (w3, ~addr[0], 1);
	and (w4, ~addr[1], 1);
	
	and (w5, w3, w4);
	and (w6, w3, w2);
	and (w7, w1, w4);
	and (w8, w1, w2);

	mem1x4 m1(s1[3:0],w5,rw,data[3:0],clk,clear);
	mem1x4 m2(s1[7:4],w5,rw,data[7:4],clk,clear);
	mem1x4 m3(s2[3:0],w6,rw,data[3:0],clk,clear);
	mem1x4 m4(s2[7:4],w6,rw,data[7:4],clk,clear);
	mem1x4 m5(s3[3:0],w7,rw,data[3:0],clk,clear);
	mem1x4 m6(s3[7:4],w7,rw,data[7:4],clk,clear);
	mem1x4 m7(s4[3:0],w8,rw,data[3:0],clk,clear);
	mem1x4 m8(s4[7:4],w8,rw,data[7:4],clk,clear);
	
	assign s = w5? s1: w6? s2: w7? s3: w8? s4: 8'bxxxxxxxx;
endmodule

// --------------------------- 
// -- Memoria 1x16
// --------------------------- 

module mem1x16 ( output[15:0] s, input addr,input rw, input[15:0] data, input clk, input clear ); 
	mem1x8 m1(s[7:0],addr,rw,data[7:0],clk,clear);
	mem1x8 m2(s[15:8],addr,rw,data[15:8],clk,clear);
endmodule

// --------------------------- 
// -- Memoria 4x8
// --------------------------- 

module mem4x8b ( output[7:0] s, input[1:0] addr,input rw, input[7:0] data, input clk, input clear ); 
	wire w1,w2,w3,w4,w5,w6,w7,w8;
	wire[7:0] s1,s2,s3,s4;
	
	and (w1, addr[0], 1);
	and (w2, addr[1], 1);
	and (w3, ~addr[0], 1);
	and (w4, ~addr[1], 1);
	
	and (w5, w3, w4);
	and (w6, w3, w2);
	and (w7, w1, w4);
	and (w8, w1, w2);

	mem1x8 m1(s1[7:0],w5,rw,data[7:0],clk,clear);
	mem1x8 m2(s2[7:0],w6,rw,data[7:0],clk,clear);
	mem1x8 m3(s3[7:0],w7,rw,data[7:0],clk,clear);
	mem1x8 m4(s4[7:0],w8,rw,data[7:0],clk,clear);
	
	assign s = w5? s1: w6? s2: w7? s3: w8? s4: 8'bxxxxxxxx;
endmodule