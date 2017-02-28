// -------------------------------
// Guia 05_03 - Somador Completo 4 bits
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

// -------------------------------
// -- Produtor de 3 bits
// -------------------------------

//--------- meua soma

module MS (Soma, Cout, x, y);

output Cout, Soma;
input x, y;

xor XOR1 (Soma, x, y);
and AND1 (Cout, x, y);

endmodule // MS

//------soma completa

module SC (Soma1, Cout1, x1, y1, Cin);

output Cout1, Soma1;
input x1, y1, Cin;
wire t1, t2, t3;

MS MS1 (t2, t1, x1, y1);
MS MS2 (Soma1, t3, Cin, t2);
or Or1 (Cout1, t3, t1);

endmodule // SC


module Produtor3B (p, vout, a, b);

output vout; 
output [4:0]p;
input [2:0]a;
input [2:0]b; 
wire v[0:4], t[0:9];

and AND1 (p[0], a[0], b[0]);
and AND2 (t[0], a[1], b[0]);
and AND3 (t[1], a[0], b[1]);
MS MS1 (p[1], v[0], t[0], t[1]);
and AND4 (t[2], a[2], b[0]);
and AND5 (t[3], a[1], b[1]);
and AND6 (t[4], a[0], b[2]);
SC SC1 (t[5], v[1], v[0], t[2], t[3]);
MS MS2 (p[2], v[2], t[5], t[4]);
and AND7 (t[6], a[2], b[1]);
and AND8 (t[7], a[1], b[2]);
SC SC2 (t[8], v[3], v[2], v[1], t[6]);
MS MS3 (p[3], v[4], t[8], t[7]);
and AND9 (t[9], a[2], b[2]);
SC SC3 (p[4], vout, v[4], v[3], t[9]);

endmodule // Produtor3B

// --------------------------------
// -- test Produtor de 3 bits
// --------------------------------

module testProdutor3B;

reg [2:0]x;
reg [2:0]y;
wire [4:0]p;
wire cout;
integer j, k, linha;

// instancia 
Produtor3B Produtor3B1 (p, cout, x, y);

// parte principal

initial begin

x = 0;
y = 0;
j = 0;
end

 initial begin
      $display("\nguia05_03 - Ludmily Caldeira da Silva - 417290\n");
      $display("Test Produtor de 3 bits\n");
      $display("\n        a      b      Vout   Produto\n");
		
      $monitor("       %3b    %3b     %b     %5b" , x, y, cout, p);
		
		for (j = 0; j < 8; j = j + 1) begin
					
			#1 x = j; 
								
				for (k = 0; k < 8; k = k + 1) begin
		
					#1 y = k;
					
			   end
		
	   end
				
  end
 
endmodule // testProdutor3B 

/* Resultados obtidos

       
     ----jGRASP exec: vvp guia05-03.vvp
    
    
    guia05_03 - Ludmily Caldeira da Silva - 417290
    
    Test Produtor de 3 bits
    
    
            a      b      Vout   Produto
    
           000    000     0     00000
           000    001     0     00000
           000    010     0     00000
           000    011     0     00000
           000    100     0     00000
           000    101     0     00000
           000    110     0     00000
           000    111     0     00000
           001    111     0     00111
           001    000     0     00000
           001    001     0     00001
           001    010     0     00010
           001    011     0     00011
           001    100     0     00100
           001    101     0     00101
           001    110     0     00110
           001    111     0     00111
           010    111     0     01110
           010    000     0     00000
           010    001     0     00010
           010    010     0     00100
           010    011     0     00110
           010    100     0     01000
           010    101     0     01010
           010    110     0     01100
           010    111     0     01110
           011    111     0     10101
           011    000     0     00000
           011    001     0     00011
           011    010     0     00110
           011    011     0     01001
           011    100     0     01100
           011    101     0     01111
           011    110     0     10010
           011    111     0     10101
           100    111     0     11100
           100    000     0     00000
           100    001     0     00100
           100    010     0     01000
           100    011     0     01100
           100    100     0     10000
           100    101     0     10100
           100    110     0     11000
           100    111     0     11100
           101    111     1     00011
           101    000     0     00000
           101    001     0     00101
           101    010     0     01010
           101    011     0     01111
           101    100     0     10100
           101    101     0     11001
           101    110     0     11110
           101    111     1     00011
           110    111     1     01010
           110    000     0     00000
           110    001     0     00110
           110    010     0     01100
           110    011     0     10010
           110    100     0     11000
           110    101     0     11110
           110    110     1     00100
           110    111     1     01010
           111    111     1     10001
           111    000     0     00000
           111    001     0     00111
           111    010     0     01110
           111    011     0     10101
           111    100     0     11100
           111    101     1     00011
           111    110     1     01010
           111    111     1     10001
    
     ----jGRASP: operation complete.
    
    
*/  