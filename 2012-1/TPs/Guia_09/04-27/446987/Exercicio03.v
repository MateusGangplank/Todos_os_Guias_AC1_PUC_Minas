/* -- Guia 09 --
 * -- Luhan Mairinck - Matricula: 446987 
 * -- Exercicio 03
 */ 


module jkff ( output q, output qnot, 
input j, input k, input clk , input preset); 

reg q, qnot; 

always @( posedge clk ) 
begin
 if ( preset )
 begin
  q <= preset; qnot <= ~preset;
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

wire q1, q2, q3, q4, q1not, q2not, q3not, q4not, w, z, preset;
reg x, clk;

and AND1 (z, q, q1not, q2, q3not, q4);
not NOT1 (w, x);
or OR1 (preset, w, z);
jkff JKFF1 (q, qnot, x, x, clk, preset);
jkff JKFF2 (q1, q1not, x, x, q, preset);
jkff JKFF3 (q2, q2not, x, x, q1, preset);
jkff JKFF4 (q3, q3not, x, x, q2, preset);
jkff JKFF5 (q4, q4not, x, x, q3, preset);


initial
begin
$display ("Time  q4 q3 q2 q1 q");
clk = 1;
x = 0;
#10 x = 1;
#10 x = 0;
#10 x = 1;
#50 $finish;

end // initial
always
#5 clk = ~clk;

always @ (posedge clk)
begin
$display (" %2d   %b  %b  %b  %b  %b", 
            $time, q4, q3, q2, q1, q);
end // always at positive edge clocking changing

endmodule // test_EX2