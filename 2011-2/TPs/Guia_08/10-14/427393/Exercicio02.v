// ------------------------- 
// -- Nome: Camila Guedes Silveira 
// -- Matricula: 427393 
// -------------------------

 // `include "clock.v"
// --`include "flipFlopD.v"

module clock ( clk ); 
	output clk; 
	reg clk; 
	
	initial 
		begin 
			clk = 1'b0; 
		end 
		
	always 
		begin 
			#12 clk = ~clk; 
		end 
endmodule // clock ( ) 


module f ( output q, output qnot, input d, input clk ); 
reg q, qnot; 

always @( posedge clk ) 
begin 
	q <= d; 
	qnot <= ~q; 
end 
endmodule



module Exercicio02(output [5:0]s, input x, clock);
	
	clock clk (clock);
	wire e, s0not, s1not, s2not, s3not, s4not;
	
	assign x = 1'b1;
	
	assign e = x | s[2];
	
	assign s0not = ~s[0];
	assign s1not = ~s[1];
	assign s2not = ~s[2];
	assign s3not = ~s[3];
	assign s4not = ~s[4];
	
	f f1 (s[0], s0not, e, clk);
	f f2 (s[1], s1not, s[0], clk);
	f f3 (s[2], s2not, s[1], clk);
	f f4 (s[3], s3not, s[2], clk);
	f f5 (s[4], s4not, s[3], clk);
	
	
endmodule

module teste;

	// -- definir dados
	wire [5:0]s;
	reg x;
	reg clk;
		
// -- instancia
	
	Exercicio02 modulo(s, x, clk);
	
	initial begin
		$display("Camila Guedes Silveira - 427393");
		
		clk = 1;
		
		$display("valor: %b  clock: %b  resultado: %b", x, clk, s);
		
		clk = 0;
		clk = 1;
		
		$display("valor: %b  clock: %b  resultado: %b", x, clk, s);
		
		clk = 0;
		clk = 1;
				
		$display("valor: %b  clock: %b  resultado: %b", x, clk, s);


		
	end
endmodule