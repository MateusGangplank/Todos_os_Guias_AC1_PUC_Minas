// -------------------------------
// Guia 04_02 - Soma Completa
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

// -------------------------------
// -- Soma Completa
// -------------------------------

module MS (Cout, Soma, x, y);

output Cout, Soma;
input x, y;

and AND1 (Soma, x, y);
xor XOR1 (Cout, x, y);

endmodule // MS

module SC (Cout1, Soma1, x1, y1, Cin);

output Cout1, Soma1;
input x1, y1, Cin;
wire t1, t2, t3;

MS MS1 (t1, t2, x1, y1);
MS MS2 (Soma1, t3, Cin, t1);
or Or1 (Cout1, t3, t2);

endmodule // SC

// ---------------------
// -- test Soma completa
// ---------------------

module TestSomaCompleta;

wire Cout2, Soma2;
reg a, b, Cin1;

// instancia
SC SC1 (Cout2, Soma2, a, b, Cin1);

// parte principal
 initial begin
      $display("\nguia04_02 - Ludmily Caldeira da Silva - 417290\n");
      $display("Test Soma completa\n");
      $display("\na  b  Cin  Cout  s\n");
      $monitor("%b  %b   %b    %b    %b", a, b, Cin1, Cout2, Soma2);
  
	     a=0; b=0; Cin1 =0;
    #1  a=0; b=0; Cin1 =1; 
    #1  a=0; b=1; Cin1 =0;
    #1  a=0; b=1; Cin1 =1; 
	 #1  a=1; b=0; Cin1 =0;
    #1  a=1; b=0; Cin1 =1; 
    #1  a=1; b=1; Cin1 =0;
    #1  a=1; b=1; Cin1 =1; 
	  
    end
 
endmodule // TestSomaCompleta 

/* Resultados obtidos

    guia04_02 - Ludmily Caldeira da Silva - 417290
    
    Test Soma completa
    
    
    a  b  Cin  Cout  s
    
    0  0   0    0    0
    0  0   1    0    1
    0  1   0    0    1
    0  1   1    1    0
    1  0   0    0    1
    1  0   1    1    0
    1  1   0    1    0
    1  1   1    1    1
    


*/