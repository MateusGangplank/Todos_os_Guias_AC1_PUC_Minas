// ------------------------- 
// Exemplo0037 - ALU
// Nome: Lucas Siqueira Chagas 
// Matricula: 380783
// ------------------------- 

// ------------------------- 
// comparador aritmético 
// ------------------------- 

  module comparador (output saida0, output saida1, input entrada1, input entrada2, input c0, input c1); 
    
	  wire a, b;
	  wire [3:0] s0;
  
      not NOT1 (a, entrada1);
		not NOT2 (b, entrada2);

      and AND1 (s0[0], b, entrada1, c1);
		and AND2 (s0[1], b, a, c1);
      and AND3 (s0[2], entrada2, entrada1, c1);
      and AND4 (s0[3], c0, c1);

      or OR1 (saida0, c0, s0[0]);
      or OR2 (saida1, s0[1], s0[2], s0[3]);
       
	 endmodule // comparador
	 
// -------------------------------------------------------------------------------------------------	 

  module comparadorAlgebrico (output maior, output menor, output igual, input [2:0]entrada1, input [2:0]entrada2); 
     
      wire [2:0]s0;
		wire [2:0]s1;
		wire sinal_A, sinal_B;
		
	  not NOT1 (sinal_A, entrada1[3]);
	  not NOT2 (sinal_B, entrada2[3]);
	
	  comparador COM1 ( s0[0], s1[0], sinal_A, sinal_B, 0, 1);
	  comparador COM2 ( s0[1], s1[1], entrada1[2], entrada2[2], s0[0], s1[0]);
	  comparador COM3 ( maior, igual, entrada1[1], entrada2[1], s0[1], s1[1]);
			
	  xnor XOR1 (menor, maior, igual);
	  
    endmodule // comparadorAlgebrico 

// ------------------------- 
// -- test Comparador Algebrico
// -------------------------
    
	  module test_comparadorAlgebrico; 

// ------------------------- definir dados 
    
	 reg  [2:0] x;
	 reg  [2:0] y;
	 wire maior;
	 wire menor;
	 wire igual;

// ------------------------- instancia 
	 
     comparadorAlgebrico modulo (maior, menor, igual, x, y);
	  
// ------------------------- parte principal 

    initial begin 
    $display("Exemplo0037 - Lucas Siqueira Chagas - 380783"); 
    $display("Test ALU Comparador Algebrico \n");
	 $display("x  y  ----> maior menor igual\n");

     #1 x = 3'b001; y = 3'b010; 
	 $monitor("%4b  %4b ----> %b  %b %b ", x, y, maior, menor, igual);
	  
	  #1 x = 3'b011; y = 3'b010;
		
	  #1 x = 3'b110; y = 3'b110;
	   
	  #1 x = 3'b100; y = 3'b100; 
	  		
     #1 x = 3'b101; y = 3'b101; 
		 
		
      end 
   endmodule // test_comparadorAlgebrico 