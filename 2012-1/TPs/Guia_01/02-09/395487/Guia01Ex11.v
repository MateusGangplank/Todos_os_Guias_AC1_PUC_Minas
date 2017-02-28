// ---------------------------------------
// Guia 01 Ex11 - Byte checagem com NOR
// Nome:Álvaro Henrique de Araújo Rungue
// Matricula: 395487
// ---------------------------------------


// ---------------------
// -- byte gate
// ---------------------

module bytegate ( q , p );

output q;
input [0:7] p;

assign q = ~( p[0] | p[1] | p[2] | p[3] | p[4] | p[5] | p[6] | p[7] );

endmodule //bytegate

// ---------------------
// -- teste byte gate
// ---------------------

module testebytegate;
 reg   [0:7] a;
 wire  s ;
          // instancia
 bytegate BYTE1 (s, a );
 
          // parte principal

 initial begin
 a=8'b00001000;
       $display("Guia 1 Exercicio 11 - Alvaro");
      $display("Test BYTE gate");
      $display("Checagem  = OK se retornar 1\n");
  
 		$monitor("%b %b", a ,  s );  
		#1 a = 8'b00001010;
		#1 a = 8'b11111111;
		#1 a = 8'b10001010;
		#1 a = 8'b01001010;
		#1 a = 8'b01001010;
		#1 a = 8'b00000000;
	   
   
 end

endmodule // testnandgate

