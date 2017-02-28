// -------------------------------
// Guia 05_01 - Somador Completo 4 bits
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

// -------------------------------
// -- Somador Completo 4 bits
// -------------------------------

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

module SomadorCompleto4Bits (s, vout, a, b);

output vout; 
output [3:0]s;
input [3:0]a;
input [3:0]b; 
wire v0, v1, v2;

MS MS1 (s[0], v0, a[0], b[0]);
SC SC1 (s[1], v1, a[1], b[1], v0);
SC SC2 (s[2], v2, a[2], b[2], v1);
SC SC3 (s[3], vout, a[3], b[3], v2);

endmodule // SomadorCompleto4Bits

// --------------------------------
// -- test Somador Completo 4 bits
// --------------------------------

module testSomadorCompleto4Bits;

reg [3:0]x;
reg [3:0]y;
wire [3:0]s;
wire cout;
integer j, k, linha;

// instancia 
SomadorCompleto4Bits SC41 (s, cout, x, y);

// parte principal

initial begin

x = 0;
y = 0;
j = 0;

end

 initial begin
      $display("\nguia05_01 - Ludmily Caldeira da Silva - 417290\n");
      $display("Test Somador Completo 4 bits\n");
      $display("\n       a      b      Cout   Soma\n");
		
      $monitor("     %4b    %4b     %b     %4b" , x, y, cout, s);
		
		for (j = 0; j < 16; j = j + 1) begin
					
			#1 x = j; 
								
				for (k = 0; k < 16; k = k + 1) begin
		
					#1 y = k; 
					
			   end
		
	   end
				
  end
 
endmodule // testSomadorCompleto4Bits 

