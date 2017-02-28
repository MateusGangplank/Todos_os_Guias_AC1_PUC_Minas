// ------------------------- 
// Guia09Exerc01
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453 
// ------------------------- 

module jkff ( output q, output qnot, 
input j, input k, input clk, input clear ); 
reg q, qnot; 
always @( posedge clk ) 
begin 
	if ( ~clear ) 
		begin 
		q = 0; qnot = ~q; 
		end 
	else 
		if ( j & ~k ) 
			begin 
			q = 1; qnot = 0; 
			end 
		else 
			if ( ~j & k ) 
				begin 
				q = 0; qnot = 1; 
				end 
			else 
				if ( j & k ) 
					begin 
					q = ~q; qnot = ~qnot; 
				end 
end 
endmodule // jkff 

module test; 
 reg pulse, clear, toggle; 
 wire  q[4:0], qn[4:0]; 

 jkff jkff5 (  q[4],  qn[4], toggle, toggle, pulse, clear );  
 jkff jkff4 (  q[3],  qn[3], toggle, toggle, qn[4], clear ); 
 jkff jkff3 (  q[2],  qn[2], toggle, toggle, qn[3], clear ); 
 jkff jkff2 (  q[1],  qn[1], toggle, toggle, qn[2], clear ); 
 jkff jkff1 (  q[0],  qn[0], toggle, toggle, qn[1], clear );
 
 initial 
  begin  
$display("Guia09Exerc01 - Pedro Henrique Vilar Locatelli - 427453"); 
// initial values 
clear  = 0; 
pulse  = 0;
toggle = 0;
 
   $monitor ( "%4d\t%1b\t%1b\t%1b\t%1b%1b%1b%1b%1b", $time, pulse, toggle, clear, qn[0],qn[1],qn[2],qn[3],qn[4]); 
	#1 clear = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 clear = 1;
	#1 toggle = 1;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;
	#1 pulse = 1;
	#1 pulse = 0;

  end  
endmodule