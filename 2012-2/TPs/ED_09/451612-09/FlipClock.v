/**
* Nome: Rodolfo Herman
* Matricula : 451612
* FLIP-FLOPS & CLOCK - GUIA09
*
*/

module jkff ( output q, output qnot, input j, input k, input clk, input clear );
reg q, qnot;
always @( posedge clk or clear )
begin
if ( ~clear )
begin
q <= 0; qnot <= 1;
end
else

if ( j & ~k )
begin
q <= 1; qnot <= 0;
end
else
if ( ~j & k )
begin
q <= 0; qnot <= 1;
end
else
if ( j & k )
begin
q <= ~q; qnot <= ~qnot;
end
end
endmodule // jkff

module jkff2 ( output q, output qnot, input j, input k, input clk, input clear );
reg q, qnot;
always @( posedge clk  )
begin
if ( clear )
begin
q <= 0; qnot <= 1;
end
else

if ( j & ~k )
begin
q <= 1; qnot <= 0;
end
else
if ( ~j & k )
begin
q <= 0; qnot <= 1;
end
else
if ( j & k )
begin
q <= ~q; qnot <= ~qnot;
end
end
endmodule // jkff

module jkff3 ( output q, output qnot, input j, input k, input clk, input preset );
reg q, qnot;
always @( posedge clk  )
begin
if ( preset )
begin
q <= 1; qnot <= 0;
end
else

if ( j & ~k )
begin
q <= 1; qnot <= 0;
end
else
if ( ~j & k )
begin
q <= 0; qnot <= 1;
end
else
if ( j & k )
begin
q <= ~q; qnot <= ~qnot;
end
end
endmodule // jkff


module tff ( output q, output qnot, input t, input clk, input clear );
reg q, qnot;
always @( posedge clk )
begin
if ( clear )
begin
q <= 0; qnot <= 1;
end
else
begin
if ( t )
begin
q <= ~q; qnot <= ~qnot;
end
end
end
endmodule // tff



module clock ( output clk );
//criar saida
reg clk;
//valor inicial do clock
initial begin
clk = 1'b0;
end
always begin
#6 clk = ~clk;
end
endmodule