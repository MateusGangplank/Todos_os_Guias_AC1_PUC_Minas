module jkff (output q, output qnot, input j, input k, input clk, input clr);
reg q, qnot;
initial begin : start
qnot=1;
end
always @(posedge clk )
if (clr)
begin
q=0;
qnot=1;
end
else
begin
if (j & ~k )
begin
q<=1; qnot<=0;
end
else
if(~j & k )
begin
q<=0; qnot<=1;
end
else
if (j & k )
begin
q<= ~q; qnot<= ~qnot;
end
end
endmodule
 
 
