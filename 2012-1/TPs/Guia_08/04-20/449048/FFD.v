//-- Miller 449049 --
//-- Guia 8 --
//-- Flip Flop tipo D --

module FFD ( output q, output qnot,
				input d, input clk );
				
reg q, qnot;

always @( posedge clk )
begin
q <= d; qnot <= ~d;
end
endmodule // FFD