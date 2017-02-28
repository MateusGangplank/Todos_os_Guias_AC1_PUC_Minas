// -------------------------
// Exemplo0031
// Nome: Marcio Enio Gonçalves Dutra Junior
// Matricula: 441698
// -------------------------

// -------------------------
// full adder
// -------------------------
module fullAdder (soma, cout, a, b, cin);
	input a, b, cin;
	output soma, cout;
	wire s1, c1, c2;
	
	xor (s1, a, b);
	and (c1, a, b);
	xor (soma, s1, cin);
	and (c2, s1, cin);
	or (cout, c1, c2);
endmodule

// -------------------------
// full adder 3bits
// -------------------------
module fullAdder3 (soma, cout, a, b, cin);
	output [2:0] soma;
	output  cout;
	input [2:0] a, b;
	input cin;
	wire c3, c2, c1;
	
	  fullAdder  fa0 (soma[0], c1, a[0], b[0], cin);
	  fullAdder  fa1 (soma[1], c2, a[1], b[1], c1);
	  fullAdder  fa2 (soma[2], cout, a[2], b[2], c2);
endmodule

// -------------------------
// full Diff
// -------------------------
module fullDiff (soma, cout, a, b, cin);
	input a, b, cin; 
	output soma, cout;
	wire s1, s2, s3, c1, c2;
	
	xor (s1, a, b);
	not (s2, a);
	and (c1, s2, b);
	xor (soma, s1, cin);
	not (s3, s1);
	and (c2, s3, cin);
	or (cout, c1, c2);
endmodule

// -------------------------
// full Diff 3bits
// -------------------------
module fullDiff3 (soma, cout, a, b, cin);
	output [2:0] soma;
	output  cout;
	input [2:0] a, b;
	input cin;
	wire c3, c2, c1;
	
	  fullDiff  fa0 (soma[0], c1, a[0], b[0], cin);
	  fullDiff  fa1 (soma[1], c2, a[1], b[1], c1);
	  fullDiff  fa2 (soma[2], cout, a[2], b[2], c2);
endmodule

module AU(output[2:0] s, output cout, input[2:0] a,input[2:0] b, input cin, input chave);
	wire[2:0] s1, s2;
	wire c1, c2;
	
	fullDiff3 fd1(s1,c1,a,b,cin);
	fullAdder3 fa1(s2,c2,a,b,cin);
	
	assign s = chave? s1: s2;
	assign cout = chave? c1: c2;
endmodule

module test_subsoma;
	// ------------------------- definir dados
	reg [2:0] x;
	reg [2:0] y;
	reg cin;
	reg chave;
	wire cout;
	wire[2:0] resultado;
	
	AU au1(resultado, cout, x, y, cin, chave);
	// ------------------------- parte principal
	initial begin
		$display("Exemplo0031 - Marcio Enio Gonçalves Dutra Junior - 441698");
		$display("Test");
		
		chave = 0; cin = 0;
		#1 x = 3'b000; y = 3'b000;
		
		$monitor ("%b + %b = %b",x,y,resultado);
		#1 x = 3'b000; y = 3'b001;
		#1 x = 3'b010; y = 3'b010;
		#1 x = 3'b001; y = 3'b011;
		#1 x = 3'b001; y = 3'b100;
		#1 x = 3'b000; y = 3'b101;
		#1 x = 3'b110; y = 3'b110;
		#1 x = 3'b000; y = 3'b111;
		$monitor ("%b - %b = %b",x,y,resultado);
		chave = 1;
		#1 x = 3'b000; y = 3'b000;
		#1 x = 3'b000; y = 3'b001;
		#1 x = 3'b010; y = 3'b010;
		#1 x = 3'b001; y = 3'b011;
		#1 x = 3'b001; y = 3'b100;
		#1 x = 3'b000; y = 3'b101;
		#1 x = 3'b110; y = 3'b110;
		#1 x = 3'b000; y = 3'b111;
	end
endmodule

