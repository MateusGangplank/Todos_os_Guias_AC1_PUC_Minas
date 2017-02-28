// --------------------- 
// Guia01_07 - xnor 
// Nome: Bruno Cezar Andrade Viallet
// Matricula: 396679
// --------------------- 

// --------------------- 
// --  xnor gate 
// ---------------------
module xnorgate (s, a, b); 
	input a, b;
	output s;
	
	assign s = (a & b)|(~a & ~b);  
endmodule // xnor 

// --------------------- 
// -- test xnorgate 
// --------------------- 
module testxnorgate; 
// ------------------------- dados locais 
	reg a,b; // definir registrador 
	wire s; // definir conexao (fio) 
// ------------------------- instancia 
	xnorgate XNOR1 (s, a, b); 

// ------------------------- parte principal 
initial begin:main 
	a=0; b=0; 
	$display("Guia01_07 - Bruno Cezar Andrade Viallet - 396679");
	$display("Test xnor gate"); 
	$display("\n a ~^ b = s\n"); 
	$monitor("%b ~^ %b = %b", a, b, s); 
  	#1  a=0; b=0;
	#1  a=0; b=1;
	#1  a=0; b=1;
	#1  a=1; b=0;
	#1  a=1; b=0;
	#1  a=1; b=1;
	#1  a=1; b=1;
end 

endmodule // testxnorgate 