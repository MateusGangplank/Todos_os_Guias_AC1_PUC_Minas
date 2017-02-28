// ------------------------- 
// Guia 10 - Exercicio05
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

//--------------------------
//--- BUFFFER CONTROLADO
//--------------------------
module bc (output s, input dado, input en);
	reg s;
	always @ ( en )
	begin
		if (en)
			 s = dado;
		else
			 s = 1'bx;
	end
endmodule//bf


//--------------------------
//--- FLIP FLOP JK
//--------------------------

module jkff ( output q, output qnot, input j, input k, input clk ); 
	reg q, qnot; 
	always @( posedge clk ) 
	begin 
			if ( j & ~k ) 
				begin 
					q = 1; qnot = 0; 
				end 
			else if ( ~j & k ) 
				begin 
				q = 0; qnot = 1; 
				end 
			else 	if ( j & k ) 
				begin 
				q = ~q; qnot = ~qnot; 
				end 
	end 
endmodule //jkff ()

//--------------------------
//--- DESMULTIPLEXADOR (8 saidas com entrada de 3 bits)
//--------------------------
module demux (output [7:0]s, input [2:0] addres, input sinal);
	and AND0 (s[0], ~addres[2], ~addres[1], ~addres[0], sinal);
	and AND1 (s[1], ~addres[2], ~addres[1], addres[0], sinal);
	and AND2 (s[2], ~addres[2], addres[1], ~addres[0], sinal);
	and AND3 (s[3], ~addres[2], addres[1], addres[0], sinal);
	and AND4 (s[4], addres[2], ~addres[1], ~addres[0], sinal);
	and AND5 (s[5], addres[2], ~addres[1], addres[0], sinal);
	and AND6 (s[6], addres[2], addres[1], ~addres[0], sinal);
	and AND7 (s[7], addres[2], addres[1], addres[0], sinal);
endmodule//demux

