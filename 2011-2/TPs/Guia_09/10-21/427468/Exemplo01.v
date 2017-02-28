//-------------------------------------------
// Exemplo01
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
module tff ( output q, output qnot, 
					input t, input clk, input preset, input clear ); 
reg q, qnot; 
	always @( posedge clk ) 
	begin 
		if ( ~clear ) 
	begin 
	q <= 0; qnot <= ~q; 
end 
	else 
		if ( ~preset ) 
	begin 
		q <= 1; qnot <= ~q; 
end 
	else 
	begin 
		if ( t ) 
	begin 
		q <= ~q; qnot <= ~q; 
		end 
	end 
end 

endmodule // tff

//-----------------------------------
//-- Contador Assincrono Decrescente
//-----------------------------------
module ContadorDecrescente(output[3:0]sq, input t, input clk, input preset, input clear);
wire sqnot;

tff t0(sq[0], sqnot, t, clk, preset, clear);
tff t1(sq[1], sqnot, t, sq[0], preset, clear);
tff t2(sq[2], sqnot, t, sq[1], preset, clear);
tff t3(sq[3], sqnot, t, sq[2], preset, clear);

endmodule //ContadorDecrescente

//-------------
//-- Exemplo01
//-------------
module Exemplo01;

wire clk;
wire [3:0] s;
reg clear, preset;
reg t;


clock Clock1(clk);
ContadorDecrescente c1(s, t, clk, preset, clear);

initial begin
#1 clear = 0; t =1; preset = 1;

		$display("CLK SAIDA T CLR");
		$monitor("%1b   %5b %1b  %1b", clk, s, t, clear);
		
		#24 clear = 1; preset = 0;
		#24 preset = 1;
		#100 $finish;
	end

endmodule //Exercicio01