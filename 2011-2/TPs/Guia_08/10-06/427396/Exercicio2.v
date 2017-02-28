// ------------------------- 
// Exercicio2
// Nome: Eduardo Manoel de Paula Junior
// Matricula: 427396
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
// -- FLIP FLOP D
// -------------------------
module dff ( output q, output qnot, input d, input clk );
	reg q, qnot;
	always @( posedge clk )
	begin
		q = d;
		qnot = ~q;
	end
endmodule // dff 

// --------------------------------------------------------------------------------------
// --  Registrador de deslocamento para a esquerda com carga inicial em 5 bits (est�gios) 
// --------------------------------------------------------------------------------------
module leftRegister (output [4:0]s, input d, input clk);
wire nots;
wire d1, d2, d3, d4;
	
	dff FF0 (s[0], nots, d, clk);

	or OR1 (d1, d, s[0]);
	dff FF1 (s[1], nots, d1, clk);

	or OR2 (d2, d, s[1]);
	dff FF2 (s[2], nots, d2, clk);

	or OR3 (d3, d, s[2]);
	dff FF3 (s[3], nots, d3, clk);

	or OR4 (d4, d, s[3]);
	dff FF4 (s[4], nots, d4, clk);
	
endmodule//leftRegister

// -------------------------
// -- Teste
// -------------------------

module teste;
wire [4:0] saida;
reg d;
wire clock; 
clock clk ( clock ); 
leftRegister LF1 (saida, d, clock);
	
	initial begin
		$display("D CLOCK SAIDA");
		d = 1;
		$monitor("%1b    %1b    %5b", d, clock, saida);
		#23 d = 0;
		#120 $finish;
	end

endmodule //teste
