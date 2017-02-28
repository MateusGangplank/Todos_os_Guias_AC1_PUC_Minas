// ------------------------------
// Exemplo0033 LU
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// ------------------------------


// ------------------------------
// LU
// ------------------------------

   module LU(output s1,output s2, input a, input b, input chave);

// ------------------------------ dados locais

	wire a1,a2,a3,a4,a5,a6,a7,a8,nchave;
	
	and and1(a1,a,b);
	nand nand1(a2,a,b);
	or or1(a3,a,b);
	nor nor1(a4,a,b);
	not not1(nchave,chave);
	and and2(a5,nchave,a1);
	and and3(a6,chave,a2);
	and and4(a7,nchave,a3);
	and and5(a8,chave,a4);
	or or2(s1,a5,a7);
	or or3(s2,a6,a8);
	
	endmodule // LU
	
// ------------------------------
// LU4
// ------------------------------

   module LU4(output[3:0]s1,output[3:0]s2, input[3:0]a, input[3:0]b, input chave);
	
	LU gate1 (s1[0],s2[0],a[0],b[0],chave);
	LU gate2 (s1[1],s2[1],a[1],b[1],chave);
	LU gate3 (s1[2],s2[2],a[2],b[2],chave);
	LU gate4 (s1[3],s2[3],a[3],b[3],chave);
	
	endmodule // LU4
	
   module teste;
	
   reg [3:0]a;
	reg [3:0]b;
	reg chave;
	wire [3:0]s1;
	wire [3:0]s2;
	
	LU4 circuito1(s1,s2,a,b,chave);
	
	//endmodule
	

initial begin:start

  
	#1 a = 4'b0000;     b = 4'b0000;    chave = 0;



// ------------------------------ parte principal


	
      $display("Exemplo0033 - Isabel Bicalho Amaro - 451580\n");
		$display("Test LU's module\n");
		
		#1 a = 4'b0000;     b = 4'b0000;    chave = 0;
		#1
   // projetar testes do modulo
      $monitor("a = %3b b = %3b chave = %3b s1(and e or) = %3b s2(nand e nor) = %3b",a,b,chave,s1,s2);
   
	#1 a = 4'b0101;     b = 4'b1001;
	#1 chave = 1;
	end
	
endmodule // LU4

/*

    Exemplo0033 - Isabel Bicalho Amaro - 451580
    
    Test LU's module
    
    a = 0000 b = 0000 chave =   0 s1(and e or) = 0000 s2(nand e nor) = 0000
    a = 0101 b = 1001 chave =   0 s1(and e or) = 1101 s2(nand e nor) = 0000
    a = 0101 b = 1001 chave =   1 s1(and e or) = 0000 s2(nand e nor) = 1110
    
*/