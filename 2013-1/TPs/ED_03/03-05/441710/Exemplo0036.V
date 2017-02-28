// ---------------------
// Exercicio0032
// Nome: Thais Mairink 
// Matricula: 441710
// ---------------------

module comparador(output s0, input a, input b);

xor(s0 , a, b);


endmodule

module testcomparador;

reg a;
reg b;
wire z;

comparador modulo(z, a, b);

// ------------------------- parte principal 
initial begin 
$display("Exemplo0036 - Thais Mairink - 441710"); 
$display("Test LU's module");
$display("0 - iguais    1 - diferentes"); 
a = 1'b0;    b = 1'b0;

// projetar testes do modulo 
   #1   $monitor("%3b %3b = %3b ",a,b,z);
	#1 a = 1'b0;	b = 1'b1;
	#1 a = 1'b1;	b = 1'b0;
	#1 a = 1'b1;	b = 1'b1;
	
end
endmodule //testcomparador 