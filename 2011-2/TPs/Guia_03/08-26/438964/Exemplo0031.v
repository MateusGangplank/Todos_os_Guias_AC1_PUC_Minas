// ------------------------- 
// Exemplo0031 - BASE 
// Nome: Ederson Cristiano Nunes 
// Matricula: 438964
// Versao: 0.1 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [3:0] s1, 
           output [3:0] s2,
           input  [3:0] a, 
           input  [3:0] b); 
endmodule // f4 

module test_f4; 
// ------------------------- definir dados 
   reg  [3:0] x; 
   reg  [3:0] y; 
   wire [3:0] z; 
   wire [3:0] t; 
	
   f4 modulo (z, t, x, y); 

// descrever por portas 

and a0 [3:0](z,x,y);
or  o0 [3:0](t,x,y); 


// ------------------------- parte principal 

initial begin 
$display("Exemplo0031 - Ederson Cristiano Nunes - 438964"); 
$display("Test LU's module"); 

x = 4'b0011;        y = 4'b0101; 

// projetar testes do modulo 
#1 $display("%3b %3b %3b %3b",x,y,z,t); 

end 

       endmodule // test_f4 
		 
   //Test LU's module
   //0011 0101 0001 0111
