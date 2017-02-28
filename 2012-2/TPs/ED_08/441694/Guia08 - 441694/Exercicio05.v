 // -------------------------
// Exercicio05 
// Nome: Lucas Cardoso 
// Matricula: 441694 
// ------------------------- 
// ------------------------- 
// ------------------------- definir dados 

module dff ( output q, output qnot,input d, input clk, input preset,input clear ); 

reg q, qnot; 

always @( posedge clk )
if (clear)
begin 
q <= 0; qnot <= 1; 
end 
else
begin
	if(preset)
	begin 
	q <= 1; qnot <= 0; 
	end 
	else
	begin 
	q <= d; qnot <= ~d; 
	end 
end
 
endmodule // dff  

module test_d;
wire p1,p2,p3,p4,q1,q2,q3,qn1,qn2,qn3,qn4;
reg clk,clear,load;
reg [3:0] y;

and AND1(p1,load,y[0]);
and AND2(p2,load,y[1]);
and AND3(p3,load,y[2]);
and AND4(p4,load,y[3]);
                                        // definir em outro modulo
dff dff1(q1,qn1,0,clk,p1,0);
dff dff2(q2,qn2,q1,clk,p2,0);
dff dff3(q3,qn3,q2,clk,p3,0);
dff dff4(q ,qn4,q3,clk,p4,0);

// ------------------------- parte principal 
initial
begin 
$display ("Time-Load-Y-q1-q2-q3-q"); 
clk = 1; 
load = 0; 
y = 4'b1101;
// input signal changing 
#10 load = 1; 
#10 load = 0;
//#10 x = 0; 
//#10 x = 1; 
//#20 x = 1; 
//#10 x = 1; 
//#10 x = 1; 
//#10 x = 0; 
//#10 x = 1; 
#60 $finish; 
end // initial 
always 
#5 clk = ~clk; 
always @( posedge clk ) 
begin 
$display ( "%4d %b %b %b %b %b", $time,load,y,q1,q2,q3,q ); 
end // always at positive edge clocking changing 
endmodule //module test