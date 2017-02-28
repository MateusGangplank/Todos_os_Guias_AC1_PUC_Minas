// ------------------------- 
// Exercicio 03
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
module ram (output [3:0]s, input j, input k, input clk);
wire nots;

   reg in0, in1, in2, in3, in4;
	and p (z1, 1, clk, 1);
	
	jkff Fl0 (f1, nots, k, in0, z1);
	jkff Fl1 (f2, nots, k, in1, z1);
	jkff Fl2 (f3, nots, k, in2, z1);
	jkff Fl3 (f4, nots, k, in3, z1);
	and a1 (s[0],1,f1);
	and a2 (s[1],1,f2);
	and a3 (s[2],1,f3);
	and a4 (s[3],1,f4);

endmodule//moduloram

// -----------------------------------------------------------------------
// --  Memoria RAM 8x1. 
// -----------------------------------------------------------------------
module ram2 (output [7:0]s, input j, input k, input clk);
wire nots;
wire [3:0]r1;
wire [3:0]r2;

	
	ram R1 (r1, j, k , clk);
	ram R2 (r2, j, k , clk);
	
	assign s[0] = r1[0];
	assign s[1] = r1[1];
	assign s[2] = r1[2];
	assign s[3] = r1[3];
	assign s[4] = r2[0];
	assign s[5] = r2[1];
	assign s[6] = r2[2];
	assign s[7] = r2[3];
	

endmodule//moduloram2

// -----------------------------------------------------------------------
// --  Memoria RAM 4x8. 
// -----------------------------------------------------------------------
module ram3 (output [31:0]s, input j, input k, input clk);
wire nots;
wire [7:0]r1;
wire [7:0]r2;
wire [7:0]r3;
wire [7:0]r4;

	
	ram2 R1 (r1, j, k , clk);
	ram2 R2 (r2, j, k , clk);
	ram2 R3 (r1, j, k , clk);
	ram2 R4 (r2, j, k , clk);
	
	assign s[0] = r1[0];
	assign s[1] = r1[1];
	assign s[2] = r1[2];
	assign s[3] = r1[3];
	assign s[4] = r1[4];
	assign s[5] = r1[5];
	assign s[6] = r1[6];
	assign s[7] = r1[7];
	assign s[8] = r2[0];
	assign s[9] = r2[1];
	assign s[10] = r2[2];
	assign s[11] = r2[3];
	assign s[12] = r2[4];
	assign s[13] = r2[5];
	assign s[14] = r2[6];
	assign s[15] = r2[7];
	assign s[16] = r3[0];
	assign s[17] = r3[1];
	assign s[18] = r3[2];
	assign s[19] = r3[3];
	assign s[20] = r3[4];
	assign s[21] = r3[5];
	assign s[22] = r3[6];
	assign s[23] = r3[7];
	assign s[24] = r4[0];
	assign s[25] = r4[1];
	assign s[26] = r4[2];
	assign s[27] = r4[3];
	assign s[28] = r4[4];
	assign s[29] = r4[5];
	assign s[30] = r4[6];
	assign s[31] = r4[7];
	

endmodule//moduloram2

// -------------------------
// -- Teste
// -------------------------

module teste;
reg  t, k;
	wire clk;
	wire [31:0] saida;
	
	clock CLK1 (clk);
	ram3  RAM3 (saida, t, clk, k);
	initial begin
		#1  t = 1; k = 1;
		
		$display("RAM 4X8 ");
		$monitor("%1b   %31b  %1b   %1b", clk, saida, t, k);
		
		#24 t = 1; k = 0;
		#24 k = 1;
		#120 $finish;
	end

endmodule //teste

//--Teste
//  -- D CLOCK SAIDA
//	 -- 0   zzzzzzzzzzzzzzzzxxxxxxxxxxxxxxxx  1   1
//	 -- 1   zzzzzzzzzzzzzzzzxxxxxxxxxxxxxxxx  1   1
//  -- 0   zzzzzzzzzzzzzzzzxxxxxxxxxxxxxxxx  1   1
// --  0   zzzzzzzzzzzzzzzzxxxxxxxxxxxxxxxx  1   0
// --  1   zzzzzzzzzzzzzzzzxxxxxxxxxxxxxxxx  1   0
// --  0   zzzzzzzzzzzzzzzzxxxxxxxxxxxxxxxx  1   1
// --  0   zzzzzzzzzzzzzzzzxxxxxxxxxxxxxxxx  1   0
// --  1   zzzzzzzzzzzzzzzzxxxxxxxxxxxxxxxx  1   0
// --  0   zzzzzzzzzzzzzzzzxxxxxxxxxxxxxxxx  1   0
// --  1   zzzzzzzzzzzzzzzzxxxxxxxxxxxxxxxx  1   0
// --  0   zzzzzzzzzzzzzzzzxxxxxxxxxxxxxxxx  1   0
// --  1   zzzzzzzzzzzzzzzzxxxxxxxxxxxxxxxx  1   0
// --  0   zzzzzzzzzzzzzzzzxxxxxxxxxxxxxxxx  1   0
// --  1   zzzzzzzzzzzzzzzzxxxxxxxxxxxxxxxx  1   0
// --  0   zzzzzzzzzzzzzzzzxxxxxxxxxxxxxxxx  1   0
// --  1   zzzzzzzzzzzzzzzzxxxxxxxxxxxxxxxx  1   0
// --  0   zzzzzzzzzzzzzzzzxxxxxxxxxxxxxxxx  1   0