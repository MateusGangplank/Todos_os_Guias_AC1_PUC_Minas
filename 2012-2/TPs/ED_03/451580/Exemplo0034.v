// ------------------------------
// Exemplo0034 LU
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// ------------------------------


// ------------------------------
// LU
// ------------------------------

   module LU(output s1,output s2, input a, input b, input c1, input c2);

// ------------------------------ dados locais

	wire a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,nc1,nc2;
	
	or or1(a1,a,b);
	nor nor1(a2,a,b);
	xor xor1(a3,a,b);
	xnor xnor1(a4,a,b);
	not not1(nc1,c2);
	not not2(nc2,c2);
	and and1(a5,nc1,nc2);
	and and2(a6,nc1,c2);
	and and3(a7,c1,nc2);
	and and4(a8,c1,c2);
	and and5(a9,a5,a1);
	and and6(a10,a6,a2);
	and and7(a11,a7,a3);
	and and8(a12,a8,a4);
	or or2(s1,a9,a10);
	or or3(s2,a11,a12);
	
	endmodule // LU
	
// ------------------------------
// LU4
// ------------------------------

   module LU4(output[3:0]s1,output[3:0]s2, input[3:0]a, input[3:0]b, input c1, input c2);
	
	LU gate1 (s1[0],s2[0],a[0],b[0],c1,c2);
	LU gate2 (s1[1],s2[1],a[1],b[1],c1,c2);
	LU gate3 (s1[2],s2[2],a[2],b[2],c1,c2);
	LU gate4 (s1[3],s2[3],a[3],b[3],c1,c2);
	
	endmodule // LU4
	
   module teste;
	
   reg [3:0]a;
	reg [3:0]b;
	reg c1;
	reg c2;
	wire [3:0]s1;
	wire [3:0]s2;
	
	LU4 circuito1(s1,s2,a,b,c1,c2);
	
	//endmodule
	

initial begin:start

 

// ------------------------------ parte principal


	
      $display("Exemplo0034 - Isabel Bicalho Amaro - 451580\n");
		$display("Test LU's module\n");
		
		#1 a = 4'b1010;     b = 4'b0011;    c1 = 0; c2 = 0;
		#1
   // projetar testes do modulo
      $monitor("a = %3b b = %3b chave1 = %3b chave2 = %3b s1 = %3b s2 = %3b",a,b,c1,c2,s1,s2);
   
	#1 c1 = 0; c2 = 1;
	#1 c1 = 1; c2 = 0;
	#1 c1 = 1; c2 = 1;
	end
	
endmodule // LU4

/*
    Exemplo0034 - Isabel Bicalho Amaro - 451580
    
    Test LU's module
    
    a = 1010 b = 0011 chave1 =   0 chave2 =   0 s1 = 1011 s2 = 0000
    a = 1010 b = 0011 chave1 =   0 chave2 =   1 s1 = 0000 s2 = 0000
    a = 1010 b = 0011 chave1 =   1 chave2 =   0 s1 = 1011 s2 = 1001
    a = 1010 b = 0011 chave1 =   1 chave2 =   1 s1 = 0000 s2 = 0110
    
*/