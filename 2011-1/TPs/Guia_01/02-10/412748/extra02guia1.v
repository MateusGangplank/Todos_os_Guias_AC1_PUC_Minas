// Guia 01  -  Extra 02 -  XOR
// Nome : Jessica Luisa Betonico Andrade
// Matricula: 412748	

//  ----------------------------------------------------

//  --  xor gate  --

// --------------------------------------------------------


module xorgate(s, p, q);
 output s;
 input p, q;
 
 assign s = ~(p)&q|p&~(q);
 
 endmodule // xorgate
 
 // -----------------------------------------------
 
 // -- teste xor gate --
 
 // -----------------------------------------------
 
 module testandogate;
  reg a , b;
  wire s;
  
  			// instancia
			
	xorgate XOR1(s, a, b);
	
			// parte principal
			
	initial begin
	
	$display("Guia 01 - Jessica Luisa Betonico Andrade - 412748");
	$display(" Teste XOR gate");
	$display("\n ~(a)&b|a&~(b) = s \n");
	a= 0; b=0;
	
	#1 $display("%b ^ %b = %b",a, b, s);
	a = 0; b =1;
	
	#1 $display("%b ^ %b = %b",a, b, s);
	a = 1; b =0;
	
	#1 $display("%b ^ %b = %b",a, b, s);
	a = 1; b =1;
	
   #1 $display("%b ^ %b = %b",a, b, s);

end

endmodule // testandogate
	
	