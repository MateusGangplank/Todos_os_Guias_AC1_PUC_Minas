module tff (output q, output qnot, input t, input clk, input clear);

reg q, qnot;
initial begin : start
q=0;
end
always @(posedge clk )
begin
if(~clear )
begin
q<=0; qnot<=~q;
end
else
if (t)
begin
q<=~q; qnot<=~q;
end
end

endmodule