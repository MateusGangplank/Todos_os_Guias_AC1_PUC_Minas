// ------------------------- 
// Exemplo0035 - BASE 
// Nome: Ederson Cristiano Nunes 
// Matricula: 438964
// Versao: 0.5 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [3:0] s0,
           output [3:0] s1, 
           output [3:0] s2,
			  output [3:0] s3,
			  output [3:0] s4,
			  output [3:0] s5,
			  output [3:0] s6,
			  output [3:0] s7,
           input  [3:0] x, 
           input  [3:0] y);
			  

// descrever por portas 

not  not0  [3:0](s0,x);
not  not1  [3:0](s1,y);
or   or0   [3:0](s2,x,y); 
nor  nor0  [3:0](s3,x,y); 
and  and0  [3:0](s4,x,y);
nand nand0 [3:0](s5,x,y);
xor  xor0  [3:0](s6,x,y);
xnor xnor0 [3:0](s7,x,y);

endmodule // f4 

module test_f4; 
// ------------------------- definir dados 
   
	reg [3:0] x,y;
	wire [3:0] s0,s1,s2,s3,s4,s5,s6,s7; 

   f4 modulo (s0,s1,s2,s3,s4,s5,s6,s7,x,y); 


// ------------------------- parte principal 

initial begin 
$display("Exemplo0035 - Ederson Cristiano Nunes - 438964"); 
$display("Test LU's module"); 
$display("NOT-OR-NOR-AND-NAND-XOR-XNOR"); 

x = 4'b0011;  y = 4'b0101;   

// projetar testes do modulo 
$monitor("x=%4b y=%4b not0=%4b  not1=%4b or0=%4b nor0=%4b and0=%4b nand0=%4b xor0=%4b xnor0=%4b", x, y, s0, s1, s2, s3, s4, s5, s6, s7);
 

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

