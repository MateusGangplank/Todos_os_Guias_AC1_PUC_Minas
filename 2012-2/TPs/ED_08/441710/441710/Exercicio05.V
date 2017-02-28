//--===========================
//--Exercicio 05
//--Aluna: Thais Mairink
//--Matricula: 441710
//--===========================

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
wire p0,p1,p2,p3,p4,q0,q1,q2,q3,qn0,qn1,qn2,qn3,qn4;
reg clk,clear,load;
reg [4:0] y;

and AND0(p0,load,y[0]);
and AND1(p1,load,y[1]);
and AND2(p2,load,y[2]);
and AND3(p3,load,y[3]);
and AND4(p4,load,y[4]);

dff dff0(q0,qn0,0,clk,p0,0);
dff dff1(q1,qn1,q0,clk,p1,0);
dff dff2(q2,qn2,q1,clk,p2,0);
dff dff3(q3,qn3,q2,clk,p3,0);
dff dff4(q ,qn4,q3,clk,p4,0);

initial
begin 
$display ( "Aluno: Thais Mairink - 441710" );
$display ( "Time -Load - Y   - q1 - q2 - q3 - q"); 
clk = 1; 
load = 0; 
y = 4'b1101;
// input signal changing 
#10 load = 1; 
#10 load = 0; 
#60 $finish; 
end // initial 
always 
#5 clk = ~clk; 
always @( posedge clk ) 
begin 
$display ( "%4d   %b  %b   %b   %b   %b   %b", $time,load,y,q0,q1,q2,q3,q ); 
end // always at positive edge clocking changing 
endmodule //module test
