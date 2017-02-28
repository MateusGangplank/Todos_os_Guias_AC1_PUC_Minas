/* -- Guia 09 --
 * -- Luhan Mairinck - Matricula: 446987 
 * -- Exercicio 04
 */ 


module tff ( output q, output qnot, input t,
				  input clk, input clear, input preset ); 
				 
reg q, qnot; 
always @( posedge clk ) 
begin 
if ( ~clear ) 
 begin 
  q <= 0; qnot <= ~q; 
 end 
else 
 if ( ~preset ) 
  begin 
   q <= 1; qnot <= ~q; 
  end 
else 
 begin 
  if ( t ) 
   begin 
    q <= ~q; qnot <= ~q; 
   end 
 end 
end 
endmodule // tff 

module test_EX2;

wire q1, q2, q3, q1not, q2not, q3not, w, z, y;
reg x, clk, clr;

nand NAND1 (z, q, q1not, q2not, q3not);
or OR1 (y, clr, z);
tff TFF1 (q, qnot, x, clk, clr, y);
tff TFF2 (q1, q1not, x, qnot, clr, y);
tff TFF3 (q2, q2not, x, q1not, clr, y);
tff TFF4 (q3, q3not, x, q2not, clr, y);

initial
begin
$display ("q3 q2 q1 q"); 
clr = 0;
clk = 1;
x = 0;
#10 x = 1;
#10 x = 0;
#10 x = 1;
#70 $finish;

end // initial
always
#5 clk = ~clk;

initial
begin
#10 clr = 1;
#10 clr = 0;
x = 1;
end

always @ (posedge clk)
begin
$display ("%b  %b  %b  %b", q3, q2, q1, q);
end // always at positive edge clocking changing

endmodule // test_EX2