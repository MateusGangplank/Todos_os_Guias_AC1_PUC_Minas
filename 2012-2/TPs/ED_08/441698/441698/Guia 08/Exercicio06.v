// -------------------------
// Nome: Marcio Enio Gonçalves Dutra Junior
// Matricula: 441698
// -------------------------

`include "clock.v" 
`include "dff.v"
 
// -----------------------------------------------------------
// --  rightShift, para 5 bits
// -----------------------------------------------------------
module rightShift (output[0:4] s, output[0:4] snot, input[0:4] data, input clk);
	wire w0,w1,w2,w3,w4;
	
	or or0 (w0,data[0],s[4]);
	or or1 (w1,data[1],s[0]);
	or or2 (w2,data[2],s[1]);
	or or3 (w3,data[3],s[2]);
	or or4 (w4,data[4],s[3]);
                                              // definir em outro modulo
	dff DFF0(s[0],snot[0],w0,clk);
	dff DFF1(s[1],snot[1],w1,clk);
	dff DFF2(s[2],snot[2],w2,clk);
	dff DFF3(s[3],snot[3],w3,clk);
	dff DFF4(s[4],snot[4],w4,clk);
	
endmodule //rightShift

// -----------------------------
//	--   Teste
// -----------------------------
module teste;
	reg[0:4] data;
	wire[0:4] s;
	wire[0:4] snot;
	wire clk;
	
	clock c1(clk);
	rightShift s1 (s,snot,data,clk);
	
	initial
		begin
			data = 5'b11101;
		end
	
	initial
		begin
		$display("\t\t Clk    Data   Output");
		#13 data = 5'b00000;
		#144 $finish;
		end
		
	
	always @(posedge clk)
		begin
			$display("%d	%b  %b",$time,data,s);
		end

endmodule //teste