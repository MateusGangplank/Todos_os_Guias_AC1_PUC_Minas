//---------------------------------------------------
//-- Exercicio 05 - Guia 10 
//-- Marlon Henrique de Azeredo Formiga - 397248
//---------------------------------------------------

module ram1x4(output [3:0]s, input[3:0]x, input clk, input readWrite, input address, input clear);

	wire not0, not1, no2, not3;
	wire w;
	wire [3:0]q, qnot;
	
	not not0(not0, x[0]);
	not not1(not1, x[1]);
	not not2(not2, x[2]);
	not not3(not3, x[3]);
	
	and and1(w, clk, readWrite, address);
	
	ffJK flip1(q[0], qnot[0], x[3], not3, w, 0, clear);
	ffJK flip2(q[1], qnot[1], x[2], not2, w, 0, clear);
	ffJK flip3(q[2], qnot[2], x[1], not1, w, 0, clear);
	ffJK flip4(q[3], qnot[3], x[0], not0, w, 0, clear);
	
	wire [3:0] aux;
	
	assign aux[0] = q[3];
	assign aux[1] = q[2];
	assign aux[2] = q[1];
	assign aux[3] = q[0];
	
	and and1(s[0], aux[0], address);
	and and2(s[1], aux[1], address);
	and and3(s[2], aux[2], address);
	and and4(s[3], aux[3], address);

endmodule//-- memoria ram1x4

module ram1x8(output [7:0]s, input[7:0]x, input clk, input readWrite, input address, input clear);
	
	ram1x4 ram1(s[3:0], x[3:0], clk, readWrite, address, clear);
	ram1x4 ram2(s[7:4], x[7:4], clk, readWrite, address, clear);

endmodule //-- memoria ram1x8

module ram8x8(output [7:0]s, input[7:0]x, input clk, input readWrite, input [2:0]address, input clear);
					
		wire [7:0] aux;
		reg inDmx;
		wire [7:0] w0, w1, w2, w3, w4, w5, w6, w7;
		dmx3bits dmx1(aux, inDmx, address);
		
		ram1x8 ram0(w0, x, clk, readWrite, aux[0], clear);
		ram1x8 ram1(w1, x, clk, readWrite, aux[1], clear);
		ram1x8 ram2(w2, x, clk, readWrite, aux[2], clear);
		ram1x8 ram3(w3, x, clk, readWrite, aux[3], clear);
		ram1x8 ram4(w4, x, clk, readWrite, aux[4], clear);
		ram1x8 ram5(w5, x, clk, readWrite, aux[5], clear);
		ram1x8 ram6(w6, x, clk, readWrite, aux[6], clear);
		ram1x8 ram7(w7, x, clk, readWrite, aux[7], clear);
		
		mux3bits mux1(s, w0, w1, w2, w3, w4, w5, w6, w7, address);

endmodule //-- memoria ram8x8

module teste_exercicio_05;
	reg [7:0]IN;
	wire [7:0]OUT;
	wire clk;
	reg readWrite, clear;
	reg [2:0]adress;
	
	clock clk1(clk);
	
	ram8x8 ram1(OUT, IN, clk, readWrite, adress, clear);
	
	initial begin
		IN = 8'b10000000;
		clear = 0;
		readWrite = 0;
		adress = 0;
		
		$display("Clock \tRead/Write \Adress \t IN - OUT");
		$monitor("%b \t%b \t %b \t\t %4b - %4b", clk, readWrite, adress, IN, OUT);
		
		#1 clear = 1;
		#1 clear = 0;
		#1 readWrite = 1;
		#3 readWrite = 0;
		#1 IN = 8'b01000000; adress = 1;
		#1 readWrite = 1;
		#1 readWrite = 0;
		#1 IN = 8'b00100000; adress = 2;
		#5 readWrite = 1;
		#1 readWrite = 0;
		#1 IN = 8'b00010000; adress = 3;
		#1 readWrite = 1;
		#1 readWrite = 0;
		#1 IN = 8'b00001000; adress = 4;
		#5 readWrite = 1;
		#1 readWrite = 0;
		#1 IN = 8'b00000100; adress = 5;
		#1 readWrite = 1;
		#1 readWrite = 0;
		#1 IN = 8'b00000010; adress = 6;
		#5 readWrite = 1;
		#1 readWrite = 0;
		#1 IN = 8'b00000001; adress = 7;
		#1 readWrite = 1;
		#1 readWrite = 0; IN = 0;
		#1 adress = 0;
		#1 adress = 1;
		#1 adress = 2;
		#1 adress = 3;
		#1 adress = 4;
		#1 adress = 5;
		#1 adress = 6;
		#1 adress = 7;
		#1 $finish;
		
	end
endmodule //--fim teste_exercicio_05