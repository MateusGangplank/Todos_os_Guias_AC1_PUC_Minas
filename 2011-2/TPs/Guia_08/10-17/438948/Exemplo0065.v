// Exemplo0065 - REGISTRADORES
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

// -------------------------
//	Paralel-Serial Conversor
// -------------------------
module conversor (output [0:4]state, output serial, input [0:4]data, input clk);
	wire w0,w1,w2,w3;
	wire [0:4]snot;
	
	or o1(w0,data[1],state[0]);
	or o2(w1,data[2],state[1]);
	or o3(w2,data[3],state[2]);
	or o4(w3,data[4],state[3]);
	
	dFlipFlop d0(state[0],snot[0],data[0],clk);
	dFlipFlop d1(state[1],snot[1],w0,clk);
	dFlipFlop d2(state[2],snot[2],w1,clk);
	dFlipFlop d3(state[3],snot[3],w2,clk);
	dFlipFlop d4(state[4],snot[4],w3,clk);
	
	assign serial = state[4];
	
endmodule //conversor

// ---------------
//	Test Conversor
// ---------------
module testConversor;

	reg [0:4]data;
	
	wire [0:4]s;
	wire serial;
	wire clk;
	
	clock clk1(clk);
	conversor c1 (s,serial,data,clk);
	
	initial
		begin
			data = 5'b10101;
		end
	
	initial
		begin
		
		$display("Conversor Paralel-Serial\nNome: Tiago Moreira\nMatricula: 438948");
		
		$display("\t\t Clk    Data   FFState	Output");
		#13 data = 5'b00000;
		#144 $finish;
		end
		
	
	always @(posedge clk)
		begin
			$display("%d	%b  %b	%b",$time,data,s,serial);
		end

endmodule //testShift

/* -- Documentacao complementar
 
 		Historico
 Nome						Data				Modificacao
 Exemplo0061			16/10/2011		Left Shift 5 bits - Carga apenas no primeiro estagio
 Exemplo0062			16/10/2011		Left Shift 5 bits - Carga em todos estagios
 Exemplo0063			16/10/2011		Right Shift 5 bits - Carga apenas no primeiro estagio
 Exemplo0064			16/10/2011		Left Shift Twisted Ring 5 bits - Carga apenas no primeiro estagio
 Exemplo0065			16/10/2011		Paralel-Serial Conversor 5 bits

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

 Exemplo0063
 	Clk    Data   Output
    12		 1   00000
	 36		 0   10000
	 60		 0   01000
	 84		 0   00100
	 108		 0   00010
	 132		 0   00001
	 156		 0   00000			

 Exemplo0064
 	Clk    Data   Output
    12		 1   00000
	 36		 0   00001
	 60		 0   00010
	 84		 0   00100
	 108		 0   01000
	 132		 0   10000
	 156		 0   00001

 Exemplo0065
 	Clk    Data   FFState	Output
    12	10101   00000		0
	 36	00000   10101		1
	 60	00000   01010		0
	 84	00000   00101		1
	 108	00000   00010		0
	 132	00000   00001		1
	 156	00000   00000		0
*/