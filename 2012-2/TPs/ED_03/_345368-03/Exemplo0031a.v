// ------------------------- 
// Exemplo0031 - F4 
// Nome: Marcio Santana Correa
// Matricula: 345368
// ------------------------- 

// -------------------------
//  f4_gate
// -------------------------
module fand4 (output [3:0] s, input  [3:0] a, input  [3:0] b);
	and AND1 (s[0], a[0], b[0]);
	and AND2 (s[1], a[1], b[1]);
	and AND3 (s[2], a[2], b[2]);
	and AND4 (s[3], a[3], b[3]);
endmodule // fand4

module for4 (output [3:0] s, input  [3:0] a, input  [3:0] b);
	or OR1 (s[0], a[0], b[0]);
	or OR2 (s[1], a[1], b[1]);
	or OR3 (s[2], a[2], b[2]);
	or OR4 (s[3], a[3], b[3]);
endmodule // for4

module test_f4;
// ------------------------- definir dados
   reg  [3:0] x;
	reg  [3:0] y;
	wire [3:0] w;
	wire [3:0] z;
	
	fand4 modulo1 (w, x, y);
	for4  modulo2 (z, x, y);
	
	initial begin: start
		x = 4'b0000; 
		y = 4'b0000;
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0031 - Marcio Santana Correa - 345368");
      $display("Test LU's module");
      $monitor("a = %3b b = %3b and = %3b or = %3b",x,y,w,z); 
		#1 
		x = 4'b0000; y = 4'b0001;  
		#1 
		x = 4'b0001; y = 4'b0010;
		#1 
		x = 4'b0010; y = 4'b0011;
		#1 
		x = 4'b0011; y = 4'b0100;
		#1 
		x = 4'b0100; y = 4'b0101;
		#1 
		x = 4'b0101; y = 4'b0110;
		#1 
		x = 4'b0110; y = 4'b0111;
		#1 
		x = 4'b0111; y = 4'b1000;
		#1 
		x = 4'b1000; y = 4'b1001;
		#1 
		x = 4'b1001; y = 4'b1010;
		#1 
		x = 4'b1010; y = 4'b1011;
		#1 
		x = 4'b1011; y = 4'b1100;
		#1 
		x = 4'b1100; y = 4'b1101;
		#1 
		x = 4'b1101; y = 4'b1110;
		#1 
		x = 4'b1110; y = 4'b1111;
		#1 
		x = 4'b1111; y = 4'b0000;
   end
endmodule // test_f4

/*
    Exemplo0031a - Marcio Santana Correa 345368
    Test LU's module
    a = 0000 b = 0000 and = 0000 or = 0000
    a = 0000 b = 0001 and = 0000 or = 0001
    a = 0001 b = 0010 and = 0000 or = 0011
    a = 0010 b = 0011 and = 0010 or = 0011
    a = 0011 b = 0100 and = 0000 or = 0111
    a = 0100 b = 0101 and = 0100 or = 0101
    a = 0101 b = 0110 and = 0100 or = 0111
    a = 0110 b = 0111 and = 0110 or = 0111
    a = 0111 b = 1000 and = 0000 or = 1111
    a = 1000 b = 1001 and = 1000 or = 1001
    a = 1001 b = 1010 and = 1000 or = 1011
    a = 1010 b = 1011 and = 1010 or = 1011
    a = 1011 b = 1100 and = 1000 or = 1111
    a = 1100 b = 1101 and = 1100 or = 1101
    a = 1101 b = 1110 and = 1100 or = 1111
    a = 1110 b = 1111 and = 1110 or = 1111
    a = 1111 b = 0000 and = 0000 or = 1111
*/