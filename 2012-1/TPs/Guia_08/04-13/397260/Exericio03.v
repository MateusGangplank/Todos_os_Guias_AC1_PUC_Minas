// ------------------------- 
// Exercício03
// Nome: Pedro Henrique Hardeman Guedes
// Matricula: 427453 
// ------------------------- 


// -------------------------
// -- FLIP FLOP 
// -------------------------
module dff ( output q, output qnot, 
	input d, input clk ); 
	reg q, qnot; 
	always @( posedge clk ) 
	begin 
		q <= d; qnot <= ~q; 
	end 
endmodule // dff 

// -----------------------------------------------------------------------
// --  Registrador de deslocamento para a esquerda 
// -----------------------------------------------------------------------
module test; 
wire w,x,y,z,s1,s2,s3,s4,s5; 
reg data, clk;
or or1 (s5, data, w)
	dff dff4 ( w, s1, s5, clk );
	dff dff3 ( x, s2, w, clk );
	dff dff2 ( y, s3, x, clk );
	dff dff1 ( z, s4, z, clk );

initial begin 
$display("Guia08Exerc03 - Pedro Henrique Vilar Locatelli - 427453"); 

	clk    = 0; 
	data      = 1; 
	#4  data = 1;
	#4  data = 1;
	#4  data = 1; 
	#4  data = 0;
	#30 $finish; 
 end
 
 always 
  #5 clk = ~clk; 
 
 always @( posedge clk ) 
  begin 
   $display ( "%4d\t%1b\t%1b\t%1b%1b%1b%1b", $time, clk, data, w, x, y, z); 
  end // always at positive edge clocking changing 
endmodule