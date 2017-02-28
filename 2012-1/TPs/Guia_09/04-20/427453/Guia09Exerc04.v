// ------------------------- 
// Guia09Exerc04
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
		q <= 0; qnot <= ~q; 
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

module test; 
 reg pulse, clear, toggle; 
 wire  q[4:0], qn[4:0], a1,a2,a3,a4,a5,a6,a7,a8,a9; 
 

 jkff jkff5 (  q[4],  qn[4], toggle, toggle, pulse, a9 );  
 jkff jkff4 (  q[3],  qn[3], toggle, toggle, qn[4], a9 ); 
 jkff jkff3 (  q[2],  qn[2], toggle, toggle, qn[3], a9 ); 
 jkff jkff2 (  q[1],  qn[1], toggle, toggle, qn[2], a9 ); 
 jkff jkff1 (  q[0],  qn[0], toggle, toggle, qn[1], a9 );
 
 not not2 (a2, q[0]);
 nand nand1 (a3, a2, q[1]);
 not not3 (a4, q[2]);
 nand nand2 (a5, a4, q[3]);
 not not4 (a6, q[4]);
 nand nand3 (a7, a3, a5);
 nand nand4 (a8, a7, a6);
 nand nand5 (a9, clear, a8);
 
 
 initial 
  begin  
$display("Guia09Exerc04 - Pedro Henrique Vilar Locatelli - 427453"); 
// initial values 
pulse  = 0;
toggle = 0;
 end
 
  initial begin 
   $monitor ( "%4d\t%1b\t%1b\t%1b%1b%1b%1b%1b", $time, pulse, toggle, qn[0],qn[1],qn[2],qn[3],qn[4]); 
	#1 toggle = 1;
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