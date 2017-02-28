// Exemplo0031 - F4
// Nome: Átila Martins Silva Júnior
// Matricula: 449014
// -------------------------
// -------------------------
module fand4(output[3:0] s, input[3:0] a, input[3:0] b);
	and(s[0], a[0], b[0]);
	and(s[1], a[1], b[1]);
	and(s[2], a[2], b[2]);
	and(s[3], a[3], b[3]);
endmodule

module for4(output[3:0] s, input[3:0] a, input[3:0] b);
	or(s[0], a[0], b[0]);
	or(s[1], a[1], b[1]);
	or(s[2], a[2], b[2]);
	or(s[3], a[3], b[3]);
endmodule

module fbuf4(output[3:0] s, input[3:0] a);
	buf (s[0], a[0]);
	buf (s[1], a[1]);
	buf (s[2], a[2]);
	buf (s[3], a[3]);
endmodule

module fnot4(output[3:0] s, input[3:0] a);
	not(s[0], a[0]);
	not(s[1], a[1]);
	not(s[2], a[2]);
	not(s[3], a[3]);
endmodule

module LU_4 (output[3:0] s, input[3:0]a, input[3:0]b, input[3:0] chave);
	wire[3:0] s0, s1, c0, c1, d0, d1;
	
	fand4 AND1 (s0, a, b);
	for4 OR1 (s1, a, b);
	fnot4 NOT1 (c0, chave);
	fbuf4 BUF1 (c1, chave);
	fand4 AND2 (d0, s0, c0);
	fand4 AND3 (d1, s1, c1);
	for4 OR2 (s, d0, d1);
endmodule

module testLU_4;

reg[3:0] in1, in2, key;
wire[3:0] out;

LU_4 LU4(out, in1, in2, key);

initial begin
$display("Exemplo0031 - Átila Martins Silva Júnior - 449014");

$display("Test LU's module");
$display("chave em 0000 porta AND e chave 1111 porta OR.\n");
key = 4'b0000; in1 = 4'b0000; in2 = 4'b1111;
// projetar testes do modulo
$monitor("chave: %4b\tin1: %4b\tin2: %4b\tout: %b",key, in1, in2, out);
#1 key = 4'b0000; in1 = 4'b1010; in2 = 4'b0101; 
#1 key = 4'b1111; in1 = 4'b1100; in2 = 4'b0011;
#1 key = 4'b0000; in1 = 4'b1010; in2 = 4'b0000;
#1 key = 4'b1111; in1 = 4'b1100; in2 = 4'b1111;

end
endmodule // test_f4