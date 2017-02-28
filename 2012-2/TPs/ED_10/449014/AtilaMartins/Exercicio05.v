// Exercicio 005 – RAM 8X8
// Nome: Átila Martins Silva Júnior
// Matricula: 449014

`include"ram4x8.v"

module demux8b(output[7:0] s0, output[7:0] s1, input[7:0] demux, input chave);
	reg[7:0] s0, s1;
	always@(demux or chave)
	begin
		case(chave)
			1'b0 : s0 = demux; 
			1'b1 : s1 = demux;
		endcase
	end
endmodule

module demux(output s0, output s1, input dmux, input chave);
	reg s0, s1;
	always@(chave or dmux)
	begin
		case(chave)
			1'b0 : begin s0 = dmux; s1 = ~dmux; end
			1'b1 : begin s1 = dmux; s0 = ~dmux; end
		endcase
	end
endmodule

module mux8b(output[7:0] s, input[7:0] e0, input[7:0] e1, input chave);
	reg[7:0] s;
	always@(chave or e0 or e1)
	begin
		case(chave)
			1'b0 : s = e0; 
			1'b1 : s = e1;
		endcase
	end
endmodule

module ram8x8(output[7:0] s, input[2:0] addr, input rw, input clk, input[7:0] ent);
	wire c0, c1;
	wire[7:0] s0, s1, e0, e1;
	
	demux8b DEMUX8B(e0, e1, ent, addr[2]);
	demux DEMUX(c0, c1, clk, addr[2]);
	
	ram4x8 RAM4X8_0(s0, addr[1:0], rw, c0, e0);
	ram4x8 RAM4X8_1(s1, addr[1:0], rw, c1, e1);
	
	mux8b MUX8B(s, s0, s1, addr[2]);
endmodule

module testRam8x8;
	wire[7:0] s;
	reg[7:0] ent;
	reg[2:0] addr;
	reg rw, clk;
	
	ram8x8 RAM8X8(s, addr, rw, clk, ent);
	initial begin
		$display("Exercicio05 - Átila Martins Silva Júnior - 449014");
		
		ent = 8'b00000000; addr = 3'b000; rw = 1; clk = 0;
		
		$monitor("input: %b addr: %b output: %b", ent, addr, s);
		#4ent = 8'b00000001; clk = 1;
		#4clk = 0;
		ent = 8'b00000010; addr = 3'b001; clk = 1; 
		#4clk = 0;
		ent = 8'b00000011; addr = 3'b010; clk = 1; 
		#4clk = 0; 
		ent = 8'b00000100; addr = 3'b011; clk = 1; 
		#4clk = 0;
		ent = 8'b00000101; addr = 3'b100; clk = 1; 
		#4clk = 0;
		ent = 8'b00000110; addr = 3'b101; clk = 1; 
		#4clk = 0;
		ent = 8'b00000111; addr = 3'b110; clk = 1; 
		#4clk = 0;
		ent = 8'b00001000; addr = 3'b111; clk = 1; 
		#4clk = 0;
	end
endmodule