//--------------------------
//--- MULTIPLEXADOR (8 entradas de 8 bits, 3 bits seletores)
//--------------------------
module mux (output [7:0] s, input [7:0] d0, input [7:0] d1, input [7:0] d2, input [7:0] d3, 
									 input [7:0] d4, input [7:0] d5, input [7:0] d6, input [7:0] d7, input [2:0] sel);

	wire notSel2, notSel1, notSel0;
	wire [7:0]s;
	wire [7:0]q0;
	wire [7:0]q1;
	wire [7:0]q2;
	wire [7:0]q3;
	wire [7:0]q4;
	wire [7:0]q5;
	wire [7:0]q6;	
	wire [7:0]q7;

	not NOT0 (notSel0, sel[0]);
	not NOT1 (notSel1, sel[1]);
	not NOT2 (notSel2, sel[2]);
	// -- 0 ~ 3
	and Q00 (q0 [0], notSel2, notSel1, notSel0, d0[0]);
	and Q01 (q0 [1], notSel2, notSel1, notSel0, d0[1]);
	and Q02 (q0 [2], notSel2, notSel1, notSel0, d0[2]);
	and Q03 (q0 [3], notSel2, notSel1, notSel0, d0[3]);
	and Q04 (q0 [4], notSel2, notSel1, notSel0, d0[4]);
	and Q05 (q0 [5], notSel2, notSel1, notSel0, d0[5]);
	and Q06 (q0 [6], notSel2, notSel1, notSel0, d0[6]);
	and Q07 (q0 [7], notSel2, notSel1, notSel0, d0[7]);
	
	and Q10 (q1 [0], notSel2, notSel1, sel[0], d1[0]);
	and Q11 (q1 [1], notSel2, notSel1, sel[0], d1[1]);
	and Q12 (q1 [2], notSel2, notSel1, sel[0], d1[2]);
	and Q13 (q1 [3], notSel2, notSel1, sel[0], d1[3]);
	and Q14 (q1 [4], notSel2, notSel1, sel[0], d1[4]);
	and Q15 (q1 [5], notSel2, notSel1, sel[0], d1[5]);
	and Q16 (q1 [6], notSel2, notSel1, sel[0], d1[6]);
	and Q17 (q1 [7], notSel2, notSel1, sel[0], d1[7]);

	and Q20 (q2 [0], notSel2, sel[1], notSel0, d2[0]);
	and Q21 (q2 [1], notSel2, sel[1], notSel0, d2[1]);
	and Q22 (q2 [2], notSel2, sel[1], notSel0, d2[2]);
	and Q23 (q2 [3], notSel2, sel[1], notSel0, d2[3]);
	and Q24 (q2 [4], notSel2, sel[1], notSel0, d2[4]);
	and Q25 (q2 [5], notSel2, sel[1], notSel0, d2[5]);
	and Q26 (q2 [6], notSel2, sel[1], notSel0, d2[6]);
	and Q27 (q2 [7], notSel2, sel[1], notSel0, d2[7]);

	and Q30 (q3 [0], notSel2, sel[1], sel[0], d3[0]);
	and Q31 (q3 [1], notSel2, sel[1], sel[0], d3[1]);
	and Q32 (q3 [2], notSel2, sel[1], sel[0], d3[2]);
	and Q33 (q3 [3], notSel2, sel[1], sel[0], d3[3]);
	and Q34 (q3 [4], notSel2, sel[1], sel[0], d3[4]);
	and Q35 (q3 [5], notSel2, sel[1], sel[0], d3[5]);
	and Q36 (q3 [6], notSel2, sel[1], sel[0], d3[6]);
	and Q37 (q3 [7], notSel2, sel[1], sel[0], d3[7]);

	//-- 4 ~ 7
	
	and Q40 (q4 [0], sel[2], notSel1, notSel0, d4[0]);
	and Q41 (q4 [1], sel[2], notSel1, notSel0, d4[1]);
	and Q42 (q4 [2], sel[2], notSel1, notSel0, d4[2]);
	and Q43 (q4 [3], sel[2], notSel1, notSel0, d4[3]);
	and Q44 (q4 [4], sel[2], notSel1, notSel0, d4[4]);
	and Q45 (q4 [5], sel[2], notSel1, notSel0, d4[5]);
	and Q46 (q4 [6], sel[2], notSel1, notSel0, d4[6]);
	and Q47 (q4 [7], sel[2], notSel1, notSel0, d4[7]);
	
	and Q50 (q5 [0], sel[2], notSel1, sel[0], d5[0]);
	and Q51 (q5 [1], sel[2], notSel1, sel[0], d5[1]);
	and Q52 (q5 [2], sel[2], notSel1, sel[0], d5[2]);
	and Q53 (q5 [3], sel[2], notSel1, sel[0], d5[3]);
	and Q54 (q5 [4], sel[2], notSel1, sel[0], d5[4]);
	and Q55 (q5 [5], sel[2], notSel1, sel[0], d5[5]);
	and Q56 (q5 [6], sel[2], notSel1, sel[0], d5[6]);
	and Q57 (q5 [7], sel[2], notSel1, sel[0], d5[7]);

	and Q60 (q6 [0], sel[2], sel[1], notSel0, d6[0]);
	and Q61 (q6 [1], sel[2], sel[1], notSel0, d6[1]);
	and Q62 (q6 [2], sel[2], sel[1], notSel0, d6[2]);
	and Q63 (q6 [3], sel[2], sel[1], notSel0, d6[3]);
	and Q64 (q6 [4], sel[2], sel[1], notSel0, d6[4]);
	and Q65 (q6 [5], sel[2], sel[1], notSel0, d6[5]);
	and Q66 (q6 [6], sel[2], sel[1], notSel0, d6[6]);
	and Q67 (q6 [7], sel[2], sel[1], notSel0, d6[7]);

	and Q70 (q7 [0], sel[2], sel[1], sel[0], d7[0]);
	and Q71 (q7 [1], sel[2], sel[1], sel[0], d7[1]);
	and Q72 (q7 [2], sel[2], sel[1], sel[0], d7[2]);
	and Q73 (q7 [3], sel[2], sel[1], sel[0], d7[3]);
	and Q74 (q7 [4], sel[2], sel[1], sel[0], d7[4]);
	and Q75 (q7 [5], sel[2], sel[1], sel[0], d7[5]);
	and Q76 (q7 [6], sel[2], sel[1], sel[0], d7[6]);
	and Q77 (q7 [7], sel[2], sel[1], sel[0], d7[7]);
	
	// -- OR dos valores finais
	
	or OR0 (s[0], q0[0], q1[0], q2[0], q3[0], q4[0], q5[0], q6[0], q7[0]);
	or OR1 (s[1], q0[1], q1[1], q2[1], q3[1], q4[1], q5[1], q6[1], q7[1]);
	or OR2 (s[2], q0[2], q1[2], q2[2], q3[2], q4[2], q5[2], q6[2], q7[2]);
	or OR3 (s[3], q0[3], q1[3], q2[3], q3[3], q4[3], q5[3], q6[3], q7[3]);
	or OR4 (s[4], q0[4], q1[4], q2[4], q3[4], q4[4], q5[4], q6[4], q7[4]);
	or OR5 (s[5], q0[5], q1[5], q2[5], q3[5], q4[5], q5[5], q6[5], q7[5]);
	or OR6 (s[6], q0[6], q1[6], q2[6], q3[6], q4[6], q5[6], q6[6], q7[6]);
	or OR7 (s[7], q0[7], q1[7], q2[7], q3[7], q4[7], q5[7], q6[7], q7[7]);
	
endmodule //mux

