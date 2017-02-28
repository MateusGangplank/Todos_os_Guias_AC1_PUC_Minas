//-----------------------------------------
//Exercicio0105 - RAM 8x8 usando RAM 1x8
//Nome: Mateus Guilherme do Carmo Cruz
//Matrícula: 427446
//-----------------------------------------

`include "ram1x8.v"
`include "plexers.v"
`include "clock.v"

module ram8x8(output [7:0]s, input[7:0]x, input clk,
					input readWrite, input [2:0]address, input clear);
		wire [7:0] aux;
		reg entradaDmx;
		wire [7:0] w0,w1,w2,w3,w4,w5,w6,w7;
		dmx3bits dmx1(aux,entradaDmx,address);
		
		ram1x8 ram0(w0,x,clk,readWrite,aux[0],clear);
		ram1x8 ram1(w1,x,clk,readWrite,aux[1],clear);
		ram1x8 ram2(w2,x,clk,readWrite,aux[2],clear);
		ram1x8 ram3(w3,x,clk,readWrite,aux[3],clear);
		ram1x8 ram4(w4,x,clk,readWrite,aux[4],clear);
		ram1x8 ram5(w5,x,clk,readWrite,aux[5],clear);
		ram1x8 ram6(w6,x,clk,readWrite,aux[6],clear);
		ram1x8 ram7(w7,x,clk,readWrite,aux[7],clear);
		
		mux3bits mux1(s,w0,w1,w2,w3,w4,w5,w6,w7,address);

endmodule //ram8x8

module principal_105;
	reg [7:0]IN;
	wire [7:0]OUT;
	wire clk;
	reg RW, clear;
	reg [2:0]ADD;
	
	clock clk1(clk);
	
	ram8x8 ram1(OUT,IN,clk,RW,ADD,clear);
	
	initial begin
		IN = 8'b10000000;
		clear = 0;
		RW = 0;
		ADD = 0;
		
		$display("Exercicio0105 - RAM 8x8 usando RAM 1x8 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("clk \t RW \t ADD \t IN \t\t OUT");
		$monitor("%b \t %b \t %3b \t %8b \t %8b",clk,RW,ADD,IN,OUT);
		
		#1 clear = 1;
		#1 clear = 0;
		#1 RW = 1;
		#3 RW = 0;
		#1 IN = 8'b01000000; ADD = 1;
		#1 RW = 1;
		#1 RW = 0;
		#1 IN = 8'b00100000; ADD = 2;
		#5 RW = 1;
		#1 RW = 0;
		#1 IN = 8'b00010000; ADD = 3;
		#1 RW = 1;
		#1 RW = 0;
		#1 IN = 8'b00001000; ADD = 4;
		#5 RW = 1;
		#1 RW = 0;
		#1 IN = 8'b00000100; ADD = 5;
		#1 RW = 1;
		#1 RW = 0;
		#1 IN = 8'b00000010; ADD = 6;
		#5 RW = 1;
		#1 RW = 0;
		#1 IN = 8'b00000001; ADD = 7;
		#1 RW = 1;
		#1 RW = 0; IN = 0;
		#1 ADD = 0;
		#1 ADD = 1;
		#1 ADD = 2;
		#1 ADD = 3;
		#1 ADD = 4;
		#1 ADD = 5;
		#1 ADD = 6;
		#1 ADD = 7;
		#1 $finish;
		
	end
endmodule //principal_105