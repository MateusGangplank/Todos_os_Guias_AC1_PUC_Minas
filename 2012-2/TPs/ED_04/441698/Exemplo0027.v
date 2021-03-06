// -------------------------
// Exemplo0027
// Nome: Marcio Enio Gon�alves Dutra Junior
// Matricula: 441698
// -------------------------

// -------------------------
// igualdade
// -------------------------
module igualdade (output s,input[2:0] a,input[2:0] b);
	wire s1, s2, s3;
	
	xnor xnor1(s1, a[0],b[0]);
	xnor xnor2(s2, a[1],b[1]);
	xnor xnor3(s3, a[2],b[2]);
	
	and and4(s, s1,s2,s3);
	
endmodule

// -------------------------
// desigualdade
// -------------------------
module desigualdade (output s,input[2:0] a,input[2:0] b);
	wire s1, s2, s3;
	
	xor xor1(s1, a[0],b[0]);
	xor xor2(s2, a[1],b[1]);
	xor xor3(s3, a[2],b[2]);
	
	or or4(s, s1,s2,s3);
	
endmodule

module AU(output s,input[2:0] a,input[2:0] b,input chave);
	wire s1, s2;
	
	igualdade ig1(s1,a,b);
	desigualdade di1(s2,a,b);
	
	assign s = chave? s2: s1;
endmodule

module test_igualdade;
	// ------------------------- definir dados
	reg [2:0] x;
	reg [2:0] y;
	reg chave;
	wire resultado;
	
	AU au1(resultado, x, y, chave);
	// ------------------------- parte principal
	initial begin
		$display("Exemplo0027 - Marcio Enio Gon�alves Dutra Junior - 441698");
		$display("Test");
		
		chave = 0;
		#1 x = 3'b000; y = 3'b000;
		
		$monitor ("%b == %b = %b",x,y,resultado);
		#1 x = 3'b000; y = 3'b001;
		#1 x = 3'b010; y = 3'b010;
		#1 x = 3'b001; y = 3'b011;
		#1 x = 3'b001; y = 3'b100;
		#1 x = 3'b000; y = 3'b101;
		#1 x = 3'b110; y = 3'b110;
		#1 x = 3'b000; y = 3'b111;
		$monitor ("%b =! %b = %b",x,y,resultado);
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
endmodule // test_igualdade