//--------------------------
//--- RAM 1X8
//--------------------------
module ram (output [7:0] s, input [7:0] dado, input clock, input rw, input addres );
	wire clk, rw_not, clock_not, outok, saidanot;
	wire [7:0] saidaf;
	wire [7:0] s;
	
	// -- PORTA QUE CRIA O CLOCK (CLK) DOS FLIP-FLOPS DE ARCORDO COM A EXISTENCIA DOS 3 SINAIS
	and AND1 (clk, clock, rw, addres);

	// -- PORTAS QUE POSSIBILITAM A SAIDA DO DADOS NA MEMORIA DE ACORDO COM A EXISTENCIA OU NAO DE 3 SINAIS
	not NOT1 (rw_not, rw);
	not NOT2 (clock_not, clock);
	
	and AND2 (outok, rw_not, clock_not, addres);
	
	// -- JOGAR DADOS NOS FLIP-FLOPS 
	jkff JKFF0 (saidaf[0], saidanot, dado[0], ~dado[0], clk); 
	jkff JKFF1 (saidaf[1], saidanot, dado[1], ~dado[1], clk); 
	jkff JKFF2 (saidaf[2], saidanot, dado[2], ~dado[2], clk); 
	jkff JKFF3 (saidaf[3], saidanot, dado[3], ~dado[3], clk); 
	jkff JKFF4 (saidaf[4], saidanot, dado[4], ~dado[4], clk); 
	jkff JKFF5 (saidaf[5], saidanot, dado[5], ~dado[5], clk); 
	jkff JKFF6 (saidaf[6], saidanot, dado[6], ~dado[6], clk); 
	jkff JKFF7 (saidaf[7], saidanot, dado[7], ~dado[7], clk); 
	
	bc BC0 (s[0], saidaf[0], outok);
	bc BC1 (s[1], saidaf[1], outok);
	bc BC2 (s[2], saidaf[2], outok);
	bc BC3 (s[3], saidaf[3], outok);
	bc BC4 (s[4], saidaf[4], outok);
	bc BC5 (s[5], saidaf[5], outok);
	bc BC6 (s[6], saidaf[6], outok);
	bc BC7 (s[7], saidaf[7], outok);
	
endmodule // ram

//--------------------------
//--- RAM 8X8
//--------------------------
module ram8x8 (output [7:0] s, input [7:0] dado, input clock, input rw, input [2:0]addres);

	wire [7:0] sel;
	
	wire [7:0] s0;
	wire [7:0] s1;
	wire [7:0] s2;
	wire [7:0] s3;
	wire [7:0] s4;
	wire [7:0] s5;
	wire [7:0] s6;
	wire [7:0] s7;
	
	demux DEMUX0 (sel, addres, 1'b1);
	
	ram RAM0 (s0, dado, clock, rw, sel[0]);
	ram RAM1 (s1, dado, clock, rw, sel[1]);
	ram RAM2 (s2, dado, clock, rw, sel[2]);
	ram RAM3 (s3, dado, clock, rw, sel[3]);
	ram RAM4 (s4, dado, clock, rw, sel[4]);
	ram RAM5 (s5, dado, clock, rw, sel[5]);
	ram RAM6 (s6, dado, clock, rw, sel[6]);
	ram RAM7 (s7, dado, clock, rw, sel[7]);
	
	mux MUX0 (s, s0, s1, s2, s3, s4, s5, s6, s7, addres);
	
endmodule //ram4x8

//--------------------------
//--- Exercicio05 (principal)
//--------------------------
module exercicio05;
	reg rw;
	reg [2:0] addres = 3'b000;
	reg [7:0] dado;
	wire [7:0] saida;
	wire clk;
	
	clock CLOCK1 (clk);
	ram8x8 RAM8x8a (saida, dado, clk, rw, addres);
	initial begin
		$display("Guia 10 - Exercicio 05");
		$display("CLK RW ADDRES DADO SAIDA");
		$monitor(" %1b   %1b   %1b    %8b  %8b", clk, rw, addres, dado, saida);
		#13 rw = 1; dado = 8'b01010101;
		#13 addres = 3'b001; dado = 8'b10101010;
		#13 addres = 3'b010; dado = 8'b00001111;
		#13 addres = 3'b011; dado = 8'b11110000;
		#13 addres = 3'b100; dado = 8'b11111111;
		#13 addres = 3'b101; dado = 8'b00000000;
		#13 addres = 3'b110; dado = 8'b10000001;
		#13 addres = 3'b111; dado = 8'b01111110;
		#13 rw = 0;
		#13 addres = 3'b000;
		#13 addres = 3'b001; 
		#13 addres = 3'b010; 
		#13 addres = 3'b011; 
		#13 addres = 3'b100; 
		#13 addres = 3'b101; 
		#13 addres = 3'b110; 
		#13 addres = 3'b111;
		#1 $finish;
	end
endmodule //exercicio05