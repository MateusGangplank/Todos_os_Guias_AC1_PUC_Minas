// ---------------------
// GUIA 02 
// Nome: Luiz Marques de Oliveira
// Matricula: 417138
// ---------------------

// ---------------------
// -- NOT FEITA DE NAND 
// --------------------	-

module notgate (s, p);
 output s;
 input  p;
 
 assign s = ~(p & p);
 
 endmodule // notgate
 


// ---------------------
// -- test NOT gate
// ---------------------

module testnotgate;
 reg   a;
 wire  s;
 
          // instancia
			 
 notgate NOT1  (s, a);

 
   // parte principal
 initial begin
      $display("Guia 02-Exercicio 3 ||| Luiz Marques de Oliveira || 417138");
      $display("Test NOT gate feita com NAND");
      $display("\n ~(a)=s \n");
      $monitor("~(%b)= %b", a,s);
  
     a=0;
  #1 a=1;
  
 end

endmodule // testnotgate
