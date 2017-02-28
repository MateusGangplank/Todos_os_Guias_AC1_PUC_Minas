// ------------------------- 
// Guia09 - exe 02 
// Nome: Lorena Danielle Gon�alves Bento 
// Matricula: 435049
// ------------------------- 

//------
//--Ass�ncrono  crescente
//------


module clock ( clk ); 
	output clk; 
	reg clk; 
	initial begin 
	clk = 1'b0; 
end 

always begin 
	#12 clk = ~clk; 
end 

endmodule 



module fliplopT (s, not01, fpt, clk, preset,  clear); 
	output s, not01;
	input fpt, clk, preset, clear;
	reg s, not01; 
	always @( posedge clk ) 
	begin 
		if ( ~clear ) 
	begin 
		s <= 0; not01 <= ~s; 
	end 
		else 
			if ( ~preset ) 
	begin 
			s <= 1; not01 <= ~s; 
	end 
	
	else 
	begin 
		if ( fpt ) 
		begin 
		s <= ~s; not01 <= ~s; 
		end 
	end 
	end 
	endmodule // fliplopT 
	

//--crescente

module assincrono (output [4:0]s, input fpt, input clk, input preset, input clear);
wire not02;

	fliplopT f1 (s[0], not02, fpt, not02, preset, clear);
	fliplopT f2 (s[1], not02, fpt, not02, preset, clear);
	fliplopT f3 (s[2], not02, fpt, not02, preset, clear);
	fliplopT f4 (s[3], not02, fpt, not02, preset, clear);
	fliplopT f5 (s[4], not02, fpt, clk, preset, clear);

endmodule

//--Fim crescente

module test_ex;
reg clear, fpt, preset;
	wire clk;
	wire [4:0] s;
	
	clock clk01 (clk);
	assincrono assc (s, fpt, clk, preset, clear);
	initial begin
		#1 clear = 1; fpt = 0; preset = 1;
		
		$display("Exercicio02 - Lorena Danielle Gon�alves Bento - 435049");
		$monitor("%1b   %5b %1b  %1b   %1b", clk, s, fpt, clear, preset);
		
		#20 clear = 1; preset = 0;
		#20 preset = 1;
		#400 $finish;
	end

endmodule


 
