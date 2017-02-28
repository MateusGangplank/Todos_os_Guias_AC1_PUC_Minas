//------------------------------------------
//-- Exercicio 01
//-- Nome: Fernando Silva
//-- Matricula: 414506
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
// --  Registrador de deslocamento para a esquerda 
// -----------------------------------------------------------------------
module leftRegister (output [4:0]s, input d, input clk);
wire nots;

	dff Fl0 (s[0], nots, d, clk);
	dff Fl1 (s[1], nots, s[0], clk);
	dff Fl2 (s[2], nots, s[1], clk);
	dff Fl3 (s[3], nots, s[2], clk);
	dff Fl4 (s[4], nots, s[3], clk);

endmodule//leftRegist

// -------------------------
// -- Teste
// -------------------------

module teste;
wire [4:0] saida;
reg d;
wire clock; 
clock clk ( clock ); 
leftRegister l1 (saida, d, clock);
	
	initial begin
		$display("D CLOCK SAIDA");
		d = 1;
		$monitor("%1b    %1b    %5b", d, clock, saida);
		#25 d = 0;
		#120 $finish;
	end

endmodule //teste

//--Teste
//  -- D CLOCK SAIDA
//	 -- 1    0    xxxxx
//	 -- 1    1    xxxx1
//  -- 1    0    xxxx1
// --  0    0    xxxx1
// --  0    1    xxx10
// --  0    0    xxxx1
// --  0    1    xxx10
// --  0    1    xx100
// --  0    0    xx100
// --  0    1    x1000
// --  0    0    x1000
// --  0    1    10000
// --  0    0    10000
// --  0    1    00000
// --  0    0    00000