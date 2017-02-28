// ------------------------- 
// -- Exercicio02
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

module Exercicio02(output a,output b,output c,output d);

	reg x;
	reg clk;
	reg pulse;
	output q,clock;
	
	tff A01(q,a,clk,x,b,x);
	tff A02(clock,b,clk,x,c,x);
	tff A03(clock,c,clk,x,d,x);
	tff A04(clock,d,clk,x,pulse,x);
	
	initial begin 
		$display ( "Guia 09 - Camila Guedes Silveira - 427393" );
		$display ( "Exercicio02" ); 
	
		 
		clk = 0; 
		x = 0; 
		pulse = 0; 

		$monitor( "%4d %4b", $time, d ); 

		#1 clk = 0; x = 0; pulse = 1; 
		#1 clk = 0; x = 1; pulse = 0;
		#1 clk = 0; x = 1; pulse = 1;
		#1 clk = 1; x = 0; pulse = 0;
		#1 clk = 1; x = 0; pulse = 1;
		#1 clk = 1; x = 1; pulse = 0;
		#1 clk = 1; x = 1; pulse = 1;
		#6 $finish;
	end 
endmodule