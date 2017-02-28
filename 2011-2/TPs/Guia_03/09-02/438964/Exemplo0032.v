// ------------------------- 
// Exemplo0032 - BASE 
// Nome: Ederson Cristiano Nunes 
// Matricula: 438964
// Versao: 0.2 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [3:0] s1, 
           output [3:0] s2,
			  output [3:0] s3,
			  output [3:0] s4,
			  output [3:0] s5,
           input  [3:0] x, 
           input  [3:0] y,
			  input  [3:0] chave); 
	  
	wire [3:0] s1; 
   wire [3:0] s2;
   wire [3:0] s3; 
   wire [3:0] s4; 
   wire [3:0] s5; 

// descrever por portas 

and and1 [3:0](s1,x,y);
or  or1  [3:0](s2,x,y); 
not not1 [3:0](nchave,chave);
and and2 [3:0](s3,s1,chave);
and and3 [3:0](s4,s2,nchave);
or  or2  [3:0](s5,s3,s4); 

endmodule // f4 

module test_f4; 
// ------------------------- definir dados 
   
	reg [3:0] x,y,chave;
	wire [3:0] s1,s2,s3,s4,s5; 

   f4 modulo (s1,s2,s3,s4,s5,x,y,chave); 


// ------------------------- parte principal 

initial begin 
$display("Exemplo0032 - Ederson Cristiano Nunes - 438964"); 
$display("Test LU's module"); 

x = 4'b0011;  y = 4'b0101;  chave= 4'b0000; 

// projetar testes do modulo 
 $monitor("x=%4b y=%4b chave=%4b  s5=%4b", x, y, chave,  s5);
 
 #1 chave= 4'b1111;  

end 

endmodule // test_f4 
		 
//Test LU's module
//0011 0101 0001 0111

//Test LU's module
    //x=0011 y=0101 chave=0000  s5=0111
    //x=0011 y=0101 chave=1111  s5=0001
    //

