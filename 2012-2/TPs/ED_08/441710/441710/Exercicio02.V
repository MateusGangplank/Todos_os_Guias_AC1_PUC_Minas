//--===========================
//--Exercicio 02
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
wire q0,q1,q2,q3,qn0,qn1,qn2,qn3,qn4;
reg clk,x,preset,clear;

dff dff0(q0,qn0,q1,clk,x,0);
dff dff1(q1,qn1,q2,clk,x,0);
dff dff2(q2,qn2,q3,clk,x,0);
dff dff3(q3,qn3,q,clk,x,0);
dff dff4(q ,qn4,x,clk,x,0);

initial
begin 
$display ( "Aluno: Thais Mayrink - 441710" );
$display ( " Time X q0 q1 q2 q3 q"); 
clk = 1; 
x = 0;
// input signal changing 
#10 x = 1; 
#10 x = 0; 
#30 $finish; 
end // initial 
always 
#5 clk = ~clk; 
always @( posedge clk ) 
begin 
$display ( "%4d %b %b %b %b %b %b", $time, x,q0,q1,q2,q3,q ); 
end // always at positive edge clocking changing 
endmodule //module test