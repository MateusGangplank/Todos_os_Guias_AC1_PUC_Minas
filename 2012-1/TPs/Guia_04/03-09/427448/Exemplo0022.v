// ------------------------- 
// Exemplo0021 - SUBTRATOR COMPLETA
// Nome: Michelle Da Costa Silva 
// Matricula: 427448
// ------------------------- 

// ------------------------- 
// subtrator completa
// ------------------------- 

  module meio_subtrator (output saida, output carryOut, input entrada1, input entrada2); 
      
		wire saida_not;
		
		not NOT1 (saida_not, entrada1);    
		
		xor XOR1 (saida, entrada1, entrada2);
      and AND1 (carryOut, saida_not, entrada2);
       
	 endmodule // meio_subtrator
	 
  module subtrator_completo (output saida, output carryOut, input entrada1, input entrada2, input carryIn); 

		wire [2:0]s; 

      meio_subtrator MS1 (s[0], s[1], entrada1, entrada2);
		meio_subtrator MS2 (saida, s[2], s[0], carryIn);
		
		or OR1 (carryOut, s[1], s[2]);	 
	     
	 endmodule // subtrator_completo 

  module subtrator_completo2 (output [3:0]saida, output carryOut, input [3:0]entrada1, input [3:0]entrada2, input carryIn); 

      wire [2:0]s;
		
		subtrator_completo SC1 (saida[0], s[0], entrada1[0], entrada2[0], carryIn);
		subtrator_completo SC2 (saida[1], s[1], entrada1[1], entrada2[1], s[0]);
		subtrator_completo SC3 (saida[2], s[2], entrada1[2], entrada2[2], s[1]);
		subtrator_completo SC4 (saida[3], carryOut, entrada1[3], entrada2[3], s[2]);

    endmodule // subtrator_completo2 

// ------------------------- 
// -- test subtrator completo
// -------------------------
    
	  module test_subtrator_completo2; 

// ------------------------- definir dados 
    
	 reg  [3:0] x;
	 reg  [3:0] y;
	 reg  cIn;
	 wire [3:0] s;
	 wire cOut;

// ------------------------- instancia 
	 
     subtrator_completo2 modulo (s, cOut, x, y, cIn);
	  
// ------------------------- parte principal 

    initial begin 
    $display("Exemplo0021 - Michelle da Costa Silva - 427448"); 
    $display("Test ALU's subtrator completo \n");
	 $display("x - y - carryIn = carryOut  saida \n");

     #1 x = 4'b0001; y = 4'b0010; cIn = 0;
	 $monitor("%4b - %4b - %b = %b %4b", x, y, cIn, cOut, s);
	  #1 x = 4'b0001; y = 4'b0010; cIn = 1;
		
	  #1 x = 4'b1010; y = 4'b1100; cIn = 0;
	  #1 x = 4'b1010; y = 4'b1100; cIn = 1;
		
     #1 x = 4'b1110; y = 4'b0110; cIn = 0;
	  #1 x = 4'b1110; y = 4'b0110; cIn = 1;
		 
     #1 x = 4'b0100; y = 4'b0011; cIn = 0;
	  #1 x = 4'b0100; y = 4'b0011; cIn = 1;
		
     end 
   endmodule // test_fullAdder2 