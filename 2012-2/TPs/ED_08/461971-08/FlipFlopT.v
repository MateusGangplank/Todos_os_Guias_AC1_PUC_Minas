module tff ( output q, output qnot,
input t, input preset, input clr, input clk );
reg q, qnot;
always @( posedge clk )
begin
if ( clr )
begin
q <= 0; qnot <= 1;
end
else
if ( preset )
begin
q <= 1; qnot <= 0;
end
else
begin
if ( t )
begin
if ( q | ~q )
begin
q <= ~q; qnot <= ~qnot;
end
else
begin
q <= 0; qnot <= 1;
end
end
end
end
endmodule // tff