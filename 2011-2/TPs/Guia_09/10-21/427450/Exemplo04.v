//--------------------
// Exemplo 04
// Aluno: Patrick Flávio Teixeira Coura
// Matrícula: 427450
//---------------------

module clock ( clk ); 
	output clk; 
	reg clk; 
	initial begin 
		clk = 1'b0; 
	end 

always begin 
#12 clk = ~clk; 
end 
endmodule // clk 


module tff ( output q, output qnot, input t, input clk, input preset, input clear ); 
	
	reg q, qnot;
 
	always @( posedge clk ) 
	begin 
		if ( ~clear ) 
			begin 
				q = 0; qnot = ~q; 
	end 
		else 
			if ( ~preset ) 
				begin 
					q = 1; qnot = ~q; 
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


module ContadorDecadicoCre(output [3:0] sq, input t, input clk, input preset);

	wire [3:0] sqnot;
	wire clear, nt, a;
	not n1 (nt, t);

	and a1(a, ~sq[0], sq[1], ~sq[2], sq[3]);

	or or1(clear, a, nt);
	
	wire clk1 [3:0];
	or o0(clk1[0], clk, ~clear);
	or o1(clk1[1], sqnot[0], ~clear);
   or o2(clk1[2], sqnot[1], ~clear);
	or o3(clk1[3], sqnot[2], ~clear);

	
	tff t0 (sq[0], sqnot[0], t, clk1[0], preset, clear);
	tff t1 (sq[1], sqnot[1], t, clk1[1], preset, clear);
	tff t2 (sq[2], sqnot[2], t, clk1[2], preset, clear);
	tff t3 (sq[3], sqnot[3], t, clk1[3], preset, clear);
	
	
endmodule //Contador Decadico Decrescente

module Exemplo04;
	
	wire clk;
	wire [3:0] saida;
	reg t, preset;
	
	clock Clock3(clk);
	ContadorDecadicoCre cd1 (saida, t, clk, preset);
	initial begin
		#1 t = 0; preset = 0;
		
		$display("CLK   SAIDA   T");
		$monitor("%1b     %4b    %1b", clk, saida, t);
		
		#24 preset = 1; t=1;
		#268 $finish;
	end

endmodule //Exemplo04
