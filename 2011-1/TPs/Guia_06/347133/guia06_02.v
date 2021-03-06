//NOME: Henrique Carvalho Parreira
//MATRICULA: 347133

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

module compAritmetico (menor, maior, a, b);

output menor, maior;
input [3:0]a;
input [3:0]b;
wire t[0:7];
wire t1, t2, t3, t4;


xnor XNOR2 (t2, a[1], b[1]);
xnor XNOR3 (t3, a[2], b[2]);
xnor XNOR4 (t4, a[3], b[3]);

and AND1 (t[0], a[0], ~b[0], t4, t3, t2);
and AND2 (t[1], a[1], ~b[1], t4, t3);
and AND3 (t[2], a[2], ~b[2], t4);
and AND4 (t[3], a[3], ~b[3]);

or OR1 (maior, t[0], t[1], t[2], t[3]);

and AND5 (t[4], ~a[0], b[0], t4, t3, t2);
and AND6 (t[5], ~a[1], b[1], t4, t3);
and AND7 (t[6], ~a[2], b[2], t4);
and AND8 (t[7], ~a[3], b[3]);

or OR2 (menor, t[4], t[5], t[6], t[7]);

endmodule // compAritmetico

module SomaSubLogAri (maior, menor, s1, s, vout, a, b, sel);

output vout, s1, maior, menor; 
output [3:0]s;
input sel;
input [3:0]a;
input [3:0]b; 
wire v[0:6];

xor XOR1 (v[0], sel, b[0]);
xor XOR2 (v[1], sel, b[1]);
xor XOR3 (v[2], sel, b[2]);
xor XOR4 (v[3], sel, b[3]);

SC SC0 (s[0], v[4], a[0], v[0], sel);
SC SC1 (s[1], v[5], a[1], v[1], v[4]);
SC SC2 (s[2], v[6], a[2], v[2], v[5]);
SC SC3 (s[3], vout, a[3], v[3], v[6]);


compLogico compLogico1 (s1, a, b);

compAritmetico CA (menor, maior, a, b);

endmodule // SomaSubLogAri

// -- test Somador subtrator 4 bits comp aritmetico

module testSomaSubLogAri;

reg [3:0]x;
reg [3:0]y;
reg sel;
wire [3:0]s;
wire s1;
wire cout, maior, menor;
integer j, k;

// instancia 
SomaSubLogAri SC41 (maior, menor, s1, s, cout, x, y, sel);

// parte principal

initial begin
sel = 0;
x = 0;
y = 0;
j = 0;

end

 initial begin 

      $display("Test Somador Completo 4 bits com comparador logico e aritmetico\n");      
		$display("\nSel       a      b      Cout   Soma/Subt   a = b   a > b   a < b\n");
      $monitor("%b     %4b    %4b     %b     %4b       %b          %b       %b" , sel, x, y, cout, s, s1, maior, menor);
		
		for (j = 0; j < 16; j = j + 1) begin
					
			#1 x = j;		
													
				for (k = 0; k < 16; k = k + 1) begin
		
					#1 y = k; 					
								
			   end
				
		   end
					
			for (j = 0; j < 16; j = j + 1) begin
					
			#1 x = j; sel = 1;
													
				for (k = 0; k < 16; k = k + 1) begin
		
					#1 y = k; 					
								
			   end
		
	   end		
				
  end
 
endmodule // testSomaSubLogAri 
