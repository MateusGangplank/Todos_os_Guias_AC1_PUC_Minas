// -------------------------------------
// Guia 05_02 - Diferenca Completa 3 bits
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// -------------------------------------

// -------------------------------
// -- Diferenca Completa 3 bits
// -------------------------------

module MD (d, Vem1, x, y);

output d, Vem1;
input x, y;

xor XOR1 (d, x, y);
and AND1 (Vem1, ~x, y);

endmodule // MD

module DC (d1, Vem1out, Vem1in, x1, y1);

output d1, Vem1out; 
input x1, y1, Vem1in;
wire t1, t2, t3;

MD MD1 (t1, t2, x1, y1);
MD MD2 (d1, t3, t1, Vem1in);
or OR1 (Vem1out, t3, t2);

endmodule // DC

module DC3B (diferenca, Vem1, a, b);

output [2:0]diferenca;
output Vem1;
input [2:0]a;
input [2:0]b;
wire v0, v1;

MD MD1(diferenca[0], v0, a[0], b[0]);
DC DC1 (diferenca[1], v1, v0, a[1], b[1]);
DC DC2(diferenca[2], Vem1, v1, a[2], b[2]);

endmodule // DC3B

// ---------------------------
// -- test Diferenca completa
// ---------------------------

module testDC3B;

reg [2:0]x;
reg [2:0] y;
wire [2:0]d;
wire Vem1;
integer j, k, linha;

// instancia
DC3B DC3B1 (d, Vem1, x, y);

// parte principal
 initial begin

x = 0;
y = 0;
j = 0;

end

 initial begin
      $display("\nguia05_02 - Ludmily Caldeira da Silva - 417290\n");
      $display("Test Diferenca Completa 3 bits\n");
      $display("\n        a      b    Vem1  diferenca\n");
		
      $monitor("       %3b    %3b     %b     %3b" , x, y, Vem1, d);
		
		for (j = 0; j < 8; j = j + 1) begin
					
			#1 x = j; 
								
				for (k = 0; k < 8; k = k + 1) begin
		
					#1 y = k;
					
			   end
		
	   end
				
  end
 
endmodule // testDC3B 

/* Resultados obtidos
    
     ----jGRASP exec: vvp guia05-02.vvp
    
    
    guia05_02 - Ludmily Caldeira da Silva - 417290
    
    Test Diferenca Completa 3 bits
    
    
            a      b    Vem1  diferenca
    
           000    000     0     000
           000    001     1     111
           000    010     1     110
           000    011     1     101
           000    100     1     100
           000    101     1     011
           000    110     1     010
           000    111     1     001
           001    111     1     010
           001    000     0     001
           001    001     0     000
           001    010     1     111
           001    011     1     110
           001    100     1     101
           001    101     1     100
           001    110     1     011
           001    111     1     010
           010    111     1     011
           010    000     0     010
           010    001     0     001
           010    010     0     000
           010    011     1     111
           010    100     1     110
           010    101     1     101
           010    110     1     100
           010    111     1     011
           011    111     1     100
           011    000     0     011
           011    001     0     010
           011    010     0     001
           011    011     0     000
           011    100     1     111
           011    101     1     110
           011    110     1     101
           011    111     1     100
           100    111     1     101
           100    000     0     100
           100    001     0     011
           100    010     0     010
           100    011     0     001
           100    100     0     000
           100    101     1     111
           100    110     1     110
           100    111     1     101
           101    111     1     110
           101    000     0     101
           101    001     0     100
           101    010     0     011
           101    011     0     010
           101    100     0     001
           101    101     0     000
           101    110     1     111
           101    111     1     110
           110    111     1     111
           110    000     0     110
           110    001     0     101
           110    010     0     100
           110    011     0     011
           110    100     0     010
           110    101     0     001
           110    110     0     000
           110    111     1     111
           111    111     0     000
           111    000     0     111
           111    001     0     110
           111    010     0     101
           111    011     0     100
           111    100     0     011
           111    101     0     010
           111    110     0     001
           111    111     0     000
    
     ----jGRASP: operation complete.
       */