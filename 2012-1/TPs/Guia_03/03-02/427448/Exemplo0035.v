// ------------------------- 
// Exemplo0035 - F4 
// Nome: Michelle da Costa Silva 
// Matricula: 427448
// -------------------------
 
// ------------------------- 
// f4_gate 
// ------------------------- 

    module sel (output saida, 
	             input entrada1, 
					 input entrada2,
					 input entrada3,
					 input entrada4,
					 input entrada5,
					 input entrada6,
					 input entrada7,
					 input entrada8,
					 input [2:0]chave); 

		wire [7:0]s; 
		wire saida_not1;
		wire saida_not2;
		wire saida_not3;

	   not NOT1(saida_not1, chave[0]); 
	   not NOT1(saida_not2, chave[1]); 
	   not NOT1(saida_not3, chave[2]); 
	 
	   and AND1(s[0], entrada1, saida_not3, saida_not2, saida_not1);
      and AND2(s[1], entrada2, saida_not3, saida_not2, chave[0]);
	   and AND3(s[2], entrada3, saida_not3, chave[1], saida_not1);
      and AND4(s[3], entrada4, saida_not3, chave[1], chave[0]);
		and AND5(s[4], entrada5, chave[2], saida_not2, saida_not1);
      and AND6(s[5], entrada6, chave[2], saida_not2, chave[0]);
	   and AND7(s[6], entrada7, chave[2], chave[1], saida_not1);
      and AND8(s[7], entrada8, chave[2], chave[1], chave[0]);
     	 
	   or OR1(saida, s[0], s[1], s[2], s[3], s[4], s[5], s[6], s[7]);
   
	 endmodule // sel 

    module f4 (output saida, input entrada1, input entrada2, input [2:0]chave);
					
		 wire saida_not1; 
	    wire saida_not2;
       wire saida_or; 
		 wire saida_nor;
		 wire saida_and;
		 wire saida_nand; 
		 wire saida_xor;
		 wire saida_xnor; 

	   not NOT1(saida_not1, entrada1);
      not NOT2(saida_not2, entrada2);
      or OR1(saida_or, entrada1, entrada2);
      nor NOR1(saida_nor, entrada1, entrada2);
      and AND1(saida_and, entrada1, entrada2);
      nand NAND1(saida_nand, entrada1, entrada2);
      xor XOR1(saida_xor, entrada1, entrada2);
      xnor XNOR1(saida_xnor, entrada1, entrada2);
	  
	   sel SEL1 (saida, saida_not1, saida_not2, saida_or, saida_nor, saida_and, saida_nand, saida_xor, saida_xnor, chave);

	 
    endmodule //f4

// ------------------------- 
// -- test f4
// -------------------------
    
	  module test_f4; 

// ------------------------- definir dados 
    
	 reg  x;
	 reg  y;
	 reg  [2:0]c;
	 wire s;
	 
// ------------------------- instancia 
	 
     f4 modulo (s, x, y, c);
	  
// ------------------------- parte principal 
    
	 initial begin

      $display("Exemplo0035 - Michelle da Costa Silva");
      $display("Test LU's module");
      $display("Legenda da chave: 000-NOTA; 001-NOTB; 010-OR; 011-NOR; 100-AND; 101-NAND; 110-XOR; 111-XNOR\n");
		
       #1 x = 'b0; y = 'b0; c = 000;
		$monitor("Chave = %b \t x = %b\t y = %b\t Resultado = %b", c, x, y, s);
		 #1 x = 'b0; y = 'b0; c = 001; 
		 #1 x = 'b0; y = 'b0; c = 010;
		 #1 x = 'b0; y = 'b0; c = 011;
		 #1 x = 'b0; y = 'b0; c = 100;
		 #1 x = 'b0; y = 'b0; c = 101;
		 #1 x = 'b0; y = 'b0; c = 110;
		 #1 x = 'b0; y = 'b0; c = 111;
		
       #1 x = 'b0; y = 'b1; c = 000;
		 #1 x = 'b0; y = 'b1; c = 001; 
		 #1 x = 'b0; y = 'b1; c = 010;
		 #1 x = 'b0; y = 'b1; c = 011;
		 #1 x = 'b0; y = 'b1; c = 100;
		 #1 x = 'b0; y = 'b1; c = 101;
		 #1 x = 'b0; y = 'b1; c = 110;
		 #1 x = 'b0; y = 'b1; c = 111;
		
       #1 x = 'b1; y = 'b0; c = 000;
		 #1 x = 'b1; y = 'b0; c = 001; 
		 #1 x = 'b1; y = 'b0; c = 010;
		 #1 x = 'b1; y = 'b0; c = 011;
		 #1 x = 'b1; y = 'b0; c = 100;
		 #1 x = 'b1; y = 'b0; c = 101;
		 #1 x = 'b1; y = 'b0; c = 110;
		 #1 x = 'b1; y = 'b0; c = 111;
		 
       #1 x = 'b1; y = 'b1; c = 000;
		 #1 x = 'b1; y = 'b1; c = 001; 
		 #1 x = 'b1; y = 'b1; c = 010;
		 #1 x = 'b1; y = 'b1; c = 011;
		 #1 x = 'b1; y = 'b1; c = 100;
		 #1 x = 'b1; y = 'b1; c = 101;
		 #1 x = 'b1; y = 'b1; c = 110;
		 #1 x = 'b1; y = 'b1; c = 111;

				
		end
endmodule // test_f4