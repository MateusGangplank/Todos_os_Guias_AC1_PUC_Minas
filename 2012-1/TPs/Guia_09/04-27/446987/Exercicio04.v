/* -- Guia 09 --
 * -- Luhan Mairinck - Matricula: 446987 
 * -- Exercicio 04
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

wire q1, q2, q3, q4, q1not, q2not, q3not, q4not, w, z, y;
reg x, clk, clr;

nand #50 NAND1 (z, qnot, q1, q2not, q3, q4not);
nand NAND2 (y, clr, z);
jkff JKFF1 (q, qnot, x, x, clk, y);
jkff JKFF2 (q1, q1not, x, x, qnot, y);
jkff JKFF3 (q2, q2not, x, x, q1not, y);
jkff JKFF4 (q3, q3not, x, x, q2not, y);
jkff JKFF5 (q4, q4not, x, x, q3not, y);


initial
begin
$display ("q4 q3 q2 q1 q");
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


always @ (posedge clk)
begin
$display ("%b  %b  %b  %b  %b", q4, q3, q2, q1, q);
end // always at positive edge clocking changing

endmodule // test_EX2