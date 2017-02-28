//-----------------
//Rafael Lopes Barbosa
//435052
//----------------

//-------
//--Clock
//-------
module clock ( clk );
	output clk;
	reg clk;
	initial begin
	   clk = 1'b0;
	end
	
	always begin
	   #12 clk = ~clk;
	end
endmodule // clock 

//---------------
//--Flip Flop JK
//---------------
module jkff ( output q, output qnot, input j, input k, input clk, input clear ); 
	reg q, qnot; 
	always @( posedge clk ) 
	begin 
		if( clear )
		   begin
			q = 0;
			qnot = ~q;
		   end
		else 
			begin
			if ( j & ~k ) //set
				begin 
				q = 1;
				qnot = 0; 
				end 
			else if ( ~j & k ) //reset
				begin 
				q = 0;
				qnot = 1; 
				end 
			else if ( j & k ) //toogle
				begin 
				q = ~q;
				qnot = ~qnot; 
				end 
		end
	end 
endmodule // jkff 

//-------------------
//--Contador Modulo 6
//-------------------
module Contador6(output [2:0] sq, input clk, input clear);

	wire [3:0] clk1;
	wire [2:0]sqnot;
	wire a,b;

	and a1 (a, ~sq[0], sq[1], sq[2]);

	or o1 (b, clear, a);
  
	
	or ORC0 (clk1[0], b, clk);
	or ORC1 (clk1[1], b, sqnot[0]);
	or ORC2 (clk1[2], b, sqnot[1]);

	jkff jk1 (sq[0], sqnot[0], clk1[0], clk1[0], clk1[0], b);
	jkff jk2 (sq[1], sqnot[1], clk1[1], clk1[1], clk1[1], b);
	jkff jk3 (sq[2], sqnot[2], clk1[2], clk1[2], clk1[2], b);
	
endmodule //ContadorModulo6

//-----------------
//--Exemplo05
//-----------------
module Exemplo05;
	reg clear;
	wire clk;
	wire [2:0] s;
	
	clock CLK1 (clk);
	Contador6 c(s, clk, clear);
	
	initial begin
		#1 clear = 1;
		
		$display("CLK   SAIDA");
		$monitor("%1b      %3b", clk, s);
		
		#10 clear = 0;
		#100 $finish;
	end

endmodule //Exemplo05