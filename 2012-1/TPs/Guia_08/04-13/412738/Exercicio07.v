//-------------------------------------------
// Exercicio 07 - Guia 08
// Nome: Felipe Tôrres
// Matricula: 412738
//-------------------------------------------

//-----------------------------------
// CLOCK
//-----------------------------------
module clock ( clk );
	output clk;
	reg clk;
	initial begin
	   clk = 1'b0;
	end
	
	always begin
	   #12 clk = ~clk;
	end
endmodule //------ clock ( )

//-----------------
// FLIP-FLOP d
//-----------------

module FlipFlopD(q,qnot,data,clk);
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
			
endmodule //--

//------------
//Right Shift
//------------
module rightShift (output [0:3]s, output [0:3]snot, input [0:3]data, input clk);
	wire w0,w1,w2,w3;
	
	or o0(w0,data[0],snot[3]);
	or o1(w1,data[1],s[0]);
	or o2(w2,data[2],s[1]);
	or o3(w3,data[3],s[2]);
	
	
	FlipFlopD d0(s[0],snot[0],w0,clk);
	FlipFlopD d1(s[1],snot[1],w1,clk);
	FlipFlopD d2(s[2],snot[2],w2,clk);
	FlipFlopD d3(s[3],snot[3],w3,clk);
	
	
endmodule //--rightShift

//-------------
//	Test Shift
//-------------
module testShift;

	reg [0:3]data;
	
	wire [0:3]s;
	wire [0:3]snot;
	wire clk;
	
	clock c1(clk);
	rightShift s1 (s,snot,data,clk);
	
	initial
		begin
			data = 4'b1111;
		end
	
	initial
		begin
		$display("Exercicio 07 - Felipe Tôrres - 412738");		
		$display("\t\t Clk    Data   Output");
		#13 data = 4'b0000;
		#264 $finish;
		end
		
	
	always @(posedge clk)
		begin
			$display("%d	%b  %b",$time,data,s);
		end

endmodule //--testShift