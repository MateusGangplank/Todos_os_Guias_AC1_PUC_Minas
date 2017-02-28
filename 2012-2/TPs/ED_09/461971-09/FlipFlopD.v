module FlipFlopD (q, qnot, d, clk, clr);
input d, clk, clr;
output q, qnot;
reg q, qnot;
always @(posedge clk)
begin
if(clr)
begin
q <= 0; qnot <= 1;
end
else
begin
q <= d; qnot <= ~d;
end
end
endmodule