// -- Exercicio 2--  
// -- Luhan Mairinck Reis 446987
// -- Flip-Flop D 

module dff ( output q, output qnot, 
input d, input clk, input clr );
 
reg q, qnot; 

always @( posedge clk ) 
begin 
if ( clr )
begin
q <= 0; qnot <= 1;
end
else
begin
q <= d; qnot <= ~q; 
end 
end
endmodule // dff 

module test_EX1;
wire q, q1, q2, q3, qnot, q1not, q2not, q3not;
reg d, clk;

dff DFF4 (q3, q3not, q2, clk, 0);
dff DFF3 (q2, q2not, q1, clk, 0);
dff DFF2 (q1, q1not, q, clk, 0);
dff DFF1 (q, qnot, d, clk, 0);

initial
begin 
$display ( " Time d q3 q2 q1 q"); 
clk = 1; 
d = 0;
// input signal changing 
#10 d = 1; 
#10 d = 0; 
#20 d = 1; 
#10 d = 0; 
#30 $finish; 

end // initial 
always 
#5 clk = ~clk; 

always @( posedge clk ) 
begin 
$display ( "%4d  %b  %b  %b  %b %b", $time, d ,q3, q2, q1, q); 
end // always at positive edge clocking changing 

endmodule //module test