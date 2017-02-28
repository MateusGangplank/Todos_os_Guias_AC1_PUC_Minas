// --------------------------------
// Guia 02 - Exercicio 02
// Porta AND_NOR
// Nome: Marco Antonio Maciel Belo
// Matricula: 0410796				
// --------------------------------

// --------------------------------
// -- NOR
// --------------------------------

module norgate (s, p, q);
 output s;
 input  p, q;

 assign s = ~(p | q);

endmodule // fim do module

// --------------------------------
// -- AND_NOR
// --------------------------------

module andgate (s, p, q);
 output s;
 input  p, q;
 wire temp1,temp2;
 
 norgate nor1(temp1, p, p);
 norgate nor2(temp2, q, q);
 norgate nor3(s, temp1, temp2);

endmodule // fim do module

// ---------------------
// -- TEST AND_NOR
// ---------------------

module testAND_NOR;
 reg   a, b;
 wire  s;

 // instancia
 andgate AND1(s, a, b);
 
 initial begin
 	a = 0; b = 0;
 end
 
 // parte principal
 initial begin
      $display("Guia 02 - Exercicio 2");
		$display("\nMarco Antonio M. Belo - 410796");
      $display("\nTest AND_NOR gate");
      $display("\na | b = s\n");
		$monitor("%b | %b = %b", a,b,s);
		
		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1; 
end

endmodule // fim do module