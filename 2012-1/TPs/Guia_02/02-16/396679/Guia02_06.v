// ---------------------
// Guia02_06 - extra01
// Nome: Bruno Cezar Andrade Viallet
// Matricula: 396679
// ---------------------

// ---------------------
// -- complemento de 1
// ---------------------
module comp1 (s, p);
 output [0:7] s;
 input [0:7] p;

 assign s = ~p;
 
endmodule // comp1


// ---------------------
// -- test module
// ---------------------

module testmodule;
 reg   [0:7] a;
 wire  [0:7] s;
          // instancia
 comp1 COMP1 (s, a);
          // parte principal
 initial begin
      a=8'b00000001; // byte 
      $display("Guia02_06 - Bruno Cezar Andrade Viallet - 396679");
      $display("Test Module");
      $display("\nbyte     complemento de 1\n");
		$monitor("%b        %b", a, s);
 #1   a=8'b00000010; // byte
 #1   a=8'b00000100; // byte   
 #1   a=8'b00001000; // byte 
 #1   a=8'b00010000; // byte  
 #1   a=8'b00100000; // byte 
 #1   a=8'b01000000; // byte 
 #1   a=8'b10000000; // byte 
 #1   a=8'b11111111; // byte 
 #1   a=8'b00000000; // byte 
 end

endmodule // testmodule