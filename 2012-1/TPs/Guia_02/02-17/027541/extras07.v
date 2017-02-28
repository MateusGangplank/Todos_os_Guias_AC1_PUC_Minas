// ------------------------- 
// Exercicios07 - BASE 
// Nome: Milton costa teles da silva
// Matricula: 002751 
// -------------------------
// ---------------------
// -- complemento de 2
// ---------------------
module comp2 (s, p);
  output [0:7] s;
  input  [0:7] p;
  wire   [0:7] t;
 
  assign t = ~p;
  assign s = t + 1'b1;
 
endmodule // comp2

// ---------------------
// -- test module
// ---------------------

module testmodule;
  reg   [0:7] a;
  wire  [0:7] s;
           // instancia
  comp2 COMP2 (s, a);
           // parte principal
  initial begin
      a=8'b00000001; // byte 
      $display("extras07 - Milton costa teles da silva - 002751");
      $display("Test Module");
      $display("\n byte     complemento de 2\n");
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