// -- Arquitetura de Computadores I
// -- Guia 10
// -- Nome: Luhan Mairinck Reis 
// -- Matricula: 446987

`include "RAM1x1.v"

module RAM1x4;

wire [3:0]out;
reg address, rw, clk, clr;
reg [3:0]in;
					
wire s, s1, qnot, notIn;

RAM1x1 R0 (out[0], address, rw, clk, in[0], clr);
RAM1x1 R1 (out[1], address, rw, clk, in[1], clr);
RAM1x1 R2 (out[2], address, rw, clk, in[2], clr);
RAM1x1 R3 (out[3], address, rw, clk, in[3], clr);

initial
begin
$display ("clk in address rw out"); 
clr = 1;
rw = 0;
#1 clr = 0;
#1 address = 0; rw = 1; in = 1001;
#1 address = 1; rw = 1; in = 1001;
#1 address = 1; rw = 1; in = 1001;
#1 address = 1; rw = 1; in = 1111;
#1 address = 1; rw = 1; in = 0000;
#1 address = 1; rw = 1; in = 0000;
#2 $finish;
end

always @ ( posedge clk )
begin
$display ("%b  %4b %b     %b  %4b", clk, in, rw, out); 

end // always at positive edge clocking changing 

endmodule // RAM1x4