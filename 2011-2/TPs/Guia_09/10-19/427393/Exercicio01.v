// -------------------------
// -- Exercicio01
// -- Nome: Camila Guedes Silveira
// -- Matricula: 427393
// ------------------------- 


module tff ( output q, output qnot, input t, input clk, input clear, input preset ); 
	reg q, qnot; 

	always @( posedge clk ) 
	begin 
		if ( ~clear ) 
		begin 
			q <= 0; 
			qnot <= ~q;
		end 
		
		else 
		if ( ~preset ) 
		begin 
			q <= 1; 
			qnot <= ~q; 
		end 
	
		else 
		begin 
			if ( t ) 
			begin 
				q <= ~q; 
				qnot <= ~q; 
			end 
		end 
	end 
endmodule // tff 

module Exercicio01(output a,output b,output c,output d, output e);
	reg x;
	reg clr;
	reg clk;
	reg pulse;
	output q;
	
	wire s, r;
	assign s = a * b * c * d * e;
	assign r = s | clr;
	
	
	tff c0 (a, q5, pulse, q3, r, x);
	tff c1 (b, q4, pulse, q3, r, x);
	tff c2 (c , q3, pulse, q2, r, x);
	tff c3 (d, q2, pulse, q1, r, x);
	tff c4 (e, q1, pulse, clk, r, x);
	
	initial begin 
		$display ( "Guia 09 - Camila Guedes Silveira - 427393" );
		$display ( "Exercicio01" ); 

		 
		clk = 0; 
		x = 0; 
		pulse = 0; 
		 
	
		$monitor( "%4d %b%b%b%b%b", $time, e, d, c, b, a ); 
/*
		#1 pulse = 1;
		#1 pulse = 0;
		#1 pulse = 1;
*/
		#1 clk=1; pulse = 1;
		#1 clk=0; pulse = 1;
		#1 clk=1; pulse = 1;
		#1 clk=0; pulse = 0;
		#1 clk=1; pulse = 0;
		#1 clk=0; pulse = 0;
		#1 clk=1; pulse = 1;
		#1 clk=0; pulse = 1;
		#1 clk=1; pulse = 1;

		#20 $finish;
	end 
endmodule


