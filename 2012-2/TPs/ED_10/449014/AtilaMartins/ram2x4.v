// RAM 2X4
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

module demux(output out0, output out1, input dmuxIn, input sel);
	reg out0;
	reg out1;
	 always @ (sel or dmuxIn)
 		begin
  			case(sel) 
     			1'b0 : begin out0 = dmuxIn; out1 = sel; end
     			1'b1 : begin out1 = dmuxIn; out0 = ~sel; end
  			endcase 
 		end
endmodule

module demux4b(output[3:0] out0, output[3:0] out1, input[3:0] dmuxIn, input sel);
	reg[3:0] out0;
	reg[3:0] out1;
	 always @ (sel or dmuxIn)
 		begin
  			case(sel) 
     			1'b0 : out0 = dmuxIn;
     			1'b1 : out1 = dmuxIn;
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
