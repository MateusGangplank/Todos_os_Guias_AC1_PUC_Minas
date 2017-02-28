// -- Exercicio 3--  
// -- Luhan Mairinck Reis 446987
// -- Flip-Flop D 
// -- Rotate Register Right 

module dff ( output q, output qnot, 
input d, input clk, input clr, input preset );
 
reg q, qnot; 

always @( posedge clk ) 
begin 
if ( clr )
begin
q <= 0; qnot <= 1;
end
else
 begin 
 if ( preset )
  begin
  q <= 1; qnot <= 0;
  end
 else
  begin
  q <= d; qnot <= ~d; 
  end 
end
end
endmodule // dff 

module test_EX1;
wire pulse, q1, q2, q3, q1not, q2not, q3not;
reg d, clk, clr, preset;

or OR1 (pulse, q3, d);
dff DFF1 (q, qnot, pulse, clk, 0, 0);
dff DFF2 (q1, q1not, q, clk, 0, 0);
dff DFF3 (q2, q2not, q1, clk, 0, 0);
dff DFF4 (q3, q3not, q2, clk, 0, 0);


initial
begin 
$display ( " Time d q q1 q2 q3"); 
clk = 1; 
d = 1;
// input signal changing 
#10 d = 0; 
#10 d = 0;  
#60 $finish; 

end // initial 
always 
#5 clk = ~clk; 

always @( posedge clk ) 
begin 
$display ( "%4d  %b %b %b  %b  %b", $time, d ,q, q1, q2, q3); 
end // always at positive edge clocking changing 

endmodule //module test

