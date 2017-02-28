//-------------------------------------
// --Nome: Milton costa teles da silva
// --Matricula: 002751
//-- Exercicio 01 - Guia 10
//-------------------------------------
`include "flipflop.v"

module ram1x4(output [3:0]s, input[3:0]x, input addr,
					input rw, input clk, input clear);

	wire not0,not1,no2,not3;
	wire w;
	wire [3:0]q,qnot;
	
	not not0(not0,x[0]);
	not not1(not1,x[1]);
	not not2(not2,x[2]);
	not not3(not3,x[3]);
	
	and and0(w,addr,rw,clk);
	
	jkff flip1(q[0],qnot[0],x[0],not0,w,0,clear);
	jkff flip2(q[1],qnot[1],x[1],not1,w,0,clear);
	jkff flip3(q[2],qnot[2],x[2],not2,w,0,clear);
	jkff flip4(q[3],qnot[3],x[3],not3,w,0,clear);
	
	wire [3:0] out1;
	
	assign out1[0] = q[0];
	assign out1[1] = q[1];
	assign out1[2] = q[2];
	assign out1[3] = q[3];
	
	and and1(s[0],out1[0],addr);
	and and2(s[1],out1[1],addr);
	and and3(s[2],out1[2],addr);
	and and4(s[3],out1[3],addr);

endmodule//ram1x4

module principal;
	reg [3:0] in0;
	wire [3:0] out0;
	reg clear, addr, rw;
	wire clk;
	
	clock clock(clk);
	ram1x4 ram1x4(out0,in0,addr,rw,clk,clear);
	
	initial begin
		clear = 0;
		addr = 0;
		rw = 0;
		in0 = 4'b1001;
		$display("Exercicio01-Nome: Milton costa teles da silva-Matricula: 002751");
		$display("addr \trw \tclk \tin0   - out0");
		$monitor("%b \t%b \t%b \t%4b - %4b",addr,rw,clk,in0,out0);
		#1 clear = 1;
		#1 clear = 0;
		#1 rw = 1; addr = 1;
		#3 addr = 0; rw = 0;
		#1 rw = 1;
		#3 rw = 0; in0 = 4'b1101;
		#3 rw = 1; addr = 1; 
		#1 clear = 1; in0 = 4'b1111; rw = 0; addr = 0;
		#1 clear = 0;
		#20 rw = 1;
		#10 addr = 1;
		#20 $finish;
	end


endmodule //principal