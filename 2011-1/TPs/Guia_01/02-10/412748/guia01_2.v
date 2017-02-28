// Guia 01  -  NOR
// Nome : Jessica Luisa Betonico Andrade
// Matricula: 412748

// ----------------------------------------------

// --  nor gate  --

// ----------------------------------------------

module norgate(s, p, q, r);
 output s;
 input p, q, r;
 
 assign s = ~(p | q | r);
 
 endmodule // norgate
 
// -------------------------------------------------

// -- teste nor gate --

// -------------------------------------------------

module testandogate;
 reg a , b, c;
 wire s;
 
		// instancia		
 norgate NOR1(s, a, b, c);
 
 		// parte principal
		
 initial begin
 
 $display("Guia 01 -  Jessica Luisa Betonico Andrade - 412748");
 $display("Test NOR gate");
 $display("\n ~(a | b | c) = s \n ");
	a=0; b=0; c=0;
	
#1 $display("%b | %b | %b = %b", a, b, c, s);
	a=0; b=0; c=1;
#1 $display("%b | %b | %b = %b", a, b, c, s);
	a=0; b=1; c=0;
#1 $display("%b | %b | %b = %b", a, b, c, s);
	a=1; b=0; c=0;	
#1 $display("%b | %b | %b = %b", a, b, c, s);
	a=0; b=1; c=1;
#1 $display("%b | %b | %b = %b", a, b, c, s);
	a=1; b=0; c=1;
#1 $display("%b | %b | %b = %b", a, b, c, s);
	a=1; b=1; c=0;
#1 $display("%b | %b | %b = %b", a, b, c, s);
	a=1; b=1; c=1;
#1 $display("%b | %b | %b = %b", a, b, c, s);


end 

endmodule // testandogate