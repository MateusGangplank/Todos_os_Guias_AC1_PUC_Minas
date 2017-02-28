// ------------------------- 
// Exemplo0034 - F4 
// Nome: Michelle da Costa Silva 
// Matricula: 427448
// -------------------------
 
// ------------------------- 
// f4_gate 
// ------------------------- 

    module sel (output [1:0]saida, input [1:0]entrada1, input [1:0]entrada2, input chave); 

		wire [3:0]s1; 
		wire saida_not;

	   not NOT1(saida_not, chave); 
	 
	   and AND1(s1[0], entrada1[0], chave);
      and AND2(s1[1], entrada1[1], chave);
    
	   and AND3(s1[2], entrada2[0], saida_not);
      and AND4(s1[3], entrada2[1], saida_not);
     	 
	   or OR1(saida[0], s1[0], s1[2]);
      or OR2(saida[1], s1[1], s1[3]);
   
	 endmodule // sel 

    module f4 (output [1:0]saida, input [1:0]entrada1, input [1:0]entrada2, input c1, input c2);
					
		 wire [1:0]saida_xor; 
	    wire [1:0]saida_or;
       wire [1:0]saida_xnor; 
		 wire [1:0]saida_nor;
		 wire [1:0]s1;
		 wire [1:0]s2; 

	   xor XOR1(saida_xor[0], entrada1[0], entrada2[0]);
      xor XOR2(saida_xor[1], entrada1[1], entrada2[1]);
   
	   or OR1(saida_or[0], entrada1[0], entrada2[0]);
      or OR2(saida_or[1], entrada1[1], entrada2[1]);
   	 
	   xnor XNOR1(saida_xnor[0], entrada1[0], entrada2[0]);
      xnor XNOR2(saida_xnor[1], entrada1[1], entrada2[1]);
   
	   nor NOR1(saida_nor[0], entrada1[0], entrada2[0]);
      nor NOR2(saida_nor[1], entrada1[1], entrada2[1]);
	  
	   sel SEL1 (s1, saida_xor, saida_or, c1);
	   sel SEL2 (s2, saida_xnor, saida_nor, c1);
	   sel SEL3 (saida, s2, s1, c2);
	 
    endmodule //f4

// ------------------------- 
// -- test f4
// -------------------------
    
	  module test_f4; 

// ------------------------- definir dados 
    
	 reg  [1:0] x;
	 reg  [1:0] y;
	 reg  c1;
	 reg  c2;
	 wire [1:0] s;
	 
// ------------------------- instancia 
	 
     f4 modulo (s, x, y, c1, c2);
	  
// ------------------------- parte principal 
    
	 initial begin

      $display("Exemplo0034 - Michelle da Costa Silva");
      $display("Test LU's module");
      $display("Legenda da chave: 00-OR; 01-NOR; 10-XOR; 11-XNOR\n");
		
       #1 x = 2'b01; y = 2'b10; c1 = 0; c2 = 0;
		$monitor("Chave = %2b%2b \t x = %2b\t y = %2b\t Resultado = %2b", c1, c2, x, y, s);
		 #1 x = 2'b01; y = 2'b10; c1 = 0; c2 = 1; 
		 #1 x = 2'b01; y = 2'b10; c1 = 1; c2 = 0;
		 #1 x = 2'b01; y = 2'b10; c1 = 1; c2 = 1;
		
		 #1 x = 2'b11; y = 2'b00; c1 = 0; c2 = 0;
		 #1 x = 2'b11; y = 2'b00; c1 = 0; c2 = 1; 
		 #1 x = 2'b11; y = 2'b00; c1 = 1; c2 = 0;
		 #1 x = 2'b11; y = 2'b00; c1 = 1; c2 = 1;
		
		 #1 x = 2'b10; y = 2'b10; c1 = 0; c2 = 0;
		 #1 x = 2'b10; y = 2'b10; c1 = 0; c2 = 1; 
		 #1 x = 2'b10; y = 2'b10; c1 = 1; c2 = 0;
		 #1 x = 2'b10; y = 2'b10; c1 = 1; c2 = 1;
		 
		 #1 x = 2'b01; y = 2'b00; c1 = 0; c2 = 0;
		 #1 x = 2'b01; y = 2'b00; c1 = 0; c2 = 1; 
		 #1 x = 2'b01; y = 2'b00; c1 = 1; c2 = 0;
		 #1 x = 2'b01; y = 2'b00; c1 = 1; c2 = 1;

				
		end
endmodule // test_f4