// Exercicio 004 – RAM 4X8
// Nome: Átila Martins Silva Júnior
// Matricula: 449014

`include"ram1x4.v"

module demux4s(output[3:0] s, input demuxIn, input[1:0] chave);
	reg[3:0] s;
	always@(chave or demuxIn)
	begin
		case(chave)
			2'b00 : begin s[0] = 1; s[3:1] = 3'b000; end
			2'b01 : begin s[1] = 1; s[0] = 0; s[3:2] = 2'b00; end
			2'b10 : begin s[2] = 1; s[1:0] = 2'b00; s[3] = 0 ;end
			2'b11 : begin s[3] = 1; s[2:0] = 3'b000;  end
		endcase
	end
endmodule

module demux4s8b(output[7:0] s0, output[7:0] s1, output[7:0] s2, output[7:0] s3, input[7:0] demuxIn, input[1:0] chave);
	reg[7:0] s0, s2, s1, s3;
	always@(demuxIn or chave)
	begin
		case(chave)
			2'b00 : s0 = demuxIn; 
			2'b01 : s1 = demuxIn;
			2'b10 : s2 = demuxIn;
			2'b11 : s3 = demuxIn;
		endcase
	end
endmodule

module mux4e8b(output[7:0] s, input[7:0] e0, input[7:0] e1, input[7:0] e2, input[7:0] e3, input[1:0] chave);
	reg[7:0] s;
	always@(chave or e0 or e1 or e2 or e3)
	begin
		case(chave)
			2'b00 : s = e0;
			2'b01 : s = e1;
			2'b10 : s = e2;
			2'b11 : s = e3;
		endcase
	end
endmodule

module ram4x8(output[7:0]s, input[1:0] addr, input rw, input clk, input[7:0] ent);
	wire[3:0] add;
	wire[7:0] s0, s1, s2, s3, ent0, ent1, ent2, ent3;
	
	demux4s8b DEMUX4S8B(ent0, ent1, ent2, ent3, ent, addr);
	demux4s DEMUX4S(add, 1'b1, addr);
	
	ram1x4 RAM1X4_0(s0[7:4], ent0[7:4], clk, rw, add[0]);
	ram1x4 RAM1X4_1(s0[3:0], ent0[3:0], clk, rw, add[0]);
	
	ram1x4 RAM1X4_2(s1[7:4], ent1[7:4], clk, rw, add[1]);
	ram1x4 RAM1X4_3(s1[3:0], ent1[3:0], clk, rw, add[1]);
	
	ram1x4 RAM1X4_4(s2[7:4], ent2[7:4], clk, rw, add[2]);
	ram1x4 RAM1X4_5(s2[3:0], ent2[3:0], clk, rw, add[2]);
	
	ram1x4 RAM1X4_6(s3[7:4], ent3[7:4], clk, rw, add[3]);
	ram1x4 RAM1X4_7(s3[3:0], ent3[3:0], clk, rw, add[3]);
	
	mux4e8b MUX4E8B(s, s0, s1, s2, s3, addr);
endmodule

module testRam2x8;
	wire[7:0] s;
	reg[7:0] ent;
	reg [1:0] addr;
	reg rw, clk;
	
	ram4x8 RAM4X8(s, addr, rw, clk, ent);
	initial begin
		$display("Exercicio04 - Átila Martins Silva Júnior - 449014");
		
		ent = 8'b00000000; addr = 2'b00; rw = 1; clk = 0; 
		
		$monitor("input: %b addr: %b output: %b",ent,addr,s);
		#4ent = 8'b00000001; clk = 1;
		#4clk = 0;
		ent = 8'b00000010; addr = 2'b01; clk = 1;
		#4clk = 0;
		ent = 8'b00000011; addr = 2'b10; clk = 1;
		#4clk = 0;
		ent = 8'b00000100; addr = 2'b11; clk = 1;
		#4clk = 0;
		#4addr = 2'b00;
		#4addr = 2'b01;
		#4addr = 2'b10;
		#4addr = 2'b11;
	end
endmodule