// Guia 02 - AND
// NOme: Jessica Luisa Betonico Andrade
// Matricula : 412748

//---------------------------------------------------

//-- Construir porta AND por NOR --

//---------------------------------------------------


module nandgate(s, p, q);
  output s; 			// saida
  input p, q; 			// entrada
  
 
  wire temp1, temp2; // portas auxiliares
  
  nor NOR1(temp1, p); // operação nor com a porta p
  nor NOR2(temp2, q);			// operação nor com a porta q
  
  assign s = ~(temp1 | temp2);	// operação final
  
  
endmodule // nandgate
// fim modulo

// modulo final
module testandogate;
  reg a, b; // portas de entrada
  wire s; // porta de saida
  
  
 // instancia
 
 nandgate NAND1(s, a, b);
   
 // parte principal
 
initial begin
   $display("Guia_02_2 - Jessica Luisa Betonico Andrade - 412748");
   $display("Test NAND gate construida por NOR");
   $monitor("~(%b & %b = %b)", a, b, s);
 
 
    a=0; b=0;
	 
 #1 a=1; b=0;
 #1 a=0; b=1;
 #1 a=1; b=1;
 
end

endmodule // testandogate  