// ------------------------- 
       // Exemplo0022 – FULL SUBTRACTOR 
       // Nome: Ederson Cristiano Nunes 
       // Matricula: 438964
       // ------------------------- 

       // ------------------------- 
       // full subtractor 
       // ------------------------- 
       module fullSubtractor (output [5:0] s0, 
		                   output [5:0] borrowOut,
                         input  [5:0] a, 
                         input  [5:0] b, 
                         input  [5:0] borrowIn); 
 
       // descrever subsaidas
		 wire [5:0] na, ns1, s1, s2, s3, s4, s5; 

       // descrever por portas 
		 not not1 [5:0] (na, a);
		 xor xor1 [5:0] (s1, a, b);
		 and and1 [5:0] (s2, na, b);
		 not not2 [5:0] (ns1, s1);
		 xor xor2 [5:0] (s0, borrowIn, s1);
       and and2 [5:0] (s3, ns1, borrowIn);
		 or  or1  [5:0] (borrowOut, s3, s2);
       endmodule // fullSubtractor 
		 

       module test_fullSubtractor; 
       // ------------------------- definir dados 
            reg [5:0] a; 
            reg [5:0] b; 
            reg [5:0] borrowIn; 
            wire [5:0] s0, borrowOut; 
				
		fullSubtractor subtracaoCompleta_1 (s0, borrowOut, a, b, borrowIn);	
		
		initial begin
		a = 6'b000000;
		b = 6'b000000;
		borrowIn = 6'b000000;			
		end	

       // ------------------------- parte principal 
       initial begin 
            $display("Exemplo0022 - Ederson Cristiano Nunes - 438964"); 
            $display("Subtracao_Completa_1"); 
				
				
		 $monitor ("a=%6b   b=%6b   borrowIn=%6b   s0=%6b   borrowOut=%6b",a,b,borrowIn,s0,borrowOut);
		 #1 a=6'b111111;   b=6'b000001;   borrowIn=6'b000000;
		 #1 a=6'b000000;   b=6'b000001;   borrowIn=6'b000000; 
 

       // projetar testes do somador complete 

       end 

       endmodule // test_fullSubtractor 
		 
		 
//Subtracao_Completa_1
//a=000000   b=000000   borrowIn=000000   s0=000000   borrowOut=000000
//a=111111   b=000001   borrowIn=000000   s0=111110   borrowOut=000000
//a=000000   b=000001   borrowIn=000000   s0=000001   borrowOut=000001
    
