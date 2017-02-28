// ------------------------- 
// Exemplo0033 - F4 
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

   module f4( output [3:0]saida, input [1:0]entrada1, input [1:0]entrada2, input chave);
	  
	  wire [1:0]saida_and;
	  wire [1:0]saida_or;
	  wire [1:0]saida_nand; 
	  wire [1:0]saida_nor;
					
	  and AND1(saida_and[0], entrada1[0], entrada2[0]);
     and AND2(saida_and[1], entrada1[1], entrada2[1]);
    
	  or OR1(saida_or[0], entrada1[0], entrada2[0]);
     or OR2(saida_or[1], entrada1[1], entrada2[1]);
    
	  nand NAND1(saida_nand[0], entrada1[0], entrada2[0]);
     nand NAND2(saida_nand[1], entrada1[1], entrada2[1]);

	  nor NOR1(saida_nor[0], entrada1[0], entrada2[0]);
     nor NOR2(saida_nor[1], entrada1[1], entrada2[1]);
    
	  sel SEL1 (saida[1:0], saida_nand, saida_and, chave);
	  sel SEL2 (saida[3:2], saida_nor, saida_or, chave);	 
	 
    endmodule //f4

// ------------------------- 
// -- test f4
// -------------------------
    
	  module test_f4; 

// ------------------------- definir dados 
    
	 reg  [1:0] x;
	 reg  [1:0] y;
	 reg  c;
	 wire [3:0] s;
	 
// ------------------------- instancia 
	 
     f4 modulo (s, x, y, c);
	  
// ------------------------- parte principal 
    
	 initial begin

      $display("Exemplo0033 - Michelle da Costa Silva");
      $display("Test LU's module");
      $display("Legenda da chave: 0-OR/AND 1-NOR/NAND \n");
		
       #1 x = 2'b01; y = 2'b10; c = 0;
		$monitor("Chave = %1b\t x = %2b\t y = %2b\t Resultado = %2b\t Resultado = %2b", c, x, y, s[1:0],s[3:2]);
		 #1 x = 2'b01; y = 2'b10; c = 1;
		
		 #1 x = 2'b11; y = 2'b00; c = 0;
		 #1 x = 2'b11; y = 2'b00; c = 1;
		
		 #1 x = 2'b10; y = 2'b10; c = 0;
		 #1 x = 2'b10; y = 2'b10; c = 1;
		 
		 #1 x = 2'b01; y = 2'b00; c = 0;
		 #1 x = 2'b01; y = 2'b00; c = 1;
		
		end
endmodule // test_f4