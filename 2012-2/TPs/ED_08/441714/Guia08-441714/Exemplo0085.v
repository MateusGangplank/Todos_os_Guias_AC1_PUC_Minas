// -----------------------------
// Exemplo0085
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

module ex85 (output[4:0]s, input[4:0]x, input LD, input clk);

wire w;
wire [4:0]w1;
wire [4:0]w2;

and And1 (w1[0], x[0], LD);
and And2 (w1[1], x[1], LD);
and And3 (w1[2], x[2], LD);
and And4 (w1[3], x[3], LD);
and And5 (w1[4], x[4], LD);

or or1 (w2[0], w1[0], 1'b0);
or or2 (w2[1], w1[1], s[0]);
or or3 (w2[2], w1[2], s[1]);
or or4 (w2[3], w1[3], s[2]);
or or5 (w2[4], w1[4], s[3]);

dff DFF0 (s[0], w, w2[0], clk);
dff DFF1 (s[1], w, w2[1], clk);
dff DFF2 (s[2], w, w2[2], clk);
dff DFF3 (s[3], w, w2[3], clk);
dff DFF4 (s[4], w, w2[4], clk);

endmodule//ex85

//------------------------------------------------------
//------------------------------------------------------


module teste;
wire [4:0] saida;
wire c;
reg [4:0]x;
reg LD;
 
clock clk ( c ); 

ex85 LF1 (saida, x, LD, c);
	
initial begin


$display("Yousef Otacilio -- 441714");
$display("X      CLOCK    SAIDA");
x = 1;
LD = 1;
$monitor("%1b    %1b    %5b", x, c, saida);

#20 x = 0000;
#20 x = 0101;
#20 x = 1110;
#20 x = 0111;
LD = 0;
#20 x = 0000;
#20 x = 0101;
#20 x = 1110;
#20 x = 0111;
LD = 1;
#20 x = 1111;
#20 x = 1110;
#20 x = 1101;
#20 x = 0111;

#240 $finish;

end
endmodule //teste