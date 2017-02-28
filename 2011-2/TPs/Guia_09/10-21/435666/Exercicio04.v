// ------------------------- 
// Exercicio 04
// Nome: Julio Machado
// Matricula: 435666
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
// --  Contador Dec�dico Crescente. 
// -----------------------------------------------------------------------
module deccrescente (output [4:0]s, input t, input clk, input preset, input clear);
wire nots;

   
	not n2 (z2,nots);
	and a1 (z4,nots,z2);
	and a2 (z1,clear,z4);
	tff Fl0 (s[0], nots, t, clk, preset, z1);
	tff Fl1 (s[1], nots, t, s[0], preset, z1);
	tff Fl2 (s[2], nots, t, s[1], preset, z1);
	tff Fl3 (s[3], nots, t, s[2], preset, z1);
	tff Fl4 (s[4], nots, t, s[3], preset, z1);

endmodule//leftRegist

// -------------------------
// -- Teste
// -------------------------

module teste;
reg clear, t, preset;
	wire clk;
	wire [4:0] saida;
	
	clock CLK1 (clk);
	deccrescente  ASC1 (saida, t, clk, preset, clear);
	initial begin
		#1 clear = 0; t = 1; preset = 1;
		
		$display("T CLK SAIDA ");
		$monitor("%1b   %5b %1b  %1b   %1b", clk, saida, t, clear, preset);
		
		#24 clear = 1; preset = 0;
		#24 preset = 1;
		#960 $finish;
	end

endmodule //teste

