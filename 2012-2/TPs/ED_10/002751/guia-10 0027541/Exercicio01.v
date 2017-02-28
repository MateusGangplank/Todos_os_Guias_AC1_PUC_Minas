//-------------------------------------
// --Nome: Milton costa teles da silva
// --Matricula: 002751
//-- Exercicio 01 - Guia 10
//-------------------------------------
`include "jkff.v"
`include "clock.v"

module ram1x4(output [3:0]s, input[3:0]x, input clk,
					input readWrite, input address, input clear);

	wire not0,not1,no2,not3;
	wire w;
	wire [3:0]q,qnot;
	
	not not0(not0,x[0]);
	not not1(not1,x[1]);
	not not2(not2,x[2]);
	not not3(not3,x[3]);
	
	and and1(w,clk,readWrite,address);
	
	jkff flip1(q[0],qnot[0],x[3],not3,w,0,clear);
	jkff flip2(q[1],qnot[1],x[2],not2,w,0,clear);
	jkff flip3(q[2],qnot[2],x[1],not1,w,0,clear);
	jkff flip4(q[3],qnot[3],x[0],not0,w,0,clear);
	
	wire [3:0] aux;
	
	assign aux[0] = q[3];
	assign aux[1] = q[2];
	assign aux[2] = q[1];
	assign aux[3] = q[0];
	
	and and1(s[0],aux[0],address);
	and and2(s[1],aux[1],address);
	and and3(s[2],aux[2],address);
	and and4(s[3],aux[3],address);

endmodule//ram1x4

module principal_101;
	reg [3:0]IN;
	wire [3:0]OUT;
	reg clear, ADD, RW;
	wire clk;
	
	clock clk1(clk);
	ram1x4 ram1(OUT,IN,clk,RW,ADD,clear);
	
	initial begin
		clear = 0;
		ADD = 0;
		RW = 0;
		IN = 4'b1101;
		$display("Exercicio01- RAM 1x4  - Milton costa teles da silva - 002751");
		$display("clk \tRW \tADD \tIN   - OUT");
		$monitor("%b \t%b \t%b \t%4b - %4b",clk,RW,ADD,IN,OUT);
		#1 clear = 1;
		#1 clear = 0;
		#1 RW = 1; ADD = 1;
		#3 ADD = 0; RW = 0;
		#1 RW = 1;
		#3 RW = 0; IN = 4'b1010;
		#3 RW = 1; ADD = 1; 
		#1 clear = 1; IN = 4'b1111; RW = 0; ADD = 0;
		#1 clear = 0;
		#20 RW = 1;
		#10 ADD = 1;
		#20 $finish;
	end


endmodule //principal_101