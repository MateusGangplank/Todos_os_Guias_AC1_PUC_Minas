// -----------------------------
// Exemplo0081
// Yousef Otacilio
// 441714
// -----------------------------


`include "clock.v"

//------------------------------------------------------
//------------------------------------------------------
module dff ( output q, output qnot,input d, input clk );

reg q, qnot;

always @( posedge clk )

begin
q <= d; qnot <= ~d;
end

endmodule // dff

//------------------------------------------------------
//------------------------------------------------------

module ex81 (output[4:0]s, input x, input clk);

wire w;

dff DFF0 (s[0], w, x, clk);
dff DFF1 (s[1], w, s[0], clk);
dff DFF2 (s[2], w, s[1], clk);
dff DFF3 (s[3], w, s[2], clk);
dff DFF4 (s[4], w, s[3], clk);

endmodule//ex81

//------------------------------------------------------
//------------------------------------------------------


module teste;
wire [4:0] saida;
reg x;
wire w; 
clock clk ( w ); 
ex81 LF1 (saida, x, w);
	
initial begin


$display("Yousef Otacilio -- 441714");
$display("X CLOCK SAIDA");
x = 1;
$monitor("%1b    %1b    %5b", x, w, saida);

#20 x = 0;
#20 x = 1;
#20 x = 0;
#20 x = 1;
#120 $finish;

end
endmodule //teste