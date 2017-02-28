// ------------------------------
// Exemplo0034 LU
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// ------------------------------


// ------------------------------
// LU
// ------------------------------

   module LU(output[3:0]s1,output[3:0]s2, output[3:0]s3,
	          output[3:0]s4, output[3:0]s5, output[3:0]s6,
				 output[3:0]s7, output[3:0]s8,
				 input[3:0]a, input[3:0]b);

// ------------------------------ dados locais
	
	not not1 [3:0] (s1,a);
	not not2 [3:0] (s2,b);
	or  or1 [3:0] (s3,a,b);
	nor nor1 [3:0] (s4,a,b);
	and and1 [3:0] (s5,a,b);
	nand nand1 [3:0] (s6,a,b);
	xor xor1 [3:0] (s7,a,b);
	xnor xnor1 [3:0] (s8,a,b);
	 
	endmodule // LU
	
	
   module teste;
	
   reg [3:0]a;
	reg [3:0]b;
	wire [3:0]s1;
	wire [3:0]s2;
	wire [3:0]s3;
	wire [3:0]s4;
	wire [3:0]s5;
	wire [3:0]s6;
	wire [3:0]s7;
	wire [3:0]s8;
	
	LU circuito1(s1,s2,s3,s4,s5,s6,s7,s8,a,b);
	
	//endmodule
	

initial begin:start

 

// ------------------------------ parte principal


	
      $display("Exemplo0035 - Isabel Bicalho Amaro - 451580\n");
		$display("Test LU's module\n");
		
		#1 a = 4'b1010;     b = 4'b0011; 
	
   // projetar testes do modulo
      $monitor("a = %4b b = %4b s1 = %4b s2 = %4b s3 = %4b s4 = %4b s5 = %4b s6 = %4b s7 = %4b s8 = %4b",a,b,s1,s2,s3,s4,s5,s6,s7,s8);

		#1 a = 4'b0010;     b = 4'b0100; 

		#1 a = 4'b0110;     b = 4'b0111; 

		#1 a = 4'b1100;     b = 4'b1000; 


	end
	
endmodule // LU4

/*
    Exemplo0035 - Isabel Bicalho Amaro - 451580
    
    Test LU's module
    
    a = 1010 b = 0011 s1 = 0101 s2 = 1100 s3 = 1011 s4 = 0100 s5 = 0010 s6 = 1101 s7 = 1001 s8 = 0110
    a = 0010 b = 0100 s1 = 1101 s2 = 1011 s3 = 0110 s4 = 1001 s5 = 0000 s6 = 1111 s7 = 0110 s8 = 1001
    a = 0110 b = 0111 s1 = 1001 s2 = 1000 s3 = 0111 s4 = 1000 s5 = 0110 s6 = 1001 s7 = 0001 s8 = 1110
    a = 1100 b = 1000 s1 = 0011 s2 = 0111 s3 = 1100 s4 = 0011 s5 = 1000 s6 = 0111 s7 = 0100 s8 = 1011
    
*/