// ------------------------- 
// Exercicio 04
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
// -- FLIP FLOP JK
// -------------------------
module jkff ( output q, output qnot, 
	input j, input k, input clk ); 
	reg q, qnot; 
	always @( posedge clk ) 
	begin 
	if ( j & ~k ) 
	begin 
	q <= 1; qnot <= 0; 
	end 
	else 
	if ( ~j & k ) 
	begin 
	q <= 0; qnot <= 1; 
	end 
	else 
	if ( j & k ) 
	begin 
	q <= ~q; qnot <= ~qnot; 
	end 
	end 
	endmodule // jkff 
	
	// -----------------------------------------------------------------------
// --  Memoria RAM 4x1. 
// -----------------------------------------------------------------------
module ram (output [7:0]s, input j, input k, input clk);
wire nots;

   reg in0, in1, in2, in3, in4, in5, in6, in7;
	and p (z1, 1, clk, 1);
	
	jkff Fl0 (f1, nots, k, in0, z1);
	jkff Fl1 (f2, nots, k, in1, z1);
	jkff Fl2 (f3, nots, k, in2, z1);
	jkff Fl3 (f4, nots, k, in3, z1);
	jkff Fl4 (f5, nots, k, in4, z1);
	jkff Fl5 (f6, nots, k, in5, z1);
	jkff Fl6 (f7, nots, k, in6, z1);
	jkff Fl7 (f8, nots, k, in7, z1);
	and a1 (s[0],1,f1);
	and a2 (s[1],1,f2);
	and a3 (s[2],1,f3);
	and a4 (s[3],1,f4);
	and a5 (s[4],1,f5);
	and a6 (s[5],1,f6);
	and a7 (s[6],1,f7);
	and a8 (s[7],1,f8);
	

endmodule//moduloram

// -------------------------
// -- Teste
// -------------------------

module teste;
reg  t, k;
	wire clk;
	wire [7:0] saida;
	
	clock CLK1 (clk);
	ram  RAM1 (saida, t, clk, k);
	initial begin
		#1  t = 1; k = 1;
		
		$display("RAM 1X8 ");
		$monitor("%1b   %8b  %1b   %1b", clk, saida, t, k);
		
		#24 t = 1; k = 0;
		#24 k = 1;
		#120 $finish;
	end

endmodule //teste

//--Teste
// -- D CLOCK SAIDA
//	-- 0   xxxxxxxx  1   1
//	-- 1   xxxxxxxx  1   1
// -- 0   xxxxxxxx  1   1
// --  0  xxxxxxxx  1   0
// --  1  xxxxxxxx  1   0
// --  0  xxxxxxxx  1   0
// --  0  xxxxxxxx  1   1
// --  1  xxxxxxxx  1   1
// --  0  xxxxxxxx  1   1
// --  1  xxxxxxxx  1   1
// --  0  xxxxxxxx  1   1
// --  1  xxxxxxxx  1   1
// --  0  xxxxxxxx  1   1
// --  1  xxxxxxxx  1   1
