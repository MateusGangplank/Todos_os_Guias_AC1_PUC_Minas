// ------------------------- 
// Guia 09 - Exercicio5
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

// -------------------------
// -- FLIP FLOP JK
// -------------------------
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

// -------------------------
// -- Contador modulo 6
// -------------------------
module ContMod6 (output [2:0] s, input clk, input clear);

	wire qnot0, qnot1, qnot2, a, c;

	and AND1 (a, ~s[0], s[1], s[2]);

	or OR1 (c, clear, a);

	/* quandou houver o sinal de clear, o clock dos tres flip-flops
	   devem subir sincronizados para poderem ser zerados simultaneamente */
	  
	wire clk0, clk1, clk2;
	or ORC0 (clk0, c, clk);
	or ORC1 (clk1, c, qnot0);
	or ORC2 (clk2, c, qnot1);

	jkff JKFF0 (s[0], qnot0, clk0, clk0, clk0, c);
	jkff JKFF1 (s[1], qnot1, clk1, clk1, clk1, c);
	jkff JKFF2 (s[2], qnot2, clk2, clk2, clk2, c);

endmodule //ContMod6

// -------------------------
// -- Exercicio5
// -------------------------
module Exercicio5;
	reg clear;
	wire clk;
	wire [2:0] saida;
	
	clock CLK1 (clk);
	ContMod6 CNT1 (saida, clk, clear);
	
	initial begin
		#1 clear = 1;
		
		$display("CLK SAIDA CLEAR");
		$monitor("%1b    %3b    %1b", clk, saida, clear);
		
		#10 clear = 0;
		#240 $finish;
	end

endmodule //Exercicio5