// -------------------------
// Exercicio 3
// Nome: Gabriel Benjamim de Carvalho
// Matricula: 396690
// ------------------------- 
 
// -------------------------
//  Exercicio 3
// ------------------------- 
 
module complemento2;
// ------------------------- definir dados 
      reg [5:0] a; 
      reg [4:0] b;
      reg [3:0] c; 
      reg [9:0] d;
		 
// ------------------------- parte principal 
 initial begin 
      $display("Exercicio 3 - Gabriel Benjamim de Carvalho - 396690");
      $display("Complemento de dois.");
 
	  
   a = ~6'b100111 +1  ;
   a = ~6'o54 + 1;
   c =  ~13 + 1;
   b = ~5'h1B + 1;
   a = 25 + (~36+1);


   $display ("Complemento de dois. - 100111(2) = %6b", a);
   $display ("Complemento de dois. - 54(8) = %6b", a);
   $display ("Complemento de dois. - 13(10) = %4b", c);
   $display ("Complemento de dois. - 1B(16) = %5b", b);
   $display ("Complemento de dois. - 25 - 36 = %6b", a);

end

endmodule // complemento2