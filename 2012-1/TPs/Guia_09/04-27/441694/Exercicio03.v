 // ------------------------- 
// Exercicio03
// Nome: Lucas Cardoso 
// Matricula: 441694 
// ------------------------- 
// ------------------------- 
// ------------------------- definir dados 

module jkff ( output q, output qnot,input j, input k, input clk,input preset);
 
reg q, qnot; 
always @( posedge clk ) 
begin
if(preset)
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

module test_JK;

wire q1,q2,q3,qn1,qn2,qn3,qn4,qn5,z,y;
reg clk,x;

and #50 AND1(z,q1,qn2,q3,qn4,q);
or OR1(y,z,~x);
jkff jkff1(q1,qn1,x,x,clk,y);
jkff jkff2(q2,qn2,x,x,qn1,y);
jkff jkff3(q3,qn3,x,x,qn2,y);
jkff jkff4(q4,qn4,x,x,qn3,y);
jkff jkff5(q ,qn5,x,x,qn4,y);

// ------------------------- parte principal 
initial
begin 
$display ( " Time X q q4 q3 q2 q1"); 
clk = 1; 
x = 0;
// input signal changing 
#10 x = 1;
//#10 x = 0; 
#10 x = 1; 
#20 x = 1; 
#10 x = 1; 
//#10 x = 1; 
//#10 x = 0; 
#10 x = 1; 
#30 $finish; 
end // initial 
always 
#5 clk = ~clk; 
always @( posedge clk ) 
begin 
$display ( "%4d %2b %2b %2b %2b %2b %2b", $time, x ,q, q4, q3,q2, q1); 
end // always at positive edge clocking changing 
endmodule //module test