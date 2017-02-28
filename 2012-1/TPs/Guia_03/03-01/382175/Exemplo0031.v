// ------------------------- 
// Exemplo0031 - F4 
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 

// ------------------------- 
// f4_gate 
// ------------------------- 

module f4 (output  s0, output s1, output s2, output s3, output s4, output s5, output s6,
			  output s7, input  a, input  e, input b, input f, input c, input g, input d,
			  input h); 
			  
	or AE0 (s0, a, e);
	and AE1 (s1, a, e);

	or BF0 (s2, b, f);
	and BF1 (s3, b, f);

	or CG0 (s4, c, g);
	and CG1 (s5, c, g);

	or DH0 (s6, d, h);
	and DH1 (s7, d, h);
	
endmodule // f4 

module test_f4; 
// ------------------------- definir dados 
	reg a, e, b, f, c, g, d, h; 
	wire s0, s1, s2, s3, s4, s5, s6, s7; 
	
	f4 modulo (s0, s1, s2, s3, s4, s5, s6, s7, a, e, b, f, c, g, d, h); 
	
// ------------------------- parte principal 
initial begin 
	$display("Exemplo0031 - Oswaldo Oliveira Paulino - 382175"); 
	$display("Test LU's module"); 

	a = 4'b0011; e = 4'b0101;
	b = 4'b1001; f = 4'b0111;
	c = 4'b0001; g = 4'b0110;
	d = 4'b1000; h = 4'b0011; 

// projetar testes do modulo 
	#1 $display("%3b || %3b = %3b", a, e, s0);
	#1 $display("%3b & %3b = %3b", a, e, s1);
	#1 $display("%3b || %3b = %3b", b, f, s2);
	#1 $display("%3b & %3b = %3b", b, f, s3);
	#1 $display("%3b || %3b = %3b", c, g, s4);
	#1 $display("%3b & %3b = %3b", c, g, s5);
	#1 $display("%3b || %3b = %3b", d, h, s6);
	#1 $display("%3b & %3b = %3b", d, h, s7);

end 

endmodule // test_f4 

// -------------------------- Documentacao complementar
/*
    Exemplo0031 - Oswaldo Oliveira Paulino - 382175
    Test LU's module
      1 ||   1 =   1
      1 &   1 =   1
      1 ||   1 =   1
      1 &   1 =   1
      1 ||   0 =   1
      1 &   0 =   0
      0 ||   1 =   1
      0 &   1 =   0
*/