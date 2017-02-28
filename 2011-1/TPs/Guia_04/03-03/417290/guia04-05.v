// -------------------------------
// Guia 04_05 - Diferenca Completa
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

// -------------------------------
// -- Diferenca Completa
// -------------------------------

//--- xorde nand
module xorgate (s0, f, g);

output s0;
input f, g;
wire t[0:2];

nand NAND1 (t[0], f, g);
nand NAND2 (t[1], t[0], f);
nand NAND3 (t[2], t[0], g);
nand NAND4 (s0, t[1], t[2]);

endmodule // xorgate

//--- and de nand
module andgate (s1, f1, g1);

output s1;
input f1, g1;
wire t0;

nand NAND1 (t0, f1, g1);
nand NAND2 (s1, t0);

endmodule // andgate

//--- or de nand
module orgate (s2, f2, g2);

output s2;
input f2, g2;
wire t1, t2;

nand NAND1 (t1, f2);
nand NAND2 (t2, g2);
nand NAND3 (s2, t1, t2);

endmodule // orgate

//--- not de nand
module notgate (s3, f3);

output s3;
input f3;

nand NAND1 (s3, f3);

endmodule // notgate

//--- meia diferenca
module MD (d, Vout, x, y);

output d, Vout;
input x, y;
wire t1;

xorgate XOR1 (d, x, y);
notgate NOT1 (t1, x);
andgate AND1 (Vout, t1, y);

endmodule // MD

//--- diferenca completa
module DC (d1, Vout1, Vin, x1, y1);

output d1, Vout1; 
input x1, y1, Vin;
wire t1, t2, t3;

MD MD1 (t1, t2, x1, y1);
MD MD2 (d1, t3, t1, Vin);
orgate OR1 (Vout1, t3, t2);

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
      $display("\nguia04_05 - Ludmily Caldeira da Silva - 417290\n");
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

    guia04_05 - Ludmily Caldeira da Silva - 417290
    
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