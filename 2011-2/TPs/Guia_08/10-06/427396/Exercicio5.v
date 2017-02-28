// ------------------------- 
// Exercicio5
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

// --------------------------------------------------------------------------------------------------
// --  Registrador de deslocamento circular, em anel torcido, para a esquerda, com 5 bits (estágios)
// --------------------------------------------------------------------------------------------------
module parallel_In (output [4:0]s, input [4:0]d, input load, input clk);
wire nots;	
wire [4:0]i;
wire [4:0]w;

	and AND0 (i[0], d[0], load);
	and AND1 (i[1], d[1], load);
	and AND2 (i[2], d[2], load);
	and AND3 (i[3], d[3], load);
	and AND4 (i[4], d[4], load);
	
	or OR0 (w[0], i[0], 1'b0);
	or OR1 (w[1], i[1], s[0]);
	or OR2 (w[2], i[2], s[1]);
	or OR3 (w[3], i[3], s[2]);
	or OR4 (w[4], i[4], s[3]);
	
	dff FF0 (s[0], nots, w[0], clk);
	dff FF1 (s[1], nots, w[1], clk);
	dff FF2 (s[2], nots, w[2], clk);
	dff FF3 (s[3], nots, w[3], clk);
	dff FF4 (s[4], nots, w[4], clk);
	
endmodule//leftRegister

// -------------------------
// -- Teste
// -------------------------

module teste;
wire [4:0] saida;
reg [4:0] d;
reg ld;

wire clock; 
clock clk ( clock ); 
parallel_In PI1 (saida, d, ld, clock);
	
	initial begin
		$display("  D    LD  CLOCK SAIDA");
		d = 5'b10101;
		ld = 1;
		$monitor("%1b  %1b     %1b   %5b", d, ld, clock, saida);
		#23 d = 5'b00000;
		    ld = 0;
		#240 $finish;
	end

endmodule //teste
