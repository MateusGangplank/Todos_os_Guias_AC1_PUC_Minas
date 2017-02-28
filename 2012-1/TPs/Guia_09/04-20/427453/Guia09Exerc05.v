// ------------------------- 
// Guia09Exerc05
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453 
// ------------------------- 

module tff ( output q, output qnot, 
input t, input clk, input clear ); 
reg q, qnot; 
always @( posedge clk ) 
begin 
if ( ~clear ) 
begin 
q = 0; qnot = ~q; 
end 
else 
begin 
if ( t ) 
begin 
q = ~q; qnot = ~q; 
end 
end 
end 
endmodule // tff 

module test; 
 reg pulse, clear; 
 wire  q[3:0], qn[3:0], a1,a2,a3,a4,a5,a6,a7,a8,a9; 
 

 tff tff1 (  q[0],  qn[0], pulse, pulse, a5 ); 
 tff tff2 (  q[1],  qn[1], qn[0], qn[0], a5 ); 
 tff tff3 (  q[2],  qn[2], qn[1], qn[1], a5 ); 
 tff tff4 (  q[3],  qn[3], qn[2], qn[2], a5 );
 
 not not1 (a1, q[3]);
 and and1 (a2, a1, q[2]);
 and and2 (a3, q[1], q[0]);
 and and3 (a4, a2, a3);
 or or1 (a5, a4, clear);
  
 
 initial 
  begin  
$display("Guia09Exerc05 - Pedro Henrique Vilar Locatelli - 427453"); 
// initial values 
pulse  = 0;
clear = 0;
 end
 
  initial begin 
   $monitor ( "%4d\t%1b\t%1b\t%1b%1b%1b%1b", $time, pulse, clear, q[0],q[1],q[2],q[3]); 
	#1 clear = 1;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 clear = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;

  end  
endmodule