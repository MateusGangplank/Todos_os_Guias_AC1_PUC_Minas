// ------------------------- 
// Extras07 - BASE 
// Nome: Milton costa teles da silva
// Matricula: 002751 
// -------------------------
// ---------------------
// -- complemento de 2
// ---------------------
module comp2 (output[0:7] s, input [0:7] p);
  assign s = (~p) + 1'b1;
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
      a=8'b00000000; // byte 
      $display("extras07 - Milton costa teles da silva - 002751");
      $display("Test Module");
      $display("\n byte     complemento de 2\n");
		$monitor("%8b        %8b", a, s);
      #1   a=8'b00000001; 
      #1   a=8'b00000010;    
      #1   a=8'b00000011; 
      #1   a=8'b00000100;  
      #1   a=8'b00000101;  
      #1   a=8'b00000110;
		#1   a=8'b00000111;   
      #1   a=8'b00001000; 
      #1   a=8'b00010000;
	   #1   a=8'b00100000; 
      #1   a=8'b01000000;
		#1   a=8'b10000000;  
      #1   a=8'b11111111;  
 end
endmodule // testmodule