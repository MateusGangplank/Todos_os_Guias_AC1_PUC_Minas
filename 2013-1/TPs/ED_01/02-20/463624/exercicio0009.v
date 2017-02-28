
// Nome: Mateus Cunha da Silva 
// Matricula: 463624 
// --------------------- 
// --------------------- 
// and 3 entradas
// ---------------------
module and3Gate ( output s,
 input a, input b, input c);
 	wire z;
   and and1(z, a, b);
	and and2(s, c, z);
 endmodule // 
// --------------------- 
// -- test 
// --------------------- 
module exercicio;

	reg a, b, c;
	wire s;

and3Gate and1 ( s, a, b, c );
// ------ Preparaçao
initial begin:start
	a=0;
	b=0;
	c=0;
end 

// ------------------------- parte principal 
initial begin:main
	$display("Exercicioo0009 - Mateus Cunha da Silva - 463624"); 
	$display("Tabela "); 
	$display("\n a & b = s\n"); 
	$monitor(" %b & %b & %b = %b ", a, b, c, s);
	#1a=0; b=0; c =1;
	#1a=0; b=1; c =0;
	#1a=0; b=1; c =1;
	#1a=1; b=0; c =1;
	#1a=1; b=1; c =0;
	#1a=1; b=1; c =1;
	

	
end
endmodule//exercicio
