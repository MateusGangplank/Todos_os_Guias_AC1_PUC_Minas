
// Nome: Mateus Cunha da Silva 
// Matricula: 463624 
// --------------------- 
// --------------------- 
// -- XORgate
// ---------------------
module xorGate ( output s,
 input a, input b);
 	assign s = ((a&(~b))|((~a)& b));
 endmodule // nor
// --------------------- 
// -- test nandgate 
// --------------------- 
module exercicio;

	reg a, b;
	wire s;

xorGate xor1 ( s, a, b );
// ------ Preparaçao
initial begin:start
	a=0;
	b=0;
end 

// ------------------------- parte principal 
initial begin:main
	$display("Exercicioo0006 - Mateus Cunha da Silva - 463624"); 
	$display("Tabela "); 
	$display("\n a ^ b = s\n"); 
	$monitor(" %b ^ %b = %b ", a, b, s);
	#1a=0; b=1;
	#1a=1; b=0;
	#1a=1; b=1;
end
endmodule//exercicio0001
