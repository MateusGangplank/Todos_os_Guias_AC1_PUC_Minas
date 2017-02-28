//----------------------------------------------
//---Nome: Thaise Souto Martins - 395504
//---Guia 08
//----------------------------------------------
module dff ( output q, output qnot, input d, input clk ); 
reg q, qnot; 
always @( posedge clk ) 
begin 
q <= d; 
qnot <= ~q; 
end endmodule // dff 

module clock ( output clk ); 
reg clk; 
initial begin 
clk = 1'b0; 
end 
always 
begin 
#64 clk = ~clk; 
end 
endmodule // clock 

module Exercicio04;

wire a,b,c,d,e; 
wire q,q1;
wire qnot;
reg clock,data,clr;
reg carga;

or Or01(q1,a,data); 
   
dff D01(a,qnot,b,carga);
dff D02(b,qnot,c,clr);
dff D03(c,qnot,d,clr);
dff D04(d,qnot,e,clr);
dff D05(e,qnot,q1,clr);

initial begin 
$display ( "Guia 08 - Thaise Souto Martins - 395504" );
$display ( "Exercicio04 - Flip Flop" ); 

// initial values 
carga = 1;
clock = 0; 
clr = 0; 
data = 0; 

$monitor( "%4d %b%b%b%b%b", $time,a,b,c,d,e ); 

#1 clock = 0; clr = 0; data = 1; 
#1 clock = 0; clr = 1; data = 0;
#1 clock = 0; clr = 1; data = 1;
#1 clock = 1; clr = 0; data = 0;
#1 clock = 1; clr = 0; data = 1;
#1 clock = 1; clr = 1; data = 0;
#1 clock = 1; clr = 1; data = 1;
#6 $finish;
end 
endmodule