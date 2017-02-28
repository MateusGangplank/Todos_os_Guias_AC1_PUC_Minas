// ------------------------- 
// Exemplo0021 - FULL ADDER 
// Nome: Michelle Da Costa Silva 
// Matricula: 427448
// ------------------------- 

// ------------------------- 
// full adder 
// ------------------------- 

  module halfAdder (output saida, output carryOut, input entrada1, input entrada2); 

		xor XOR1 (saida, entrada1, entrada2);
      and AND1 (carryOut, entrada1, entrada2);
       
	 endmodule // halfAdder 
	 
  module fullAdder (output saida, output carryOut, input entrada1, input entrada2, input carryIn); 

		wire [2:0]s; 

      halfAdder HA1 (s[0], s[1], entrada1, entrada2);
		halfAdder HA2 (saida, s[2], s[0], carryIn);
		
		or OR1 (carryOut, s[1], s[2]);	 
	     
	 endmodule // fullAdder 

  module fullAdder2 (output [3:0]saida, output carryOut, input [3:0]entrada1, input [3:0]entrada2, input carryIn); 

      wire [2:0]s;
		
		fullAdder FA1 (saida[0], s[0], entrada1[0], entrada2[0], carryIn);
		fullAdder FA2 (saida[1], s[1], entrada1[1], entrada2[1], s[0]);
		fullAdder FA3 (saida[2], s[2], entrada1[2], entrada2[2], s[1]);
		fullAdder FA4 (saida[3], carryOut, entrada1[3], entrada2[3], s[2]);

    endmodule // fullAdder2 

// ------------------------- 
// -- test full adder
// -------------------------
    
	  module test_fullAdder2; 

// ------------------------- definir dados 
    
	 reg  [3:0] x;
	 reg  [3:0] y;
	 reg  cIn;
	 wire [3:0] s;
	 wire cOut;

// ------------------------- instancia 
	 
     fullAdder2 modulo (s, cOut, x, y, cIn);
	  
// ------------------------- parte principal 

    initial begin 
    $display("Exemplo0021 - Michelle da Costa Silva - 427448"); 
    $display("Test ALU's full adder \n");
	 $display("x + y + carryIn = carryOut  saida \n");

     #1 x = 4'b0001; y = 4'b0010; cIn = 0;
	 $monitor("%4b + %4b + %b = %b %4b", x, y, cIn, cOut, s);
	  #1 x = 4'b0001; y = 4'b0010; cIn = 1;
		
	  #1 x = 4'b1010; y = 4'b1100; cIn = 0;
	  #1 x = 4'b1010; y = 4'b1100; cIn = 1;
		
     #1 x = 4'b1110; y = 4'b0110; cIn = 0;
	  #1 x = 4'b1110; y = 4'b0110; cIn = 1;
		 
     #1 x = 4'b0011; y = 4'b0100; cIn = 0;
	  #1 x = 4'b0011; y = 4'b0100; cIn = 1;
		
 
     end 
   endmodule // test_fullAdder2 