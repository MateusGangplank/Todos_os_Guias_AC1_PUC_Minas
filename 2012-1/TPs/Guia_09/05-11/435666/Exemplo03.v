//-------------------------------------------
// Exemplo03
// Aluno: Úrsula Rosa Monteiro de Castro
// Matricula: 427468
//-------------------------------------------

//----------
//-- Clock
//----------
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

//---------------
//-- Flip Flop T
//---------------
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

//-----------------------------------
//-- Contador Decadico Decrescente
//-----------------------------------
module ContadorDecadicoDecre(output [3:0] sq, input t, input clk, input preset);
wire [3:0] sqnot;
wire clear, nt, a;
not n1(nt, t);

and a1(a, sqnot[0], ~sqnot[1], ~sqnot[2], sqnot[3]);

nor n1(clear, a, nt);

wire[2:0] clk1;

xor x1(clk1[0], sq[0], ~clear);
xor x2(clk1[1], sq[1], ~clear);
xor x3(clk1[2], sq[2], ~clear);

tff t0(sq[0], sqnot[0], t, clk, preset, clear);
tff t1(sq[1], sqnot[1], t, clk1[0], preset, clear);
tff t2(sq[2], sqnot[2], t, clk1[1], preset, clear);
tff t3(sq[3], sqnot[3], t, clk1[2], preset, clear);

endmodule //Contador Decadido Decrescente

//-------------
//-- Exemplo03
//-------------
module Exemplo03;
	
	wire clk;
	wire [3:0] s;
	reg t, preset;	
	
	clock Clock2 (clk);
	ContadorDecadicoDecre cd1(s, t, clk, preset);
	initial begin
		#1 t = 1; preset = 0;
		
		$display("CLK SAIDA T");
		$monitor("%1b   %4b  %1b", clk, s, t);
		
		#24 preset = 1;
		#220 $finish;
	end

endmodule //Exercicio03