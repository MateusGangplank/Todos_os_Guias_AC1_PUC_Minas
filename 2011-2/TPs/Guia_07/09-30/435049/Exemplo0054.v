// ------------------------- 
// Exemplo0054 EstadosFinitos
// Nome: Lorena Danielle Gonçalves Bento
// Matricula: 435049 
// ------------------------- 
// -------------------- 
// --- Exemplo0054 
// -------------------- 
//

// constant definitions 
`define found    1
`define notfound 0 


// FSM 
module mealy1101( y, x, clk, reset );
 output  y;
 input   x; 
 input   clk; 
 input   reset; 
 
 
mealy1101 mealy1( m1, xm, clkm, resetm );
reg clkm, resetm, xm; 
wire m1; 
 
  
initial 
	begin 
	$display ( "Time X Estados" ); 

// initial values 
	clkm = 1; 
	resetm = 0; 
	xm = 0; 
	
	// input signal changing 
	#5 resetm = 1; 
	#10 xm = 0; 
	#10 xm = 0; 
	#10 xm = 1; 
	#20 xm = 1; 

	#30 $finish; 
end // initial 

	always 
	#5 clkm = ~clkm; 
	always @( posedge clk ) 
	
	begin 
	$display("Exercicio 0054 - Lorena Danielle Gonçalves Bento - 435049");
	$display ( "%4d %4b %4b %5b", $time, xm, m1);
	end // always at positive edge clocking changing 
endmodule // Exemplo0054