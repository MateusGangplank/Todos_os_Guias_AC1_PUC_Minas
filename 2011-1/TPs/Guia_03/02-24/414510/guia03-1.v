// ---------------------
// Guia 03_01 - Meia Soma AND
// Nome: Marley Ribeiro
// Matricula: 414510
// ---------------------

// ---------------------
// -- meia soma
// ---------------------

module meiasoma (y, u, a, b);
 output y, u;
 input  a, b;
 wire temp2,temp3;
 
 or orgate1(temp2, a, b);
 nand nandgate1 (temp3, a, b);   // DEVERIA TER USADO UMA PORTA not
 and andgate1( u, a, b);
 and andgate2 (y,temp2, temp3);


endmodule // meia soma

// --------------------------
// -- test meia soma and
// --------------------------

module testmeiasoma;
 reg   g, h;             
 wire  y, u;

// instancia

 meiasoma MEIASOMA1 (y, u, g, h);

 initial begin


      
		$display("Guia 03-01 - Marley Ribeiro - 414510");
      $display("Test Meia Soma gate");
      $display("\n a & b = y u\n");
      $monitor(" %b & %b = %b %b", g, h, y, u);

      g=0; h=0;
  #1  g=0; h=1; 
  #1  g=1; h=0; 
  #1  g=1; h=1; 
  
 end

endmodule // testmeiasoma
