// Exercicio 002 – RAM 2X4
// Nome: Átila Martins Silva Júnior
// Matricula: 449014

`include"ram1x4.v"

module  mux(output[3:0] muxOut, input[3:0] in0 ,input[3:0] in1, input sel);
	reg[3:0] muxOut;
	 always @ (sel or in0 or in1)
 		begin
  			case(sel) 
     			1'b0 : muxOut = in0;
     			1'b1 : muxOut = in1;
  			endcase 
 		end
endmodule

module demux(output out0, output out1, input muxIn, input sel);
	reg out0;
	reg out1;
	 always @ (sel or muxIn)
 		begin
  			case(sel) 
     			1'b0 : begin out0 = muxIn; out1 = sel; end
     			1'b1 : begin out1 = muxIn; out0 = ~sel; end
  			endcase 
 		end
endmodule

module demux4b(output[3:0] out0, output[3:0] out1, input[3:0] muxIn, input sel);
	reg[3:0] out0;
	reg[3:0] out1;
	 always @ (sel or muxIn)
 		begin
  			case(sel) 
     			1'b0 : out0 = muxIn;
     			1'b1 : out1 = muxIn;
  			endcase 
 		end
endmodule


module ram2x4(output[3:0] saida, input addr, input rw, input clk, input[3:0] entrada);
	wire d0, d1;
	wire[3:0] s0, s1, saida, ent, in0, in1;
	demux DMUX0(d0, d1, 1'b1, addr);
	demux4b DMUX4b(in0, in1, entrada, addr);//--seleciona a entrada
	ram1x4 RAM0(s0, in0, clk, rw, d0);
	ram1x4 RAM1(s1, in1, clk, rw, d1);
	mux MUX1(saida, s0, s1, addr);
endmodule

module testRam2x4;
	wire[3:0] saida;
	reg[3:0] entrada;
	reg addr, rw, clk;
	
	ram2x4 RAM2X4(saida, addr, rw, clk, entrada);
	
	initial begin
	$display("Exercicio02 - Átila Martins Silva Júnior - 449014");
	
	entrada = 4'b0000; rw = 1; addr = 0; clk = 0;
	
	$monitor("input: %b addr: %b rw: %b output: %b",entrada,addr,rw,saida);
	#4entrada = 4'b1111; clk = 1;
	#4clk = 0;
	#4entrada = 4'b0101; addr = 1; clk = 1; 
	#4clk = 0;
	#4addr = 0; clk = 1;
	#4clk = 0;
	#4addr = 1; clk = 1;
	#4clk = 0;
	
	end
endmodule