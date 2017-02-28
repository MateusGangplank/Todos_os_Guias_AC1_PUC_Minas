/* -- Guia 09 --
 * -- Luhan Mairinck - Matricula: 446987 
 * -- Exercicio 01
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

module test_EX1;

wire q1, q2, q3, q4, q1not, q2not, q3not, q4not;
reg j, k, clk, clr;

jkff JKFF1 (q, qnot, j, k, q1not, clr);
jkff JKFF2 (q1, q1not, j, k, q2not, clr);
jkff JKFF3 (q2, q2not, j, k, q3not, clr);
jkff JKFF4 (q3, q3not, j, k, q4not, clr);
jkff JKFF5 (q4, q4not, j, k, clk, clr);



initial
begin
$display ("qnot q1not  q2not  q3not  q4not");
clr = 0;
clk = 1;
j = 1;
k = 1;
#100 $finish;

end // initial
always
#5 clk = ~clk;

initial
begin
#10 clr = 1;
#10 clr = 0;
 j = 1;
 k = 1;
end


always @ (posedge clk)
begin
$display ("%b     %b      %b      %b      %b", 
            qnot, q1not, q2not, q3not, q4not);
end // always at positive edge clocking changing

endmodule // test_EX1