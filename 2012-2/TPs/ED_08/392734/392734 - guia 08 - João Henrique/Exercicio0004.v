//------------------------------------------
//-- Exercicio 04
//-- Nome: Jo�o Henrique Mendes de Oliveira
//-- Matricula: 392734
//------------------------------------------

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
// -- FLIP FLOP 
// -------------------------
module dff ( output q, output qnot, input d, input clk );
	reg q, qnot;
	always @( posedge clk )
	begin
		q = d;
		qnot = ~q;
	end
endmodule // dff 

// -----------------------------------------------------------------------
// --  Registrador de deslocamento circular para a direita
// -----------------------------------------------------------------------
module rightrotateRegister (output [4:0]s, input d, input clk);
wire nots;
wire z;
   or o1 (z, s[0], d); 
	dff Fl0 (s[0], nots, s[1], clk);
	dff Fl1 (s[1], nots, s[2], clk);
	dff Fl2 (s[2], nots, s[3], clk);
	dff Fl3 (s[3], nots, s[4], clk);
	dff Fl4 (s[4], nots, z, clk);

endmodule//rightrotateRegister

// -------------------------
// -- Teste
// -------------------------

module teste;
wire [4:0] saida;
reg d;
wire clock; 
clock clk ( clock ); 
rightrotateRegister r1 (saida, d, clock);
	
	initial begin
		$display("D CLOCK SAIDA");
		d = 1;
		$monitor("%1b    %1b    %5b", d, clock, saida);
		#25 d = 0;
		#120 $finish;
	end

endmodule //teste