// ------------------------- 
// Guia09 - exe 04 
// Nome: Lorena Danielle Gonçalves Bento 
// Matricula: 435049
// ------------------------- 

//------
//--Contador decádico crescente 
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
	

//--Contador decádico crescente

module decacdico (output [4:0]s, input fpt, input clk, input preset, input clear);
wire not02;

//--Assign - portas 
   not (snot1,not02);
	and (sand1,nots,snot1);
	and (sand2,snot1,sand1);
	
	
	fliplopT f1 (s[0], not02, fpt, clk, preset, sand2);
	fliplopT f2 (s[1], not02, fpt, s[0], preset, sand2);
	fliplopT f3 (s[2], not02, fpt, s[1], preset, sand2);
	fliplopT f4 (s[3], not02, fpt, s[2], preset, sand2);
	fliplopT f5 (s[4], not02, fpt, clk, preset, sand2);

endmodule

//--Fim Contador decádico crescente

module test_ex;
reg clear, fpt, preset;
	wire clk;
	wire [4:0] s;
	
	clock clk01 (clk);
	decacdico dec (s, fpt, clk, preset, clear);
	initial begin
		#1 clear = 1; fpt = 0; preset = 1;

		
		$display("Exercicio04 - Lorena Danielle Gonçalves Bento - 435049");
		$monitor("%1b   %5b %1b  %1b   %1b", clk, s, fpt, clear, preset);
		
		#20 clear = 1; preset = 0;
		#20 preset = 1;
		#400 $finish;
	end

endmodule


 
