// -------------------------------
// Guia 04_04 - Meia Diferenca
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

// -------------------------------
// -- Meia Diferenca
// -------------------------------

module xorgate (x0, p, q);

output x0;
input p, q;
wire t[0:3];

nor NOR1 (t[0], p);
nor NOR2 (t[1], q);
nor NOR3 (t[2], p, q);
nor NOR4 (t[3], t[0], t[1]);
nor NOR5 (x0, t[3], t[2]); // esta saida corresponde ao d

endmodule // xorgate

module notgate (x1, a);

output x1;
input a;

nor NOR1 (x1, a);

endmodule // notgate


module andgate (x2, b, c);

output x2;
input b, c;
wire e[0:2];

nor NOR1 (e[0], c);
notgate NOT1 (e[1], b);
nor NOR2 (e[2], e[1]);
nor NOR3 (x2, e[2], e[0]); // esta saida corresponde ao Vout

endmodule // andgate

module MD (d1, Vout1, f1, g1);

output d1, Vout1;
input f1, g1;

xorgate XOR1 (d1, f1, g1);
andgate AND1 (Vout1, f1, g1);


endmodule // MD

// ---------------------
// -- test  Meia Diferenca 
// ---------------------

module TestMeiaDiferenca;

reg a, b;
wire d2, Vout2;

// isntancia
MD MD1 (d2, Vout2, a, b);

// parte principal
 initial begin
      $display("\nguia04_04 - Ludmily Caldeira da Silva - 417290\n");
      $display("Test Meia Diferenca\n");
      $display("\na  b  Vout  d\n");
      $monitor("%b  %b   %b   %b", a, b, Vout2, d2);
  
	     a=0; b=0; 
    #1  a=0; b=0;  
    #1  a=0; b=1; 
    #1  a=0; b=1; 
	 #1  a=1; b=0; 
    #1  a=1; b=0;  
    #1  a=1; b=1;
    #1  a=1; b=1; 
	  
    end
 
endmodule // TestMeiaDiferenca 

/* Resultados obtidos
  
    guia04_04 - Ludmily Caldeira da Silva - 417290
    
    Test Meia Diferenca
    
    
    a  b  Vout  d
    
    0  0   0   0
    0  1   1   1
    1  0   0   1
    1  1   0   0
 
  
*/