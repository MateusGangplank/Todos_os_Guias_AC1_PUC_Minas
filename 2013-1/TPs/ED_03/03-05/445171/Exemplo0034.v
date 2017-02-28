// -------------------------
// Exemplo0034
// Nome: Raphael Quintao
// Matricula: 445171
// -------------------------
// -------------------------
// 
// -------------------------
module ok (output s1, output s2, input a, input b, input k);

wire s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13;

	xor nand1(s1, a, b);
	xnor nor1(s2, a, b);
	
	nor and1(s3, a, b);
	or or1(s4, a, b);
	
	and and2(s5, s1, k);
	and and3(s6, s2, k);
	
	and and4(s7, s3, ~k);
	and and5(s8, s4, ~k);
	
	
	or or2(s1, s5, s7);
	or or3(s2, s6, s8);

endmodule
module test;

// ------------------------- definir dados
reg y;
reg x;
reg w;
wire z;
wire z1;

ok modulo (z, z1, w, x, y);
// ------------------------- parte principal
initial begin
$display("Exemplo0034 - Raphael Quintao - 445171");
$display("Test LU's module");

z = 0; z1 = 0; k = 0;

$monitor("z = %1b -- z1 = %1b k = %1b Resultado = %1b",z,z1,k,s );

#1z = 0; z1 = 1; k = 0;
#1z = 1; z1 = 0; k = 0;
#1z = 1; z1 = 1; k = 0;

end
endmodule // test_f4