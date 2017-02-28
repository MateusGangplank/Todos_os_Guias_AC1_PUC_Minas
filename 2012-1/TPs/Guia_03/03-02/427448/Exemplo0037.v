// ------------------------- 
// Exemplo0037 - F4 
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
					
      wire [3:0]saida_menor;
		wire [3:0]saida_maior; 

	  or OR1(saida_menor[0], ~entrada1[0], entrada2[0]);
     or OR2(saida_menor[1], ~entrada1[1], entrada2[1]);
     or OR3(saida_menor[2], ~entrada1[2], entrada2[2]);
     or OR4(saida_menor[3], ~entrada1[3], entrada2[3]);
   	 
	  or OR5(saida_maior[0], entrada1[0], ~entrada2[0]);
     or OR6(saida_maior[1], entrada1[1], ~entrada2[1]);
     or OR7(saida_maior[2], entrada1[2], ~entrada2[2]);
     or OR8(saida_maior[3], entrada1[3], ~entrada2[3]);
	  
	  sel SEL1 (saida, saida_maior, saida_menor, chave);
	  
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

      $display("Exemplo0037 - Michelle da Costa Silva");
      $display("Test LU's module");
      $display("Legenda da chave: 0-menor 1-maior \n");
		
		#1 x = 4'b1010;	y = 4'b0101; c = 0;
		$monitor("Chave = %1b\t x = %4b\t y = %4b\t Resultado = %4b", c, x, y, s);
      #1 x = 4'b1010;	y = 4'b0101; c = 1;
    
		#1 x = 4'b0000;	y = 4'b1111; c = 0;
		#1 x = 4'b0000;	y = 4'b1111; c = 1;

      #1 x = 4'b0010;	y = 4'b0101; c = 0;
		#1 x = 4'b0010;	y = 4'b0101; c = 1;

		end
    endmodule // test_f4