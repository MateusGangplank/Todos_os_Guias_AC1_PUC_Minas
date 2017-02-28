// ------------------------- 
// Exercicio 05
// Nome: Gustavo Jota Resende
// Matricula: 427413
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
// --  Conversor Paralelo Serie
// -----------------------------------------------------------------------
module parallel (output [4:0]s, input d, input clk);
wire nots;
wire z0,z1,z2,z3,z4;
reg a,b,c,e,f; 
	dff Fl0 (s[0], nots, d, clk);
	dff Fl1 (s[1], nots, d, clk);
	dff Fl2 (s[2], nots, d, clk);
	dff Fl3 (s[3], nots, d, clk);
	dff Fl4 (s[4], nots, d, clk);
	and a1 (z0,a,d);
	and a2 (z1,b,d);
	and a3 (z2,c,d);
	and a4 (z3,e,d)
	and a5 (z4,f,d);

endmodule//parallel

// -------------------------
// -- Teste
// -------------------------

module teste;
wire [4:0] saida;
reg d;
wire clock; 
clock clk ( clock ); 
parallel p1 (saida, d, clock);
	
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
//	 -- 1    1    11111
//  -- 1    0    11111
// --  0    0    11111
// --  0    1    00000
// --  0    0    00000
// --  0    1    00000
// --  0    0    00000
// --  0    1    00000
// --  0    0    00000
// --  0    1    00000
// --  0    0    00000
// --  0    1    00000
// --  0    0    00000