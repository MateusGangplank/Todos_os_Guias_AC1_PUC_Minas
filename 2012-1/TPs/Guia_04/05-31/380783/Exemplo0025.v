// ------------------------- 
// Exemplo0021 - COMPLEMENTO DE 2
// Nome: Lucas Siqueira Chagas 
// Matricula: 380783
// ------------------------- 

// ------------------------- 
// Complemento de 2
// ------------------------- 

  module halfAdder (output saida, output carryOut, input entrada1, input entrada2); 

		xor XOR1 (saida, entrada1, entrada2);
      and AND1 (carryOut, entrada1, entrada2);
       
	 endmodule // halfAdder

  module C2 (output [3:0]saida, output carryOut, input [3:0]entrada, input carryIn); 

      wire [3:0]saida_not;
		wire [2:0]s;
		
		not NOT1 (saida_not[0], entrada[0]);
		not NOT2 (saida_not[1], entrada[1]);
		not NOT3 (saida_not[2], entrada[2]);
		not NOT4 (saida_not[3], entrada[3]);
		
		halfAdder HA1 (saida[0], s[0], saida_not[0], carryIn);
		halfAdder HA2 (saida[1], s[1], saida_not[1], s[0]);
		halfAdder HA3 (saida[2], s[2], saida_not[2], s[1]);
		halfAdder HA4 (saida[3], carryOut, saida_not[3], s[2]);
		
    endmodule // C2

// ------------------------- 
// -- test Complemento de 2
// -------------------------
    
	  module test_C2; 

// ------------------------- definir dados 
    
	 reg  [3:0]x;
	 reg cIn;
	 wire [3:0]s;
	 wire cOut;

// ------------------------- instancia 
	 
     C2 modulo (s, cOut, x, cIn);
	  
// ------------------------- parte principal 

    initial begin 
    $display("Exemplo0025 - Lucas Siqueira Chagas - 380783"); 
    $display("Test ALU's complemento de 2 \n");
	 $display("x  --->  saida \n");

     #1 x = 4'b0001; cIn = 1;
	 $monitor("%4b  ---> %b %4b", x, cOut, s);
	  #1 x = 4'b1010; 
     #1 x = 4'b1110;
     #1 x = 4'b0100;
     #1 x = 4'b0011;
	  #1 x = 4'b0000;	 
     #1 x = 4'b1011;
		
     end 
   endmodule // C2 