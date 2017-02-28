//----------------------------------------------
//---Nome: Luiz MArques de Oliveira
//---417138
//----------------------------------------------


module srff ( output q, output qnot, input s, input r, input clk ); 
reg q, qnot; 
always @( posedge clk ) 
begin 
if ( s & ~r ) 
begin 
q <= 1; 
qnot <= 0; 
end 
else if ( ~s & r ) 
begin
q <= 0; 
qnot <= 1; 
end 
else if ( s & r ) 
begin q <= 0; 
qnot <= 0; // arbitrary 
end 
end endmodule // srff 
 
 module Exercicio01;
 
 wire[4:0]a;
 wire[4:0]s;
 reg clk;
 reg x,y;
  
srff D01(a[0],s[0],y,x,clk);
srff D02(a[1],s[1],y,x,clk);
srff D03(a[2],s[2],y,x,clk);
srff D04(a[3],s[3],y,x,clk);
srff D05(a[4],s[4],y,x,clk);

initial begin 
$display ( "Guia 09" ); 
$display ( "Luiz Marques de Oliveira -417138" ); 
clk = 1; 
y = 1; 
x = 1; 

#10 x=0;y=0;
#10 x=1;y=0;
#10 x=1;y=1;

#5$finish; 
end  
always 
#5 clk = ~clk; 
always @( posedge clk ) 
begin 
$display ("%b  %b",a,s ); 
end
endmodule  