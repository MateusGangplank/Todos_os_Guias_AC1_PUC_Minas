// Exemplo0062 - REGISTRADORES
// Nome: Tiago Moreira
// Matricula: 438948

//-------------
// D FLIP-FLOP
//-------------
`include "Clock.v"

module dFlipFlop(q,qnot,data,clk);
	output q;
	output qnot;
	input data;
	input clk;
	
	reg q,qnot;
	
	initial begin
		q = 1'b0;
		qnot = 1'b1;
	end
	always @ (posedge clk)
		begin
		q <= data;	qnot <= ~q;
		end
			
endmodule //dFlipFlop

// -----------
//	Left Shift
// -----------
module leftShift (output [0:4]s, output [0:4]snot, input [0:4]data, input clk);
	wire w0,w1,w2,w3;
	
	or o1(w0,data[0],s[1]);
	or o2(w1,data[1],s[2]);
	or o3(w2,data[2],s[3]);
	or o4(w3,data[3],s[4]);
	
	dFlipFlop d0(s[0],snot[0],w0,clk);
	dFlipFlop d1(s[1],snot[1],w1,clk);
	dFlipFlop d2(s[2],snot[2],w2,clk);
	dFlipFlop d3(s[3],snot[3],w3,clk);
	dFlipFlop d4(s[4],snot[4],data[4],clk);
	
endmodule //leftShift

// -----------
//	Test Shift
// -----------
module testShift;

	reg [0:4]data;
	
	wire [0:4]s;
	wire [0:4]snot;
	wire clk;
	
	clock c1(clk);
	leftShift s1 (s,snot,data,clk);
	
	initial
		begin
			data = 5'b10101;
		end
	
	initial
		begin
		
		$display("Left Shift\nNome: Tiago Moreira\nMatricula: 438948");
		
		$display("\t\t Clk    Data   Output");
		#13 data = 5'b00000;
		#144 $finish;
		end
		
	
	always @(posedge clk)
		begin
			$display("%d	%b  %b",$time,data,s);
		end

endmodule //testShift

/* -- Documentacao complementar
 
 		Historico
 Nome						Data				Modificacao
 Exemplo0061			16/10/2011		Left Shift 5 bits - Carga apenas no primeiro estagio
 Exemplo0062			16/10/2011		Left Shift 5 bits - Carga em todos estagios

			Testes e Resultados

 Exemplo0061
 	Clk    Data   Output
    12		 1   00000
	 36		 0   00001
	 60		 0   00010
	 84		 0   00100
	 108		 0   01000
	 132		 0   10000
	 156		 0   00000
	 
	 
 Exemplo0062
 	Clk    Data   Output
    12	10101   00000
	 36	00000   10101
	 60	00000   01010
	 84	00000   10100
	 108	00000   01000
	 132	00000   10000
	 156	00000   00000
			
*/