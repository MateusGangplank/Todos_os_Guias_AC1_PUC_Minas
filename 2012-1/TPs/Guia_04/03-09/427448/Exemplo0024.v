// ------------------------- 
// Exemplo0021 - COMPARADOR
// Nome: Michelle Da Costa Silva 
// Matricula: 427448
// ------------------------- 

// ------------------------- 
// diferenca
// ------------------------- 

  module diferenca (output saida, input [3:0]entrada1, input [3:0]entrada2); 

      wire [3:0]s;
		
		xor XOR1 (s[0], entrada1[0], entrada2[0]);
		xor XOR2 (s[1], entrada1[1], entrada2[1]);
		xor XOR3 (s[2], entrada1[2], entrada2[2]);
		xor XOR4 (s[3], entrada1[3], entrada2[3]);
		
		or OR1 (saida, s[0], s[1], s[2], s[3]); 

    endmodule // diferenca

// ------------------------- 
// -- test diferenca
// -------------------------
    
	  module test_diferenca; 

// ------------------------- definir dados 
    
	 reg  [3:0] x;
	 reg  [3:0] y;
	 wire s;

// ------------------------- instancia 
	 
     diferenca modulo (s, x, y);
	  
// ------------------------- parte principal 

    initial begin 
    $display("Exemplo0024 - Michelle da Costa Silva - 427448"); 
    $display("Test ALU's comparador para diferença \n");
	 $display("x =! y --->  saida \n");

     #1 x = 4'b0001; y = 4'b0010;
	 $monitor("%4b =! %4b ---> %4b", x, y, s);
	  #1 x = 4'b1010; y = 4'b1100;
     #1 x = 4'b1110; y = 4'b1110;
     #1 x = 4'b0100; y = 4'b0011;
     #1 x = 4'b0011;	y = 4'b0101;
	  #1 x = 4'b0000;	y = 4'b1111; 
     #1 x = 4'b1010;	y = 4'b1010;
		
     end 
   endmodule // diferenca 