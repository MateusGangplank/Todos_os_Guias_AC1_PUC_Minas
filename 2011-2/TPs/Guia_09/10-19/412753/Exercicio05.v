// ------------------------- 
// Exercicio 05
// Nome: Luis Vasconcelos Dias
// Matricula: 412753
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
module jkff ( output q, output qnot, 
	input j, input k, input clk ); 
	reg q, qnot; 
	always @( posedge clk ) 
	begin 
	if ( j & ~k ) 
	begin 
	q <= 1; qnot <= 0; 
	end 
	else 
	if ( ~j & k ) 
	begin 
	q <= 0; qnot <= 1; 
	end 
	else 
	if ( j & k ) 
	begin 
	q <= ~q; qnot <= ~qnot; 
	end 
	end 
	endmodule // jkff 
	
	// -----------------------------------------------------------------------
// --  Contador Modulo 6. 
// -----------------------------------------------------------------------
module cont6 (output [4:0]s, input j, input k, input clk);
wire nots;

   
	not n2 (z0,s[1]);
	and a1 (z1,z0,s[0],s[2]);
	or o1 (z3,k,z1);
	jkff Fl0 (s[0], nots, j, s[1], z3);
	jkff Fl1 (s[1], nots, j, s[2], z3);
	jkff Fl2 (s[2], nots, j, clk, z3);
	

endmodule//modulo6

// -------------------------
// -- Teste
// -------------------------

module teste;
reg  t, k;
	wire clk;
	wire [4:0] saida;
	
	clock CLK1 (clk);
	cont6  CON1 (saida, t, clk, k);
	initial begin
		#1  t = 1; k = 1;
		
		$display("T CLK SAIDA ");
		$monitor("%1b   %5b  %1b   %1b", clk, saida, t, k);
		
		#24 k = 1; 
		#960 $finish;
	end

endmodule //teste


