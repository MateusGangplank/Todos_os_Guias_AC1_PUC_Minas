// Exercicio 007 – RAM 4X8
// Nome: Átila Martins Silva Júnior
// Matricula: 449014

`include"ram1x8.v"

module demux4s8b(output[7:0] s0, output[7:0] s1, output[7:0] s2, output[7:0] s3, input[7:0] ent, input[1:0] chave);
	reg[7:0] s0, s1, s2, s3;
	always @ (chave or ent)
	begin
		case(chave)
			2'b00 : s0 = ent;
			2'b01 : s1 = ent;
			2'b10 : s2 = ent;
			2'b11 : s3 = ent;
		endcase
	end
endmodule

module demux4s(output[3:0] s, input dmuxIn, input[1:0] chave);
	reg[3:0] s;
	always @ (chave or dmuxIn)
	begin
		case(chave)
			2'b00 : begin s[0] = 1'b1; s[3:1] = 3'b000; end 
			2'b01 : begin s[1] = 1'b1; s[0] = 1'b0; s[3:2] = 2'b00; end
			2'b10 : begin s[2] = 1'b1; s[1:0] = 2'b00; s[3] = 1'b0; end
			2'b11 : begin s[3] = 1'b1; s[2:0] = 3'b000; end
		endcase
	end
endmodule

module mux4e8b(output[7:0] s, input[7:0] e0, input[7:0] e1, input[7:0] e2, input[7:0] e3, input[1:0] chave);
	reg[7:0] s;
	always @ (chave or e0 or e1 or e2 or e3)
	begin
		case(chave)
			2'b00 : s = e0;
			2'b01 : s = e1;
			2'b10 : s = e2;
			2'b11 : s = e3;
		endcase
	end
endmodule

module ram4x8(output[7:0] s, input[1:0] addr, input rw, input clk, input[7:0] ent);
	wire[3:0] dm;
	wire[7:0] ent0, ent1, ent2, ent3, s0, s1, s2, s3;
	
	demux4s DEMUX4S(dm, 1'b1, addr);
	demux4s8b DEMUX4S8B(ent0, ent1, ent2, ent3, ent, addr);
	
	ram1x8 RAM1X8_0(s0, ent0, dm[0], rw, clk);
	ram1x8 RAM1X8_1(s1, ent1, dm[1], rw, clk);
	ram1x8 RAM1X8_2(s2, ent2, dm[2], rw, clk);
	ram1x8 RAM1X8_3(s3, ent3, dm[3], rw, clk);
	
	mux4e8b MUX4E8B(s, s0, s1, s2, s3, addr);
endmodule

module testRam4x8;
	wire[7:0] s;
	reg[7:0] ent;
	reg[1:0] addr;
	reg rw, clk;
	
	ram4x8 RAM4X8(s, addr, rw, clk, ent);
	initial begin
	$display("Exercicio07 - Átila Martins Silva Júnior - 449014");
	
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