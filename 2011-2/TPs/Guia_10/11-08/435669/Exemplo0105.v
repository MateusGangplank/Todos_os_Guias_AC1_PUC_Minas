/*
---------------------------------------
PUC-Minas - Ciência da Computação 
ARQ1 – Guia 09 
Período: 03-07/10/2011 
--------------------------------------------------------
Tema: Introdução à linguagem Verilog 
Atividade: Circuitos sequenciais – Memórias 
Todos os circuitos deverão ser simulados no Logisim. 

Nome: Mateus Augusto Moraes Ferreira   Matricula: 435669
--------------------------------------------------------
05.) Projetar e descrever em Verilog e Logisim um módulo 
para implementar uma memória RAM 8x8 
(1 endereço para 8 bits) 
usando memórias RAM 1x8 do modelo acima (04). 
--------------------------------------------------------
*/

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
	
	// --------------------
// --  Memoria RAM 4x1. 
// -----------------------
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

// ----------------------
// --  Memoria RAM 8x8. 
// ----------------------
module ram2 (output [63:0]s, input j, input k, input clk);
wire nots;

wire [7:0]r1;
wire [7:0]r2;
wire [7:0]r3;
wire [7:0]r4;
wire [7:0]r5;
wire [7:0]r6;
wire [7:0]r7;
wire [7:0]r8;

 
	
	ram R1 (r1, j, k , clk);
	ram R2 (r2, j, k , clk);
	ram R3 (r3, j, k , clk);
	ram R4 (r4, j, k , clk);
	ram R5 (r5, j, k , clk);
	ram R6 (r6, j, k , clk);
	ram R7 (r7, j, k , clk);
	ram R8 (r8, j, k , clk);
	
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
	assign s[32] = r5[0];
	assign s[33] = r5[1];
	assign s[34] = r5[2];
	assign s[35] = r5[3];
	assign s[36] = r5[4];
	assign s[37] = r5[5];
	assign s[38] = r5[6];
	assign s[39] = r5[7];
	assign s[40] = r6[0];
	assign s[41] = r6[1];
	assign s[42] = r6[2];
	assign s[43] = r6[3];
	assign s[44] = r6[4];
	assign s[45] = r6[5];
	assign s[46] = r6[6];
	assign s[47] = r6[7];
	assign s[48] = r7[0];
	assign s[49] = r7[1];
	assign s[50] = r7[2];
	assign s[51] = r7[3];
	assign s[52] = r7[4];
	assign s[53] = r7[5];
	assign s[54] = r7[6];
	assign s[55] = r7[7];
	assign s[56] = r8[0];
	assign s[57] = r8[1];
	assign s[58] = r8[2];
	assign s[59] = r8[3];
	assign s[60] = r8[4];
	assign s[61] = r8[5];
	assign s[62] = r8[6];
	assign s[63] = r8[7];
	

endmodule//moduloram2

// -----------
// -- Teste
// -----------

module teste;
reg  t, k;
	wire clk;
	wire [63:0] saida;
	
	clock CLK1 (clk);
	ram2  RAM1 (saida, t, clk, k);
	initial begin
		#1  t = 1; k = 1;
		
		$display("Mateus Augusto Moraes Ferreira   Matricula:435669");
		$display("");
		$display("RAM 1X8 ");
		$monitor("%1b   %63b  %1b   %1b", clk, saida, t, k);
		
		#24 t = 1; k = 0;
		#24 k = 1;
		#120 $finish;
	end

endmodule // Exemplo0105