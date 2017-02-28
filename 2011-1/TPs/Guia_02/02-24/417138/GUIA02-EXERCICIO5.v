// ---------------------
// GUIA 02 
// Nome: Luiz Marques de Oliveira
// Matricula: 417138
// ---------------------

// ---------------------
// -- NAND FEITA DE NOR 
// --------------------	-

module nandgate (s, p,q);
 output s;
 input  p,q;
 wire temp1,temp2,temp3;
 nor NOR1 (temp1,p);
 nor NOR2 (temp2,q);
 nor NOR3 (temp3,temp1,temp2);
 
 assign s = ~(temp3 | temp3);
 
 endmodule // nandgate
 


// ---------------------
// -- test NAND gate
// ---------------------

module testnandgate;
 reg   a,b;
 wire  s;
 
          // instancia
			 
 nandgate NAND1  (s, a,b);

 
   // parte principal
 initial begin
      $display("Guia 02-Exercicio 5 ||| Luiz Marques de Oliveira || 417138");
      $display("Test NAND gate feita de NOR");
      $display("\n ~(a&b)=s \n");
      $monitor("~(%b & %b) = %b", a,b,s);
  
     a=0;b=0;
  #1 a=0;b=1;
  #1 a=1;b=0;
  #1 a=1;b=1;
  
 end

endmodule // testnandgate
