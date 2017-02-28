// -------------------------
// Exemplo0033
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
// Zero Flag
// -------------------------
module zeroflag(output s, input[2:0] entrada);
	nor(s,entrada[0],entrada[1],entrada[2]);
endmodule

module AU(output[2:0] s, output cout, input[2:0] a,input[2:0] b, input cin);
	wire[2:0] s1, s2;
	wire c1, c2;
	
	fullAdder3 fa1(s2,c2,a,b,cin);
	
	assign s = s2;
	assign cout = c2;
endmodule

module test_subsoma;
	// ------------------------- definir dados
	reg [2:0] x;
	reg [2:0] y;
	reg cin;
	wire zf;
	wire cout;
	wire[2:0] resultado;
	
	AU au1(resultado, cout, x, y, cin);
	zeroflag zf1(zf, resultado);
	// ------------------------- parte principal
	initial begin
		$display("Exemplo0033 - Marcio Enio Gonçalves Dutra Junior - 441698");
		$display("Test");
		
		cin = 0;
		#1 x = 3'b000; y = 3'b001;
		
		$monitor ("%b + %b = %b		Zero: %b",x,y,resultado,zf);
		#1 x = 3'b000;
		#1 x = 3'b010;
		#1 x = 3'b001;
		#1 x = 3'b001;
		#1 x = 3'b000;
		#1 x = 3'b110;
		#1 x = 3'b000;
	end
endmodule

