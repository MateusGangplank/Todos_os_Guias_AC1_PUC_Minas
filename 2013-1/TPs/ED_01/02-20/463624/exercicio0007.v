
// Nome: Mateus Cunha da Silva 
// Matricula: 463624 
// --------------------- 
// --------------------- 
// -- XNORgate
// ---------------------
module xnorGate ( output s,
 input a, input b);
 	assign s = (( a & b ) | ( (~a) & (~b)));
 endmodule // xnor
// --------------------- 
// -- test 
// --------------------- 
module exercicio;

	reg a, b;
	wire s;

xnorGate xnor1 ( s, a, b );
// ------ Preparaçao
initial begin:start
	a=0;
	b=0;
end 

// ------------------------- parte principal 
initial begin:main
	$display("Exercicioo0007 - Mateus Cunha da Silva - 463624"); 
	$display("Tabela "); 
	$display("\n a ^ b = s\n"); 
	$monitor(" %b ^ %b = %b ", a, b, s);
	#1a=0; b=1;
	#1a=1; b=0;
	#1a=1; b=1;
end
endmodule//exercicio
