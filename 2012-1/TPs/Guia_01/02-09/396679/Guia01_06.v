// --------------------- 
// Guia01_06 - xor 
// Nome: Bruno Cezar Andrade Viallet
// Matricula: 396679
// --------------------- 

// --------------------- 
// --  xor gate 
// ---------------------
module xorgate (s, a, b); 
	input a, b;
	output s;
	
	assign s = (~a & b)|(a & ~b);  
endmodule // xor 

// --------------------- 
// -- test xorgate 
// --------------------- 
module testxorgate; 
// ------------------------- dados locais 
	reg a,b; // definir registrador 
	wire s; // definir conexao (fio) 
// ------------------------- instancia 
	xorgate XOR1 (s, a, b); 

// ------------------------- parte principal 
initial begin:main 
	a=0; b=0; 
	$display("Guia01_06 - Bruno Cezar Andrade Viallet - 396679");
	$display("Test xor gate"); 
	$display("\n a ^ b = s\n"); 
	$monitor("%b ^ %b = %b", a, b, s); 
  	#1  a=0; b=0;
	#1  a=0; b=1;
	#1  a=0; b=1;
	#1  a=1; b=0;
	#1  a=1; b=0;
	#1  a=1; b=1;
	#1  a=1; b=1;
end 

endmodule // testxorgate 