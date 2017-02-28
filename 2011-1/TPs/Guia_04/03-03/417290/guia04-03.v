// -------------------------------
// Guia 04_03 - Diferenca Completa
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

// -------------------------------
// -- Diferenca Completa
// -------------------------------

module MD (d, Vout, x, y);

output d, Vout;
input x, y;

xor XOR1 (d, x, y);
and AND1 (Vout, ~x, y);

endmodule // MD

module DC (d1, Vout1, Vin, x1, y1);

output d1, Vout1; 
input x1, y1, Vin;
wire t1, t2, t3;

MD MD1 (t1, t2, x1, y1);
MD MD2 (d1, t3, t1, Vin);
or OR1 (Vout1, t3, t2);

endmodule // DC

// ---------------------
// -- test Diferenca completa
// ---------------------

module TestDiferencaCompleta;

reg a, b, Vin1;
wire d2, Vout2;

// instancia
DC DC1 (d2, Vout2, Vin1, a, b);

// parte principal
 initial begin
      $display("\nguia04_03 - Ludmily Caldeira da Silva - 417290\n");
      $display("Test Diferenca completa\n");
      $display("\na  b  Vin  Vout  d\n");
      $monitor("%b  %b   %b    %b    %b", a, b, Vin1, Vout2, d2);
  
	     a=0; b=0; Vin1 =0;
    #1  a=0; b=0; Vin1 =1; 
    #1  a=0; b=1; Vin1 =0;
    #1  a=0; b=1; Vin1 =1; 
	 #1  a=1; b=0; Vin1 =0;
    #1  a=1; b=0; Vin1 =1; 
    #1  a=1; b=1; Vin1 =0;
    #1  a=1; b=1; Vin1 =1; 
	  
    end
 
endmodule // TestDiferencaCompleta 

/* Resultados obtidos

    guia04_03 - Ludmily Caldeira da Silva - 417290
    
    Test Diferenca completa
    
    
    a  b  Vin  Vout  d
    
    0  0   0    0    0
    0  0   1    1    1
    0  1   0    1    1
    0  1   1    1    0
    1  0   0    0    1
    1  0   1    0    0
    1  1   0    0    0
    1  1   1    1    1

*/