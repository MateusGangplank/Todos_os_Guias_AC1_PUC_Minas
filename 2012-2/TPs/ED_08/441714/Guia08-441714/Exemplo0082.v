// -----------------------------
// Exemplo0082
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

module ex82 (output[4:0]s, input x, input clk);

wire no;
wire w1, w2, w3, w4;

or or1 (w1, x, s[0]);
or or1 (w2, x, s[1]);
or or1 (w3, x, s[2]);
or or1 (w4, x, s[3]);

dff DFF0 (s[0], no, x, clk);
dff DFF1 (s[1], no, w1, clk);
dff DFF2 (s[2], no, w2, clk);
dff DFF3 (s[3], no, w3, clk);
dff DFF4 (s[4], no, w4, clk);

endmodule//ex82

//------------------------------------------------------
//------------------------------------------------------


module teste;
wire [4:0] saida;
reg x;
wire w; 
clock clk ( w ); 
ex82 LF1 (saida, x, w);
	
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