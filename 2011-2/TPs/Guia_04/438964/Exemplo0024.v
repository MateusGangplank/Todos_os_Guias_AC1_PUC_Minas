// ------------------------- 
       // Exemplo0024 – COMPARADOR PARA IGUALDADE
       // Nome: Ederson Cristiano Nunes 
       // Matricula: 438964
       // ------------------------- 

       // ------------------------- 
       // comparator 
       // ------------------------- 
       module comparator (output [5:0] s0, 
                         input  [5:0] a, 
                         input  [5:0] b);
 
       // descrever subsaidas
		 
		 wire [5:0] w1; 

       // descrever por portas 
		 xnor xnor1 [5:0] (w1, a, b);
       nand nand1 (s0, w1[0:0], w1[1:1],w1[2:2],w1[3:3],w1[4:4],w1[5:5]);
       endmodule // comparator
		 
		 module comparator_bit;
		    reg [5:0] a;
			 reg [5:0] b;
		 comparator    
		 

       // ------------------------- parte principal 
       initial begin 
            $display("Exemplo0024 - Ederson Cristiano Nunes - 438964"); 
            $display("Subtracao_Completa_1"); 
				
		 a = 6'b000000;	b = 6'b000000;		
		 $monitor ("a=%6b   b=%6b  s0=1%b   ",a,b,s0);

       end 

   
		 
    
