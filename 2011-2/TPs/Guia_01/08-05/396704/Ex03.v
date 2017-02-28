// ------------------------- 
// Ex03  - XNOR 
// Nome: Igor 
// Matricula: 396704 

// ------------------------- 
// ------------------------- 
// -- xnor gate 
// ------------------------- 

	module xnorgate ( output s,input a,input b); 
	assign s = ~(a^b); 
	endmodule // xnorgate 

// --------------------- 
// -- test xnor gate 
// --------------------- 

	module testxnorgate; 

// ------------------------- dados locais 
	
	reg a, b; // entrada 
	wire s; // saida 

// ------------------------- instancia 

	xnorgate XNOR1 (s, a, b); 

// ------------------------- preparacao 
	
	initial begin:start 
	a=0; b=0; 
	end 

// ------------------------- parte principal 
	initial begin 
	$display("Ex03 - Igor Thadeu - 396704"); 
	$display("Test XNOR gate"); 
	$display("\na ^ b = s\n"); 
	a=0; b=0; 
	#1 $display("%b ^ %b = %b", a, b, s); 
	a=0; b=1; 
	#1 $display("%b ^ %b = %b", a, b, s); 
	a=1; b=0; 
	#1 $display("%b ^ %b = %b", a, b, s); 
	a=1; b=1; 
	#1 $display("%b ^ %b = %b", a, b, s); 
	end 
	endmodule // testxnorgate 