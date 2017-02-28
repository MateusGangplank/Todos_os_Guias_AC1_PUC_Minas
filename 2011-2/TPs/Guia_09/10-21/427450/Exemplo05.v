//--------------------
// Exemplo 05
// Aluno: Patrick Flávio Teixeira Coura
// Matrícula: 427450
//---------------------

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

module Contador6 (output [2:0] s, input clk, input clear);

	wire qnot0, qnot1, qnot2, a, c;

	and AND1 (a, ~s[0], s[1], s[2]);

	or OR1 (c, clear, a);

		  
	wire clk0, clk1, clk2;
	or OR1 (clk0, c, clk);
	or OR2 (clk1, c, qnot0);
	or OR3 (clk2, c, qnot1);

	jkff JK1 (s[0], qnot0, clk0, clk0, clk0, c);
	jkff JK2 (s[1], qnot1, clk1, clk1, clk1, c);
	jkff JK3 (s[2], qnot2, clk2, clk2, clk2, c);

endmodule //Contador6

module Exercicio5;
	reg clear;
	wire clk;
	wire [2:0] saida;
	
	clock clock1 (clk);
	Contador6 C6 (saida, clk, clear);
	initial begin
		#1 clear = 1;
		
		$display("CLK   SAIDA   CLEAR");
		$monitor("%1b      %3b      %1b", clk, saida, clear);
		
		#10 clear = 0;
		#100 $finish;
	end

endmodule //Exercicio5