// ------------------------- 
// Guia09 - exe 05 
// Nome: Lorena Danielle Gonçalves Bento 
// Matricula: 435049
// ------------------------- 

//------
//--Contador Contador módulo 6 
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


//--Flip-flops tipo JK 
module fliplopJK (s, not01, fpt, clk, preset,  clear); 
	output s, not01;
	input fpt, jk, clk, preset, clear;
	reg s, not01; 
	always @( posedge clk ) 
	begin 
		if ( fpt & ~jk) 
	begin 
		s <= 1; not01 <= 0; 
	end 
		else 
			if ( ~fpt & jk ) 
	begin 
			s <= 0; not01 <= 1; 
	end 
	
	else 
	begin 
		if (fpt & jk) 
		begin 
		s <= ~s; not01 <= ~not01; 
		end 
	end 
	end 
	endmodule // fliplopJK 

	

//-- Contador modulo 6 

module contmod6 (output [4:0]s, input fpt, input clk, input jk, input preset, input clear);
wire not02;

//--Assign - portas 
	not (snot1,s[1]);
	and (sand1,snot1,s[0],s[2]);
	or (sor,jk,sand1);

	fliplopJK f1 (s[0], not02, s[1], sor, clear, preset);
	fliplopJK f2 (s[1], not02, s[0], sor,clear, preset);
	fliplopJK f3 (s[2], not02, s[1], sor,clear, preset);
		


endmodule

//--Fim Contador

module test_ex;
reg clear, fpt, preset;
	wire clk;
	wire [4:0] s;
	
	clock clk01 (clk);
	contmod6 dec (s, fpt, jk, clk, preset, clear);
	initial begin
		#1 clear = 1; fpt = 0; preset = 1;

		
		$display("Exercicio05 - Lorena Danielle Gonçalves Bento - 435049");
		$monitor("%1b   %5b %1b  %1b   %1b", clk, s, fpt, clear, preset);
		
		#20 clear = 1; preset = 0;
		#20 preset = 1;
		#400 $finish;
	end

endmodule


 
