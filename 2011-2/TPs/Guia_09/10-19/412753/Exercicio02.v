// ------------------------- 
// Exercicio 02
// Nome: Luis Vasconcelos Dias
// Matricula: 412753
// -------------------------

//-----------------------------
// -- CLOCK
//-----------------------------
module clock ( clk );
	output clk;
	reg clk;
	initial begin
	   clk = 1'b0;
	end
	
	always begin
	   #12 clk = ~clk;
	end
endmodule // clock ( )



// -------------------------
// -- FLIP FLOP T
// -------------------------
module tff ( output q, output qnot, 
	input t, input clk, 
	input preset, input clear ); 
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
	
	// -----------------------------------------------------------------------
// --  Contador Assincrono Crescente
// -----------------------------------------------------------------------
module asscrescente (output [4:0]s, input t, input clk, input preset, input clear);
wire nots;

	tff Fl0 (s[0], nots, t, nots, preset, clear);
	tff Fl1 (s[1], nots, t, nots, preset, clear);
	tff Fl2 (s[2], nots, t, nots, preset, clear);
	tff Fl3 (s[3], nots, t, nots, preset, clear);
	tff Fl4 (s[4], nots, t, clk, preset, clear);

endmodule//leftRegist

// -------------------------
// -- Teste
// -------------------------

module teste;
reg clear, t, preset;
	wire clk;
	wire [4:0] saida;
	
	clock CLK1 (clk);
	asscrescente ASC1 (saida, t, clk, preset, clear);
	initial begin
		#1 clear = 0; t = 1; preset = 1;
		
		$display("T CLK SAIDA ");
		$monitor("%1b   %5b %1b  %1b   %1b", clk, saida, t, clear, preset);
		
		#24 clear = 1; preset = 0;
		#24 preset = 1;
		#960 $finish;
	end

endmodule //teste


