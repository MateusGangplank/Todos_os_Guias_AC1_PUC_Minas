// ------------------------- 
// -- Exercicio01
// -- Nome: Camila Guedes Silveira
// -- Matricula: 427393
// ------------------------- 


module jkff ( output q, output qnot, input j, input k, input clk ); 
	reg q, qnot; 
	always @( posedge clk ) 
	begin 
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

module umXum (output q, input add, input rw, input x, input clr, input clk);
	
	wire qnot, xnot;	
	not NOT01(xnot, x);
	 
	jkff c01 (q, qnot, x, xnot, clk);
	
endmodule

module umXdois(output q1, output q2, input add, input rw, input x1, input x2, input clr, input clk);
	umXum c02 (q1, add, rw, x1, clr, clk);
	umXum c01 (q2, add, rw, x2, clr, clk);
endmodule

module umXquatro(output q1, output q2, output q3, output q4, input add, input rw, input x1, input x2, input x3, input x4, input clr, input clk);
	umXdois c01 (q1, q2, add, rw, x1, x2, clr, clk);
	umXdois c02 (q3, q4, add, rw, x3, x4, clr, clk);
endmodule

module Exercicio01(output q1, output q2, output q3, output q4, output q5, output q6, output q7, output q8);
	reg x1, x2, x3, x4, x5, x6, x7, x8;
	reg clr;
	reg clk;
	reg rw;
	reg add;
	
	umXquatro c0 (q1, q2, q3, q4, add, rw, x1, x2, x3, x4, clr, clk);
	umXquatro c1 (q5, q6, q7, q8, add, rw, x5, x6, x7, x8, clr, clk);
		
	initial begin 
		$display ( "Guia 10 - Camila Guedes Silveira - 427393" );
		$display ( "Exercicio02" ); 

	end 
endmodule


