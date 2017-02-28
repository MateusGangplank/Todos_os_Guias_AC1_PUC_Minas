// ---------------------
// GUIA 02 
// Nome: Luiz Marques de Oliveira
// Matricula: 417138
// ---------------------

// ---------------------
// -- NOR FEITA DE NAND 
// --------------------	-

module norgate (s, p,q);
 output s;
 input  p,q;
 wire temp1,temp2,temp3;
 nand NAND1 (temp1,p);
 nand NAND2 (temp2,q);
 nand NAND3 (temp3,temp1,temp2);
 
 assign s = ~(temp3 & temp3);
 
 endmodule // norgate
 


// ---------------------
// -- test NOR gate
// ---------------------

module testnorgate;
 reg   a,b;
 wire  s;
 
          // instancia
			 
 norgate NOR1  (s, a,b);

 
   // parte principal
 initial begin
      $display("Guia 02-Exercicio 4 ||| Luiz Marques de Oliveira || 417138");
      $display("Test NOR gate feita de NAND");
      $display("\n ~(a&b)=s \n");
      $monitor("~(%b&%b)= %b", a,s);
  
     a=0;b=0;
  #1 a=0;b=1;
  #1 a=1;b=0;
  #1 a=1;b=1;
  
 end

endmodule // testnorgate
