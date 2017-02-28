// ------------------------- 
// Exemplo0034 - BASE 
// Nome: Ederson Cristiano Nunes 
// Matricula: 438964
// Versao: 0.4 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [3:0] s1, 
           output [3:0] s2,
			  output [3:0] s3,
			  output [3:0] s4,
			  output [3:0] s5,
			  output [3:0] s6,
			  output [3:0] s7,
			  output [3:0] s8,
           input  [3:0] x, 
           input  [3:0] y,
			  input  [3:0] chave); 
			  
	wire [3:0] s1; 
   wire [3:0] s2;
   wire [3:0] s3; 
   wire [3:0] s4; 
   wire [3:0] s5; 
	wire [3:0] s6; 
	wire [3:0] s7; 
	wire [3:0] s8; 

// descrever por portas 

xor  xor1  [3:0](s1,x,y);
xnor xnor1 [3:0](s2,x,y);
nor  nor1  [3:0](s3,x,y);
or   or1   [3:0](s4,x,y); 
and  and1  [3:0](s5,chave,s1);
not  not1  [3:0](nchave,chave);
and  and2  [3:0](s6,chave,s2);
and  and3  [3:0](s7,nchave,s3);
and  and4  [3:0](s8,nchave,s4);

endmodule // f4 

module test_f4; 
// ------------------------- definir dados 
   
	reg [3:0] x,y,chave;
	wire [3:0] s1,s2,s3,s4,s5,s6,s7,s8; 

   f4 modulo (s1,s2,s3,s4,s5,s6,s7,s8,x,y,chave); 


// ------------------------- parte principal 

initial begin 
$display("Exemplo0034 - Ederson Cristiano Nunes - 438964"); 
$display("Test LU's module"); 
$display("CHAVE 0 = NOR - OR, CHAVE 1 = XOR - XNOR"); 

x = 4'b0011;  y = 4'b0101;  chave= 4'b0000; 

// projetar testes do modulo 
 $monitor("x=%4b y=%4b chave=%4b  XOR=%4b  XNOR=%4b  NOR=%4b  OR=%4b", x, y, chave,  s5,  s6,  s7,   s8);
 
 #1 chave= 4'b1111;  

end 

endmodule // test_f4 
		 
//Test LU's module
//0011 0101 0001 0111

//Test LU's module
    //x=0011 y=0101 chave=0000  s5=0111
    //x=0011 y=0101 chave=1111  s5=0001
	 
//Test LU's module
//CHAVE 0 = AND - OR, CHAVE 1 = NAND - NOR
//x=0011 y=0101 chave=0000  NAND=0000  NOR=0000  AND=0001  OR=0111
//x=0011 y=0101 chave=1111  NAND=1110  NOR=1000  AND=0000  OR=0000

//Test LU's module
//CHAVE 0 = NOR - OR, CHAVE 1 = XOR - XNOR
//x=0011 y=0101 chave=0000  XOR=0000  XNOR=0000  NOR=1000  OR=0111
//x=0011 y=0101 chave=1111  XOR=0110  XNOR=1001  NOR=0000  OR=0000

