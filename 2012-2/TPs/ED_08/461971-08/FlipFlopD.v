module dff (q, qnot, d, preset, clr, clk);
input d, clk, clr, preset;
output q, qnot;
reg q, qnot;
always @(posedge clk)
begin
if(clr == 1)
begin
q <= 0; qnot <= 1;
end
else
if(preset == 1)
begin
q <= 1; qnot <= 0;
end
else
begin
q <= d; qnot <= ~d;
end
end
endmodule