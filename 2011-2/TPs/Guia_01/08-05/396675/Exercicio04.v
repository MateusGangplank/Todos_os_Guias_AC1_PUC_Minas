// ------------------------- 
// Exercicio04  - AND 
// Nome:Arturo M Junior 
// Matricula: 396675

// ------------------------- 
// ------------------------- 
// -- and gate 
// ------------------------- 

	module andgate ( output s,input a,input b,input c ); 
	assign s = ~a & ~b & ~c; 
	endmodule // andgate 

// --------------------- 
// -- test and gate 
// --------------------- 
	
	module testandgate; 

// ------------------------- dados locais 
	
	reg a, b, c; // entrada 
	wire s; // saida 

// ------------------------- instancia 
	
	andgate AND1 (s, a, b, c); 

// ------------------------- preparacao 
	initial begin:start 
	a=0; b=0; c=0;
	end 

// ------------------------- parte principal 
	
	initial begin 
	$display("Exercicio04 - Arturo M A Junior - 396675"); 
	$display("Test AND gate"); 
	$display("\na & b & c = s\n"); 
	a=0; b=0; c=0;
	#1 $display("%b & %b & %b = %b", a, b, c, s); 
	a=0; b=0; c=1; 
	#1 $display("%b & %b & %b = %b", a, b, c, s); 
	a=0; b=1; c=0; 
	#1 $display("%b & %b & %b = %b", a, b, c, s); 
	a=1; b=0; c=0; 
	#1 $display("%b & %b & %b = %b", a, b, c, s);
	a=1; b=1; c=0;
	#1 $display("%b & %b & %b = %b", a, b, c, s);
	a=1; b=0; c=1;
	#1 $display("%b & %b & %b = %b", a, b, c, s);
	a=0; b=1; c=1;
	#1 $display("%b & %b & %b = %b", a, b, c, s);
	a=1; b=1; c=1;

	end 
	endmodule // testandgate 