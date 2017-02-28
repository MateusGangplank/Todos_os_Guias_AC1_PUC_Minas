// -----------------------------
// Exercicio4
// Nome: Samuel Eusébio da Silva
// Matricula: 435055
// -----------------------------

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
	   #5 clk = ~clk;
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
// --  Registrador de deslocamento circular, em anel torcido, para a esquerda, com 4 bits
// --------------------------------------------------------------------------------------
module rotateLeftRegister (output [3:0]s, input d, input clk);
wire nots;	
	
	or OR1 (d0, d, s[3]);
	
	dff FF0 (s[0], nots, d0, clk);
	dff FF1 (s[1], nots, s[0], clk);
	dff FF2 (s[2], nots, s[1], clk);
	dff FF3 (s[3], nots, s[2], clk);
	
endmodule//rotateLeftRegister

// -------------------------
// -- Teste
// -------------------------

module teste;
wire [3:0] saida;
reg d;
wire clock; 
clock clk ( clock ); 
rotateLeftRegister RLF1 (saida, d, clock);
	
	initial begin
		$display("D CLOCK SAIDA");
		d = 1;
		$monitor("%1b    %1b    %4b", d, clock, saida);
		#23 d = 0;
		#240 $finish;
	end

endmodule //teste
