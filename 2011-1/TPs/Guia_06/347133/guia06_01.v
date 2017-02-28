// NOME: Henrique Carvalho Parreira
// MATRICULA: 347133

module MS (Soma, Cout, x, y);

output Cout, Soma;
input x, y;

xor XOR1 (Soma, x, y);
and AND1 (Cout, x, y);

endmodule // MS

module SC (Soma1, Cout1, x1, y1, Cin);

output Cout1, Soma1;
input x1, y1, Cin;
wire t1, t2, t3;

MS MS1 (t2, t1, x1, y1);
MS MS2 (Soma1, t3, Cin, t2);
or Or1 (Cout1, t3, t1);

endmodule // SC

module compLogico (s, a, b);

output s;
input [3:0]a;
input [3:0]b;
wire t1, t2, t3, t4;

xnor XNOR1 (t1, a[0], b[0]);
xnor XNOR2 (t2, a[1], b[1]);
xnor XNOR3 (t3, a[2], b[2]);
xnor XNOR4 (t4, a[3], b[3]);
and AND1 (s, t1, t2, t3, t4);

endmodule // compLogico

module SomadorCompleto4BitsComComp (s1, s, vout, a, b);

output vout, s1; 
output [3:0]s;
input [3:0]a;
input [3:0]b; 
wire v0, v1, v2;

MS MS1 (s[0], v0, a[0], b[0]);
SC SC1 (s[1], v1, a[1], b[1], v0);
SC SC2 (s[2], v2, a[2], b[2], v1);
SC SC3 (s[3], vout, a[3], b[3], v2);
compLogico compLogico1 (s1, a, b);

endmodule // SomadorCompleto4Bits


// -- test Somador Completo 4 bits


module testSomadorCompleto4BitsComComp;

reg [3:0]x;
reg [3:0]y;
wire [3:0]s;
wire s1;
wire cout;
integer j, k, linha;

// instancia 
SomadorCompleto4BitsComComp SC41 (s1, s, cout, x, y);

// parte principal

initial begin

x = 0;
y = 0;
j = 0;

end

 initial begin
      $display("Test Somador Completo 4 bits com comparador logico\n");
      $display("\n       a      b      Cout   Soma   comparador\n");
		
      $monitor("     %4b    %4b     %b     %4b     %b" , x, y, cout, s, s1);
		
		for (j = 0; j < 16; j = j + 1) begin
					
			#1 x = j; 
								
				for (k = 0; k < 16; k = k + 1) begin
		
					#1 y = k; 
					
			   end
		
	   end
				
  end
 
endmodule // testSomadorCompleto4BitsComComp 
	  