// Exemplo0073 - CONTADORES
// Nome: Tiago Moreira
// Matricula: 438948

//-------------
// T FLIP-FLOP
//-------------
`include "Clock.v"

module tFlipFlop(q,qnot,toggle,clk,preset,clear);
	output q;
	output qnot;
	input toggle;
	input clk;
	input preset;
	input clear;
	
	reg q,qnot;
	
	initial begin
		q = 1'b0;
		qnot = 1'b1;
	end
	
	always @ (posedge clk)
		begin
			if (clear)
				begin
					q <= 0;	qnot <= 1;
				end
			else if (preset)
				begin
					q <= 1;	qnot <= 0;
				end
			else if (toggle)
				begin
					q <= ~q;	qnot <= q;
				end
		end
	
	always @(posedge clear)
		begin
			q <= 0; qnot <= 1;
		end
					
endmodule //tFlipFlop

// ---------------
//	Decade counter
// ---------------
module counter (output [0:3]s, input clk);
	wire [0:3]w;
	wire aux;
	wire clr;
	reg pulse,t,clear,preset;
	
	initial begin
		t = 1'b1;
		clear = 1'b1;
		preset = 1'b0;
		
		#1 clear = 1'b0;
	end
	
	tFlipFlop t0(w[0],s[0],t,s[1],preset,clr);
	tFlipFlop t1(w[1],s[1],t,s[2],preset,clr);
	tFlipFlop t2(w[2],s[2],t,s[3],preset,clr);
	tFlipFlop t3(w[3],s[3],t,pulse,preset,clr);
	
	and and1(aux,w[0],s[1],w[2],s[3]);
	or o1(clr,aux,clear);
	
	always @(posedge clk)
		begin
			pulse = 1'b1;
		end
	
	always @(negedge clk)
		begin
			pulse = 1'b0;
		end
		
endmodule //counter

// -------------
//	Test Counter
// -------------
module testCounter;

	wire [0:3]s;
	wire clk;
	
	clock c1(clk);
	counter co1 (s,clk);
	
	initial
		begin
		
		$display("Decade Counter(Down)\nNome: Tiago Moreira\nMatricula: 438948");
		
		$display("\t\t Clk    Output");
		#144 $finish;
		end
		
	
	always @(posedge clk)
		begin
			$display("%d	%b",$time,s);
		end

endmodule //testCounter

/* -- Documentacao complementar
 
 		Historico
 Nome						Data				Modificacao
 Exemplo0071			19/10/2011		Assychronous counter(down) 4 bits
 Exemplo0072			19/10/2011		Assychronous counter(up) 4 bits
 Exemplo0073			21/10/2011		Decade counter(down) 4 bits

			Testes e Resultados

 Exemplo0071
 	Clk	Output
	  4	1111
    12   1110
	 20   1101
	 28   1100
	 36   1011
	 44  	1010
	 52  	1001
	 60  	1000
	 68	0111
	 76	0110
	 84	0101
	 92	0100
	 100	0011
	 108	0010
	 116	0001
	 124	0000
	 132	1111
	 140	1110

 Exemplo0072
 	Clk	Output
	  4	0000
    12   0001
	 20   0010
	 28   0011
	 36   0100
	 44  	0101
	 52  	0110
	 60  	0111
	 68	1000
	 76	1001
	 84	1010
	 92	1011
	 100	1100
	 108	1101
	 116	1110
	 124	1111
	 132	0000
	 140	0001

 Exemplo0073
 	Clk	Output
	  4	1111
    12   1110
	 20   1101
	 28   1100
	 36   1011
	 44  	1010
	 52  	1001
	 60  	1000
	 68	0111
	 76	0110
	 84	1111
	 92	1110
	 100	1101
	 108	1100
	 116	1011
	 124	1010
	 132	1001
	 140	1000

*/