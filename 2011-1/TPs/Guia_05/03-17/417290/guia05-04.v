// ----------------------------------------------
// Guia 05_04 - Somador Completo 3 bits com nand
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// ----------------------------------------------

// -------------------------------
// -- Somador Completo 3 bits
// -------------------------------

module MS (s, Vout, p, q);
 
output s, Vout;
input  p, q;
wire temp[0:8];

nand NAND1 (temp[0], p);
nand NAND2 (temp[1], temp[0], q);
nand NAND3 (temp[2], temp[1]);
nand NAND4 (temp[3], temp[2]);
nand NAND5 (temp[4], q);
nand NAND6 (temp[5], p, temp[4]);
nand NAND7 (temp[6], temp[5]);
nand NAND8 (temp[7], temp[6]);
nand NAND9 (s, temp[7], temp[3]);
nand NAND10 (temp[8], p, q);
nand NAND11 (Vout, temp[8]);

endmodule // MS

module ornand (s, p, q);

output s;
input p, q;
wire t1, t2;

nand NAND1(t1, p);
nand NAND2(t2, q);
nand NAND3(s, t1, t2);

endmodule // ornand

module SC (Soma1, Cout1, x1, y1, Cin);

output Cout1, Soma1;
input x1, y1, Cin;
wire t1, t2, t3;

MS MS1 (t2, t1, x1, y1);
MS MS2 (Soma1, t3, Cin, t2);
ornand Or1 (Cout1, t3, t1);

endmodule // SC

module SC3B (s, vout, a, b);

output vout; 
output [2:0]s;
input [2:0]a;
input [2:0]b; 
wire v0, v1;

MS MS1 (s[0], v0, a[0], b[0]);
SC SC1 (s[1], v1, a[1], b[1], v0);
SC SC2 (s[2], vout, a[2], b[2], v1);

endmodule // SC3B

// --------------------------------
// -- test Somador Completo 4 bits
// --------------------------------

module testSC3B;

reg [2:0]x;
reg [2:0]y;
wire [2:0]s;
wire cout;
integer j, k, linha;

// instancia 
SC3B SC3B1 (s, cout, x, y);

// parte principal

initial begin

x = 0;
y = 0;
j = 0;

end

 initial begin
      $display("\nguia05_04 - Ludmily Caldeira da Silva - 417290\n");
      $display("Test Somador Completo 3 bits com nand\n");
      $display("\n      a      b      Cout   Soma\n");
		
      $monitor("     %3b    %3b     %b     %3b" , x, y, cout, s);
		
		for (j = 0; j < 8; j = j + 1) begin
					
			#1 x = j; 
								
				for (k = 0; k < 8; k = k + 1) begin
		
					#1 y = k;
					
			   end
		
	   end
				
  end
 
endmodule // testSomadorCompleto4Bits 

/* Resultados obtidos

        
     ----jGRASP exec: vvp guia05-04.vvp
    
    
    guia05_04 - Ludmily Caldeira da Silva - 417290
    
    Test Somador Completo 3 bits com nand
    
    
          a      b      Cout   Soma
    
         000    000     0     000
         000    001     0     001
         000    010     0     010
         000    011     0     011
         000    100     0     100
         000    101     0     101
         000    110     0     110
         000    111     0     111
         001    111     1     000
         001    000     0     001
         001    001     0     010
         001    010     0     011
         001    011     0     100
         001    100     0     101
         001    101     0     110
         001    110     0     111
         001    111     1     000
         010    111     1     001
         010    000     0     010
         010    001     0     011
         010    010     0     100
         010    011     0     101
         010    100     0     110
         010    101     0     111
         010    110     1     000
         010    111     1     001
         011    111     1     010
         011    000     0     011
         011    001     0     100
         011    010     0     101
         011    011     0     110
         011    100     0     111
         011    101     1     000
         011    110     1     001
         011    111     1     010
         100    111     1     011
         100    000     0     100
         100    001     0     101
         100    010     0     110
         100    011     0     111
         100    100     1     000
         100    101     1     001
         100    110     1     010
         100    111     1     011
         101    111     1     100
         101    000     0     101
         101    001     0     110
         101    010     0     111
         101    011     1     000
         101    100     1     001
         101    101     1     010
         101    110     1     011
         101    111     1     100
         110    111     1     101
         110    000     0     110
         110    001     0     111
         110    010     1     000
         110    011     1     001
         110    100     1     010
         110    101     1     011
         110    110     1     100
         110    111     1     101
         111    111     1     110
         111    000     0     111
         111    001     1     000
         111    010     1     001
         111    011     1     010
         111    100     1     011
         111    101     1     100
         111    110     1     101
         111    111     1     110
    
     ----jGRASP: operation complete.
        
*/