/* Resultados obtidos
     ----jGRASP exec: vvp guia05-01.vvp
    
    
    guia05_01 - Ludmily Caldeira da Silva - 417290
    
    Test Somador Completo 4 bits
    
    
           a      b      Cout   Soma
    
         0000    0000     0     0000
         0000    0001     0     0001
         0000    0010     0     0010
         0000    0011     0     0011
         0000    0100     0     0100
         0000    0101     0     0101
         0000    0110     0     0110
         0000    0111     0     0111
         0000    1000     0     1000
         0000    1001     0     1001
         0000    1010     0     1010
         0000    1011     0     1011
         0000    1100     0     1100
         0000    1101     0     1101
         0000    1110     0     1110
         0000    1111     0     1111
         0001    1111     1     0000
         0001    0000     0     0001
         0001    0001     0     0010
         0001    0010     0     0011
         0001    0011     0     0100
         0001    0100     0     0101
         0001    0101     0     0110
         0001    0110     0     0111
         0001    0111     0     1000
         0001    1000     0     1001
         0001    1001     0     1010
         0001    1010     0     1011
         0001    1011     0     1100
         0001    1100     0     1101
         0001    1101     0     1110
         0001    1110     0     1111
         0001    1111     1     0000
         0010    1111     1     0001
         0010    0000     0     0010
         0010    0001     0     0011
         0010    0010     0     0100
         0010    0011     0     0101
         0010    0100     0     0110
         0010    0101     0     0111
         0010    0110     0     1000
         0010    0111     0     1001
         0010    1000     0     1010
         0010    1001     0     1011
         0010    1010     0     1100
         0010    1011     0     1101
         0010    1100     0     1110
         0010    1101     0     1111
         0010    1110     1     0000
         0010    1111     1     0001
         0011    1111     1     0010
         0011    0000     0     0011
         0011    0001     0     0100
         0011    0010     0     0101
         0011    0011     0     0110
         0011    0100     0     0111
         0011    0101     0     1000
         0011    0110     0     1001
         0011    0111     0     1010
         0011    1000     0     1011
         0011    1001     0     1100
         0011    1010     0     1101
         0011    1011     0     1110
         0011    1100     0     1111
         0011    1101     1     0000
         0011    1110     1     0001
         0011    1111     1     0010
         0100    1111     1     0011
         0100    0000     0     0100
         0100    0001     0     0101
         0100    0010     0     0110
         0100    0011     0     0111
         0100    0100     0     1000
         0100    0101     0     1001
         0100    0110     0     1010
         0100    0111     0     1011
         0100    1000     0     1100
         0100    1001     0     1101
         0100    1010     0     1110
         0100    1011     0     1111
         0100    1100     1     0000
         0100    1101     1     0001
         0100    1110     1     0010
         0100    1111     1     0011
         0101    1111     1     0100
         0101    0000     0     0101
         0101    0001     0     0110
         0101    0010     0     0111
         0101    0011     0     1000
         0101    0100     0     1001
         0101    0101     0     1010
         0101    0110     0     1011
         0101    0111     0     1100
         0101    1000     0     1101
         0101    1001     0     1110
         0101    1010     0     1111
         0101    1011     1     0000
         0101    1100     1     0001
         0101    1101     1     0010
         0101    1110     1     0011
         0101    1111     1     0100
         0110    1111     1     0101
         0110    0000     0     0110
         0110    0001     0     0111
         0110    0010     0     1000
         0110    0011     0     1001
         0110    0100     0     1010
         0110    0101     0     1011
         0110    0110     0     1100
         0110    0111     0     1101
         0110    1000     0     1110
         0110    1001     0     1111
         0110    1010     1     0000
         0110    1011     1     0001
         0110    1100     1     0010
         0110    1101     1     0011
         0110    1110     1     0100
         0110    1111     1     0101
         0111    1111     1     0110
         0111    0000     0     0111
         0111    0001     0     1000
         0111    0010     0     1001
         0111    0011     0     1010
         0111    0100     0     1011
         0111    0101     0     1100
         0111    0110     0     1101
         0111    0111     0     1110
         0111    1000     0     1111
         0111    1001     1     0000
         0111    1010     1     0001
         0111    1011     1     0010
         0111    1100     1     0011
         0111    1101     1     0100
         0111    1110     1     0101
         0111    1111     1     0110
         1000    1111     1     0111
         1000    0000     0     1000
         1000    0001     0     1001
         1000    0010     0     1010
         1000    0011     0     1011
         1000    0100     0     1100
         1000    0101     0     1101
         1000    0110     0     1110
         1000    0111     0     1111
         1000    1000     1     0000
         1000    1001     1     0001
         1000    1010     1     0010
         1000    1011     1     0011
         1000    1100     1     0100
         1000    1101     1     0101
         1000    1110     1     0110
         1000    1111     1     0111
         1001    1111     1     1000
         1001    0000     0     1001
         1001    0001     0     1010
         1001    0010     0     1011
         1001    0011     0     1100
         1001    0100     0     1101
         1001    0101     0     1110
         1001    0110     0     1111
         1001    0111     1     0000
         1001    1000     1     0001
         1001    1001     1     0010
         1001    1010     1     0011
         1001    1011     1     0100
         1001    1100     1     0101
         1001    1101     1     0110
         1001    1110     1     0111
         1001    1111     1     1000
         1010    1111     1     1001
         1010    0000     0     1010
         1010    0001     0     1011
         1010    0010     0     1100
         1010    0011     0     1101
         1010    0100     0     1110
         1010    0101     0     1111
         1010    0110     1     0000
         1010    0111     1     0001
         1010    1000     1     0010
         1010    1001     1     0011
         1010    1010     1     0100
         1010    1011     1     0101
         1010    1100     1     0110
         1010    1101     1     0111
         1010    1110     1     1000
         1010    1111     1     1001
         1011    1111     1     1010
         1011    0000     0     1011
         1011    0001     0     1100
         1011    0010     0     1101
         1011    0011     0     1110
         1011    0100     0     1111
         1011    0101     1     0000
         1011    0110     1     0001
         1011    0111     1     0010
         1011    1000     1     0011
         1011    1001     1     0100
         1011    1010     1     0101
         1011    1011     1     0110
         1011    1100     1     0111
         1011    1101     1     1000
         1011    1110     1     1001
         1011    1111     1     1010
         1100    1111     1     1011
         1100    0000     0     1100
         1100    0001     0     1101
         1100    0010     0     1110
         1100    0011     0     1111
         1100    0100     1     0000
         1100    0101     1     0001
         1100    0110     1     0010
         1100    0111     1     0011
         1100    1000     1     0100
         1100    1001     1     0101
         1100    1010     1     0110
         1100    1011     1     0111
         1100    1100     1     1000
         1100    1101     1     1001
         1100    1110     1     1010
         1100    1111     1     1011
         1101    1111     1     1100
         1101    0000     0     1101
         1101    0001     0     1110
         1101    0010     0     1111
         1101    0011     1     0000
         1101    0100     1     0001
         1101    0101     1     0010
         1101    0110     1     0011
         1101    0111     1     0100
         1101    1000     1     0101
         1101    1001     1     0110
         1101    1010     1     0111
         1101    1011     1     1000
         1101    1100     1     1001
         1101    1101     1     1010
         1101    1110     1     1011
         1101    1111     1     1100
         1110    1111     1     1101
         1110    0000     0     1110
         1110    0001     0     1111
         1110    0010     1     0000
         1110    0011     1     0001
         1110    0100     1     0010
         1110    0101     1     0011
         1110    0110     1     0100
         1110    0111     1     0101
         1110    1000     1     0110
         1110    1001     1     0111
         1110    1010     1     1000
         1110    1011     1     1001
         1110    1100     1     1010
         1110    1101     1     1011
         1110    1110     1     1100
         1110    1111     1     1101
         1111    1111     1     1110
         1111    0000     0     1111
         1111    0001     1     0000
         1111    0010     1     0001
         1111    0011     1     0010
         1111    0100     1     0011
         1111    0101     1     0100
         1111    0110     1     0101
         1111    0111     1     0110
         1111    1000     1     0111
         1111    1001     1     1000
         1111    1010     1     1001
         1111    1011     1     1010
         1111    1100     1     1011
         1111    1101     1     1100
         1111    1110     1     1101
         1111    1111     1     1110
    
     ----jGRASP: operation complete.
     
	  */