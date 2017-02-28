/* -- Guia 09 --
 * -- Luhan Mairinck - Matricula: 446987 
 * -- Exercicio 02
 */ 


module jkff ( output q, output qnot, 
input j, input k, input clk , input clr); 

reg q, qnot; 

always @( posedge clk ) 
begin
 if ( clr )
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

module test_EX2;

wire q1, q2, q3, q4, q1not, q2not, q3not, q4not;
reg x, clk, clr;

jkff JKFF1 (q, qnot, x, x, q1, clr);
jkff JKFF2 (q1, q1not, qnot, qnot, qnot, clr);
jkff JKFF3 (q2, q2not, q1not, q1not, q1not, clr);
jkff JKFF4 (q3, q3not, q2not, q2not, q2not, clr);
jkff JKFF5 (q4, q4not, q3not, q3not, q3not, clr);






initial
begin
$display ("qnot q1not  q2not  q3not  q4not");
clk = 1;
x = 0; clr = 1;
#10 x = 1; clr = 0;
#90 $finish;

end // initial
always
#5 clk = ~clk;



always @ (posedge clk)
begin
$display ("%b     %b      %b      %b      %b", 
           qnot, q1not, q2not, q3not, q4not);
end // always at positive edge clocking changing

endmodule // test_EX2