// ------------------------- 
// Exemplo0032 - ALU
// Nome: Michelle Da Costa Silva 
// Matricula: 427448
// ------------------------- 

// ------------------------- 
// somador algebrico
// ------------------------- 

  module halfAdder (output saida, output carryOut, input entrada1, input entrada2); 

		xor XOR1 (saida, entrada1, entrada2);
      and AND1 (carryOut, entrada1, entrada2);
       
	 endmodule // halfAdder
	 
// -------------------------------------------------------------------------------------------------	 
	 
  module fullAdder (output saida, output carryOut, input entrada1, input entrada2, input carryIn); 

		wire [2:0]s; 

      halfAdder HA1 (s[0], s[1], entrada1, entrada2);
		halfAdder HA2 (saida, s[2], s[0], carryIn);
		
		or OR1 (carryOut, s[1], s[2]);	 
	     
	 endmodule // fullAdder 
	 
// -------------------------------------------------------------------------------------------------	 
	 
  module detectorZero (output saida, input [3:0]entrada, input entrada0); 

		nor NOR1 (saida, entrada[0], entrada[1], entrada[2], entrada[3], entrada0);
       
	 endmodule // detectorZero 
	 
// -------------------------------------------------------------------------------------------------	 

  module somadorAlgebrico (output [3:0]saida, output carryOut, output x, input [3:0]entrada1, input [3:0]entrada2, input carryIn); 
     
      wire [3:0]s;
		wire [3:0]s1;
		wire x;
		
	  xor XOR1 ( s[0], entrada2[0], carryIn);
	  xor XOR2 ( s[1], entrada2[1], carryIn);
	  xor XOR3 ( s[2], entrada2[2], carryIn);
	  xor XOR4 ( s[3], entrada2[3], carryIn);
			
	  fullAdder FA1 (saida[0], s1[0], entrada1[0], s[0], carryIn);
	  fullAdder FA2 (saida[1], s1[1], entrada1[1], s[1], s1[0]);
	  fullAdder FA3 (saida[2], s1[2], entrada1[2], s[2], s1[1]);
	  fullAdder FA4 (saida[3], s1[3], entrada1[3], s[3], s1[2]);
	  xor XOR1 (carryOut, carryIn, s1[3]);
	  
	  detectorZero DZ1 (x, saida, carryOut);

    endmodule // somadorAlgebrico 

// ------------------------- 
// -- test Somador Algebrico
// -------------------------
    
	  module test_somadorAlgebrico; 

// ------------------------- definir dados 
    
	 reg  [3:0] x;
	 reg  [3:0] y;
	 reg  cIn;
	 wire [3:0] s;
	 wire cOut;
	 wire dz;

// ------------------------- instancia 
	 
     somadorAlgebrico modulo (s, cOut, dz, x, y, cIn);
	  
// ------------------------- parte principal 

    initial begin 
    $display("Exemplo0032 - Michelle da Costa Silva - 427448"); 
    $display("Test ALU Somador Algebrico \n");
	 $display("soma=carryIn=0; subtração=carryIn=1 \n");
	 $display("Detector de Zero: sim=1; não=0 \n");
	 $display("x  y ----> carryIn = carryOut  saida ---->> 'Detector de Zero'\n");

     #1 x = 4'b0001; y = 4'b0010; cIn = 0;
	 $monitor("%4b  %4b ----> %b = %b %4b ---->> %b", x, y, cIn, cOut, s, dz);
	  #1 x = 4'b0001; y = 4'b0010; cIn = 1;
		
	  #1 x = 4'b1010; y = 4'b1100; cIn = 0;
	  #1 x = 4'b1010; y = 4'b1100; cIn = 1;
		
     #1 x = 4'b1110; y = 4'b0110; cIn = 0;
	  #1 x = 4'b1110; y = 4'b0110; cIn = 1;
		 
     #1 x = 4'b0001; y = 4'b0001; cIn = 0;
	  #1 x = 4'b0001; y = 4'b0001; cIn = 1;
		
      end 
   endmodule // test_somadorAlgebrico 