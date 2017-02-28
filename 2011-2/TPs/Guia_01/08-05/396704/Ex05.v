// ------------------------- 
// Ex05  - OR 
// Nome: Igor 
// Matricula: 396704 

// ------------------------- 
// ------------------------- 
// -- or gate 
// ------------------------- 

	module orgate ( output s,input a,input b,input c ); 
	assign s = ~a | ~b | ~c; 
	endmodule // orgate 

// --------------------- 
// -- test or gate 
// --------------------- 
	
	module testorgate; 

// ------------------------- dados locais 
	
	reg a, b, c; // definir registradores 
	wire s; // definir conexao (fio) 

// ------------------------- instancia 

	orgate OR1 (s, a, b, c); 

// ------------------------- preparacao 
	
	initial begin:start 
	a=0; b=0; c=0;
	end 

// ------------------------- parte principal 

	initial begin 
	$display("Ex05 - Igor Thadeu - 396704"); 
	$display("Test OR gate"); 
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
	endmodule // testorgate 