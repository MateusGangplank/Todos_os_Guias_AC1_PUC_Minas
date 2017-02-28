// ------------------------------
// Exemplo0032 LU
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// ------------------------------

// ------------------------------
// or
// ------------------------------

   module orgate(output s, input a, input b);
	  assign s = (a|b);
	  
	endmodule // or
	
// ------------------------------
// and
// ------------------------------

   module andgate(output s, input a, input b);
	   assign s = a&b;

   endmodule // and

// ------------------------------
// not
// ------------------------------

   module notgate(output s, input a);
	   assign s = ~a;
	
	endmodule // not

// ------------------------------
// LU
// ------------------------------

   module LU(output s, input a, input b, input chave);
	
// ------------------------------ dados locais

	wire s0,s1,s2,s3,s4,nchave;

// ------------------------------ instancia

	and and1 (s0,a,b);
	or  or1  (s1,a,b);
	and and2 (s2,s0,chave);
	not not1 (nchave,chave);
	and and3 (s4,nchave,s1);
   or  or2  (s,s2,s4);
	
   endmodule // LU  

// ------------------------------
// LU4
// ------------------------------

   module LU4(output[3:0]s, input[3:0]a, input[3:0]b, input chave);
	
	LU gate1 (s[0],a[0],b[0],chave);
	LU gate2 (s[1],a[1],b[1],chave);
	LU gate3 (s[2],a[2],b[2],chave);
	LU gate4 (s[3],a[3],b[3],chave);
	
	endmodule // LU4
	
	module teste;
	
   reg [3:0]x;
	reg [3:0]y;
	reg c;
	wire [3:0]k;
	
	LU4 jujuba(k,x,y,c);
	
	//endmodule
	
	
	
initial begin:start

  
	#1 x = 4'b0000;     y = 4'b0000;    c = 0;



// ------------------------------ parte principal


	
      $display("Exemplo0032 - Isabel Bicalho Amaro - 451580\n");
		$display("Test LU's module\n");
		
		#1 x = 4'b0000;     y = 4'b0000;    c = 0;
		#1
   // projetar testes do modulo
      $monitor("a = %3b b = %3b chave = %3b s = %3b",x,y,c,k);
   
	#1 x = 4'b0101;     y = 4'b1001;
	#1 c = 1;
	end
	
endmodule // LU4

/*

    Exemplo0032 - Isabel Bicalho Amaro - 451580
    
    Test LU's module
    
    a = 0000 b = 0000 chave =   0 s = 0000
    a = 0101 b = 1001 chave =   0 s = 1101
    a = 0101 b = 1001 chave =   1 s = 0001

*/