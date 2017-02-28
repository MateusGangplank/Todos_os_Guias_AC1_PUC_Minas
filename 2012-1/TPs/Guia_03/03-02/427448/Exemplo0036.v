// ------------------------- 
// Exemplo0036 - F4 
// Nome: Michelle da Costa Silva 
// Matricula: 427448
// -------------------------
 
// ------------------------- 
// f4_gate 
// ------------------------- 

     module sel (output [3:0]saida, input [3:0]entrada1, input [3:0]entrada2, input chave); 

		wire [7:0]s; 
		wire saida_not;

	   not NOT1(saida_not, chave); 
	 
	  and AND1(s[0], entrada1[0], chave);
     and AND2(s[1], entrada1[1], chave);
     and AND3(s[2], entrada1[2], chave);
     and AND4(s[3], entrada1[3], chave);

     and AND5(s[4], entrada2[0], saida_not);
     and AND6(s[5], entrada2[1], saida_not);
     and AND7(s[6], entrada2[2], saida_not);
     and AND8(s[7], entrada2[3], saida_not);
   	 
	  or OR1(saida[0], s[0], s[4]);
     or OR2(saida[1], s[1], s[5]);
     or OR3(saida[2], s[2], s[6]);
     or OR4(saida[3], s[3], s[7]);
   
	 endmodule // sel 


    module f4 (output [3:0]saida, input [3:0]entrada1, input [3:0]entrada2, input chave);
					
		wire [3:0]saida_xor; 
      wire [3:0]saida_xnor; 

	  xor XOR1(saida_xor[0], entrada1[0], entrada2[0]);
     xor XOR2(saida_xor[1], entrada1[1], entrada2[1]);
     xor XOR3(saida_xor[2], entrada1[2], entrada2[2]);
     xor XOR4(saida_xor[3], entrada1[3], entrada2[3]);
   	 
	  xnor XNOR1(saida_xnor[0], entrada1[0], entrada2[0]);
     xnor XNOR2(saida_xnor[1], entrada1[1], entrada2[1]);
     xnor XNOR3(saida_xnor[2], entrada1[2], entrada2[2]);
     xnor XNOR4(saida_xnor[3], entrada1[3], entrada2[3]);
	  
	  sel SEL1 (saida, saida_xor, saida_xnor, chave);
	 
	 endmodule //f4

// ------------------------- 
// -- test f4
// -------------------------
    
	  module test_f4; 

// ------------------------- definir dados 
    
	 reg  [3:0] x;
	 reg  [3:0] y;
	 reg  c;
	 wire [3:0] s;
	 
// ------------------------- instancia 
	 
     f4 modulo (s, x, y, c);
	  
// ------------------------- parte principal 
    
	 initial begin

      $display("Exemplo0036 - Michelle da Costa Silva");
      $display("Test LU's module");
      $display("Legenda da chave: 0-igual 1-diferente \n");
		
		#1 x = 4'b0011;	y = 4'b0101; c = 0;
		$monitor("Chave = %1b\t x = %4b\t y = %4b\t Resultado = %4b", c, x, y, s);
      #1 x = 4'b0011;	y = 4'b0101; c = 1;
    
		#1 x = 4'b0000;	y = 4'b1111; c = 0;
		#1 x = 4'b0000;	y = 4'b1111; c = 1;

   	#1 x = 4'b1010;	y = 4'b0101; c = 0;
		#1 x = 4'b1010;	y = 4'b0101; c = 1;

		
		end
endmodule // test_f4