// -------------------------
// Exemplo0031 - F4
// Nome: Gabriel Benjamim de Carvalho
// Matricula: 396690
// -------------------------
// -------------------------
// f4_gate
// -------------------------

module f4 (output saida,input chave,input a,input  b);
// descrever por portas
wire s0, s1, s2;
// and AND1(s0, a, b);
// or OR1(s1, a, b);

// nand NAND1(s2, s0, s1);
// and AND1 (s3, s0, ~s1);
// or OR1 (s4, s2, s3);
// or OR2 (saida, s4, s0);

and AND1 (s0, a, ~b, ~chave);
and AND2 (s1, a, b);
or OR1 (saida, s0, s1);

endmodule // f4

module test_f4;
// ------------------------- definir dados
reg x;
reg y;
reg chave;
wire z;
f4 modulo (z, chave, x, y);
// ------------------------- parte principal

initial begin
$display("Exemplo0031 - Gabriel Benjamim de Carvalho - 396690");
$display("Test LU's module");
x = 1'b1; y = 1'b0; chave=1'b1;
// projetar testes do modulo
#1 $display("chave, x y -> Resultado");
#1 $display("%3b %3b %3b 	%3b",chave,x,y,z);
x = 1'b1; y = 1'b0; chave=1'b0;
#1 $display("%3b %3b %3b 	%3b",chave,x,y,z);
end
endmodule // test_f4

// or     a b r
// 0 0 0  0 0 0
// 0 0 1  1 0 1
// 0 1 0  1 0 1
// 0 1 1  1 1 1   
					//a!b!c + ab!c + abc
					//a!b!c + ab
// 1 0 0  0 0 0
// 1 0 1  1 0 0
// 1 1 0  1 0 0
// 1 1 1  1 1 1
			 // !(ab) + a + a!b
