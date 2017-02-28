// ---------------------------
// Nome: Caio Ragacci Pimentel
// Matricula: 405794
// --------------------------


//---------------------------
// --- Guia 01 - XNORgate ---
//---------------------------

module xnorgate (e, a ,b ,c ,d);
	
	output e;
	input  a, b, c ,d;
	
	assign e = (~(a^b^c^d));

endmodule // xnorgate


//---------------------------
// --- Teste - XNORgate ---
//---------------------------

module testexnorgate;

	reg  a, b, c, d;
	wire e;
	
	//instancia
	xnorgate XNOR1 (e, a ,b ,c ,d);
	
	//parte principal
	
	initial begin
		
	$display ("\n Guia 01 - Caio Ragacci Pimentel - 405794");
	$display (" TESTE - Porta XNOR ");
	$display ("\n a ^ b ^ c ^ d = ~e \n");
#1		a = 0; b = 0; c = 0; d = 0;
#1	$display ("%b ^ %b ^ %b ^ %b = %b", a ,b ,c ,d ,e);
#1		a = 0; b = 0; c = 0; d = 1;
#1	$display ("%b ^ %b ^ %b ^ %b = %b", a ,b ,c ,d ,e);
#1		a = 0; b = 0; c = 1; d = 0;
#1	$display ("%b ^ %b ^ %b ^ %b = %b", a ,b ,c ,d ,e);
#1		a = 0; b = 0; c = 1; d = 1;
#1	$display ("%b ^ %b ^ %b ^ %b = %b", a ,b ,c ,d ,e);
#1		a = 0; b = 1; c = 0; d = 0;
#1	$display ("%b ^ %b ^ %b ^ %b = %b", a ,b ,c ,d ,e);
#1		a = 0; b = 1; c = 0; d = 1;
#1	$display ("%b ^ %b ^ %b ^ %b = %b", a ,b ,c ,d ,e);
#1		a = 0; b = 1; c = 1; d = 0;
#1	$display ("%b ^ %b ^ %b ^ %b = %b", a ,b ,c ,d ,e);
#1		a = 0; b = 1; c = 1; d = 1;
#1	$display ("%b ^ %b ^ %b ^ %b = %b", a ,b ,c ,d ,e);
#1		a = 1; b = 0; c = 0; d = 0;
#1	$display ("%b ^ %b ^ %b ^ %b = %b", a ,b ,c ,d ,e);
#1		a = 1; b = 0; c = 0; d = 1;
#1	$display ("%b ^ %b ^ %b ^ %b = %b", a ,b ,c ,d ,e);
#1		a = 1; b = 0; c = 1; d = 0;
#1	$display ("%b ^ %b ^ %b ^ %b = %b", a ,b ,c ,d ,e);
#1		a = 1; b = 0; c = 1; d = 1;
#1	$display ("%b ^ %b ^ %b ^ %b = %b", a ,b ,c ,d ,e);
#1		a = 1; b = 1; c = 0; d = 0;
#1	$display ("%b ^ %b ^ %b ^ %b = %b", a ,b ,c ,d ,e);
#1		a = 1; b = 1; c = 0; d = 1;
#1	$display ("%b ^ %b ^ %b ^ %b = %b", a ,b ,c ,d ,e);
#1		a = 1; b = 1; c = 1; d = 0;
#1	$display ("%b ^ %b ^ %b ^ %b = %b", a ,b ,c ,d ,e);
#1		a = 1; b = 1; c = 1; d = 1;
#1	$display ("%b ^ %b ^ %b ^ %b = %b", a ,b ,c ,d ,e);	
	
	end
	
endmodule // testexnorgate 


//-------------------------------------------------------------------------------------------------------------