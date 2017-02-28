// ------------------------- 
// Guia 10 - Exercicio03
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
//--- DESMULTIPLEXADOR (4 saidas com entrada de 2 bits)
//--------------------------
module demux (output [3:0]s, input [1:0] addres, input sinal);
	and AND0 (s[0], ~addres[1], ~addres[0], sinal);
	and AND1 (s[1], ~addres[1], addres[0], sinal);
	and AND2 (s[2], addres[1], ~addres[0], sinal);
	and AND3 (s[3], addres[1], addres[0], sinal);
endmodule//demux

//--------------------------
//--- MULTIPLEXADOR (4 entradas de 8 bits, 2 bits seletores)
//--------------------------
module mux (output [7:0] s, input [7:0] d0, input [7:0] d1, input [7:0] d2, input [7:0] d3, input [1:0] sel);

	wire notSel1, notSel0;
	wire [7:0]s;
	wire [7:0]q0;
	wire [7:0]q1;
	wire [7:0]q2;
	wire [7:0]q3;
	
	not NOT0 (notSel0, sel[0]);
	not NOT1 (notSel1, sel[1]);
	
	and Q00 (q0 [0], notSel1, notSel0, d0[0]);
	and Q01 (q0 [1], notSel1, notSel0, d0[1]);
	and Q02 (q0 [2], notSel1, notSel0, d0[2]);
	and Q03 (q0 [3], notSel1, notSel0, d0[3]);
	and Q04 (q0 [4], notSel1, notSel0, d0[4]);
	and Q05 (q0 [5], notSel1, notSel0, d0[5]);
	and Q06 (q0 [6], notSel1, notSel0, d0[6]);
	and Q07 (q0 [7], notSel1, notSel0, d0[7]);
	
	and Q10 (q1 [0], notSel1, sel[0], d1[0]);
	and Q11 (q1 [1], notSel1, sel[0], d1[1]);
	and Q12 (q1 [2], notSel1, sel[0], d1[2]);
	and Q13 (q1 [3], notSel1, sel[0], d1[3]);
	and Q14 (q1 [4], notSel1, sel[0], d1[4]);
	and Q15 (q1 [5], notSel1, sel[0], d1[5]);
	and Q16 (q1 [6], notSel1, sel[0], d1[6]);
	and Q17 (q1 [7], notSel1, sel[0], d1[7]);

	and Q20 (q2 [0], sel[1], notSel0, d2[0]);
	and Q21 (q2 [1], sel[1], notSel0, d2[1]);
	and Q22 (q2 [2], sel[1], notSel0, d2[2]);
	and Q23 (q2 [3], sel[1], notSel0, d2[3]);
	and Q24 (q2 [4], sel[1], notSel0, d2[4]);
	and Q25 (q2 [5], sel[1], notSel0, d2[5]);
	and Q26 (q2 [6], sel[1], notSel0, d2[6]);
	and Q27 (q2 [7], sel[1], notSel0, d2[7]);

	and Q30 (q3 [0], sel[1], sel[0], d3[0]);
	and Q31 (q3 [1], sel[1], sel[0], d3[1]);
	and Q32 (q3 [2], sel[1], sel[0], d3[2]);
	and Q33 (q3 [3], sel[1], sel[0], d3[3]);
	and Q34 (q3 [4], sel[1], sel[0], d3[4]);
	and Q35 (q3 [5], sel[1], sel[0], d3[5]);
	and Q36 (q3 [6], sel[1], sel[0], d3[6]);
	and Q37 (q3 [7], sel[1], sel[0], d3[7]);

	or OR0 (s[0], q0[0], q1[0], q2[0], q3[0]);
	or OR1 (s[1], q0[1], q1[1], q2[1], q3[1]);
	or OR2 (s[2], q0[2], q1[2], q2[2], q3[2]);
	or OR3 (s[3], q0[3], q1[3], q2[3], q3[3]);
	or OR4 (s[4], q0[4], q1[4], q2[4], q3[4]);
	or OR5 (s[5], q0[5], q1[5], q2[5], q3[5]);
	or OR6 (s[6], q0[6], q1[6], q2[6], q3[6]);
	or OR7 (s[7], q0[7], q1[7], q2[7], q3[7]);
	
endmodule //mux

//--------------------------
//--- RAM 1X4
//--------------------------
module ram (output [3:0] s, input [3:0] dado, input clock, input rw, input addres );
	wire clk, rw_not, clock_not, outok, saidanot;
	wire [3:0] saidaf;
	wire [3:0] s;
	
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
	
	bc BC0 (s[0], saidaf[0], outok);
	bc BC1 (s[1], saidaf[1], outok);
	bc BC2 (s[2], saidaf[2], outok);
	bc BC3 (s[3], saidaf[3], outok);
	
	
endmodule // ram

//--------------------------
//--- RAM 1X8
//--------------------------
module ram1x8 (output [7:0] s, input [7:0] dado, input clock, input rw, input addres);

	ram RAM30 (s[3:0], dado[3:0], clock, rw, addres);
	ram RAM74 (s[7:4], dado[7:4], clock, rw, addres);

endmodule //ram1x8

//--------------------------
//--- RAM 4X8
//--------------------------
module ram4x8 (output [7:0] s, input [7:0] dado, input clock, input rw, input [1:0]addres);

	wire [3:0] sel;
	wire [7:0] s0;
	wire [7:0] s1;
	wire [7:0] s2;
	wire [7:0] s3;
	
	demux DEMUX0 (sel, addres, 1'b1);
	
	ram1x8 RAM0 (s0, dado, clock, rw, sel[0]);
	ram1x8 RAM1 (s1, dado, clock, rw, sel[1]);
	ram1x8 RAM2 (s2, dado, clock, rw, sel[2]);
	ram1x8 RAM3 (s3, dado, clock, rw, sel[3]);
	
	mux MUX0 (s, s0, s1, s2, s3, addres);
	
endmodule //ram4x8

//--------------------------
//--- Exercicio03 (principal)
//--------------------------
module exercicio03;
	
	reg [7:0] dado = 8'b01010101;
	reg [1:0] add = 2'b00;
	reg rw = 1'b1;
	wire [7:0] s ;
	
	wire clk;
	
	clock CLK0 ( clk );
	
	ram4x8 RAM0 (s, dado, clk, rw, add);

	initial begin
		$display("CLK RW ADDRES DADO SAIDA");
		$monitor(" %1b   %1b   %2b    %8b  %8b", clk, rw, add, dado, s);
		#13 add = 2'b01; dado = 8'b10101010;
		#13 add = 2'b10; dado = 8'b11111111;
		#13 add = 2'b11; dado = 8'b00000000;
		#13 rw = 0;
		#13 add = 2'b10;
		#13 add = 2'b01;
		#13 add = 2'b00;
		#12 $finish;
	end

endmodule //exercicio03