// ------------------------- 
       // Exemplo0021 – FULL ADDER 
       // Nome: Ederson Cristiano Nunes 
       // Matricula: 438964
       // ------------------------- 

       // ------------------------- 
       // full adder 
       // ------------------------- 
       module fullAdder (output [5:0] s0, 
		                   output [5:0] carryOut,
                         input  [5:0] a, 
                         input  [5:0] b, 
                         input  [5:0] carryIn); 
 
       // descrever subsaidas
		 wire [5:0] s1, s2, s3; 

       // descrever por portas 
		 xor xor1 [5:0] (s1, a, b);
		 and and1 [5:0] (s2, a, b);
		 xor xor2 [5:0] (s0, carryIn, s1);
       and and2 [5:0] (s3, carryIn, s1);
		 or  or1  [5:0] (carryOut, s2, s3);
       endmodule // fullAdder 
		 

       module test_fullAdder; 
       // ------------------------- definir dados 
            reg [5:0] a; 
            reg [5:0] b; 
            reg [5:0] carryIn; 
            wire [5:0] s0, carryOut; 
				
		fullAdder somacompleta_1 (s0, carryOut, a, b, carryIn);	
		
		initial begin
		a = 6'b000000;
		b = 6'b000000;
		carryIn = 6'b000000;			
		end	

       // ------------------------- parte principal 
        initial begin 
            $display("Exemplo0021 - Ederson Cristiano Nunes - 438964"); 
            $display("SomaCompleta_1"); 
				
				
		$monitor ("a=%6b   b=%6b   carryIn=%6b   s0=%6b   CarryOut=%6b",a,b,carryIn,s0,carryOut);
		#1 a=6'b101010;   b=6'b010101;   carryIn=6'b000001; 

        // projetar testes do somador complete 

        end 

       endmodule // test_fullAdder 
		 
		 
//SomaCompleta_1
//a=000000   b=000000   carryIn=000000   s0=000000   CarryOut=000000
//a=101010   b=010101   carryIn=000001   s0=111110   CarryOut=000001
