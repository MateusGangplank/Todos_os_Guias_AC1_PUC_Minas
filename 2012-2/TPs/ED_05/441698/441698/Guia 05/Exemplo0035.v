// -------------------------
// Exemplo0035
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

// -------------------------
// Zero Flag
// -------------------------
module zeroflag(output s, input[2:0] entrada);
	nor(s,entrada[0],entrada[1],entrada[2]);
endmodule

module carry(output s, input[2:0] entrada1, input[2:0] entrada2);
	wire[1:0] k;
	and(k[0],entrada1[0],entrada2[0]);
	and(k[1],entrada1[1],entrada2[1]);
	
	or(s,k[0],k[1]);
endmodule

module overflow(output s, input[2:0] entrada1, input[2:0] entrada2);
	wire[4:0] k;
	and(k[0],entrada1[1],entrada2[1]);
	and(k[1],entrada1[0],entrada2[0]);
	or(k[2],entrada1[1],entrada2[1]);
	and(k[3],k[1],k[2]);
	
	or(s,k[0],k[3]);
endmodule

module sinal(output s, input[2:0] entrada);
	assign s = entrada[2];
endmodule

module maiormenorigual(output[2:0] s, input[2:0] entrada1, input[2:0] entrada2);
	assign s[0] = (entrada1 > entrada2)? 1: 0;
	assign s[1] = (entrada1 == entrada2)? 1: 0;
	assign s[2] = (entrada1 < entrada2)? 1: 0;
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
	wire[2:0] s;
	wire zf;
	wire cr1;
	wire of1;
	wire cout;
	wire sinal;
	wire[2:0] resultado;
	
	carry cry1(cr1,x,y);
	overflow o1(of1,x,y);
	AU au1(resultado, cout, x, y, cin, chave);
	sinal sin1(sinal,resultado);
	zeroflag zf1(zf, resultado);
	maiormenorigual mmi1(s, x, y);
	// ------------------------- parte principal
	initial begin
		$display("Exemplo0035 - Marcio Enio Gonçalves Dutra Junior - 441698");
		$display("Test");
		
		chave = 0; cin = 0;
		#1 x = 3'b000; y = 3'b000;
		
		$monitor ("%b + %b = %b		Zero:%b	Carry:%b Overflow:%b Sinal:%b MMI:%b",x,y,resultado,zf,cr1,of1,sinal,s);
		#1 x = 3'b000; y = 3'b001;
		#1 x = 3'b010; y = 3'b010;
		#1 x = 3'b001; y = 3'b011;
		#1 x = 3'b001; y = 3'b100;
		#1 x = 3'b000; y = 3'b101;
		#1 x = 3'b110; y = 3'b110;
		#1 x = 3'b000; y = 3'b111;
		#1 x = 3'b100; y = 3'b000;
		#1 x = 3'b110; y = 3'b101;
		#1 x = 3'b111; y = 3'b001;
		#1 x = 3'b010; y = 3'b101;
	end
endmodule

