// -- Exercicio 5--  
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
wire p1, p2, p3, p4, q1, q2, q3, q1not, q2not, q3not;
reg clk, clr, load;
reg x1, x2, x3, x4;

and AND1 (p1, x1, load);
and AND1 (p2, x2, load);
and AND1 (p3, x3, load);
and AND1 (p4, x4, load);
dff DFF1 (q, qnot, 0, clk, 0, p1);
dff DFF2 (q1, q1not, q, clk, 0, p2);
dff DFF3 (q2, q2not, q1, clk, 0, p3);
dff DFF4 (q3, q3not, q2, clk, 0, p4);


initial
begin 
$display ( " Time Load x1 x2 x3 x4 q q1 q2 q3"); 
clk = 1; 
load = 0;
x1 = 1; x2 = 0; x3 = 1; x4 = 1;
// input signal changing 
#10 load = 1; 
#10 load = 0;  
#60 $finish; 

end // initial 
always 
#5 clk = ~clk; 

always @( posedge clk ) 
begin 
$display ( "%4d    %b   %b %b  %b  %b  %b %b  %b  %b", $time, load , x1, x2, x3, x4, q, q1, q2, q3); 
end // always at positive edge clocking changing 

endmodule //module test

