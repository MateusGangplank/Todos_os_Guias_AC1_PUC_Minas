// ---------------------
// Guia01_11 - extra01
// Nome: Bruno Cezar Andrade Viallet
// Matricula: 396679
// ---------------------

// ---------------------
// -- Nor gate
// ---------------------

module norgate (s, p);
 output s;
 input [0:7] p;

 assign s = ~(p[0] | p[1] | p[2] | p[3] | p[4] | p[5] | p[6] | p[7]);

endmodule // norgate


// ---------------------
// -- test module
// ---------------------

module testmodule;
 reg   [0:7]a;
 wire  s;
          // instancia
 norgate nor1 (s, a);
          // parte principal
 initial begin
      a=8'b00000001; // byte 
      $display("Guia01_11 - Bruno Cezar Andrade Viallet - 396679");
      $display("Test Module");
      $display("\nbyte     = s\n");
		$monitor("%b = %b", a, s);
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