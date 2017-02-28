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

// descrever por portas 



endmodule // f4 

module test_f4; 
// ------------------------- definir dados 
   reg  [3:0] x; 
   reg  [3:0] y; 
   wire [3:0] z0;
	wire [3:0] z1; 
	
	assign z0 = (x & y);
	assign z1 = (x | y);

   f4 modulo (z0, z1, x, y); 

// ------------------------- parte principal 

initial begin 
$display("Exemplo0031 - Ederson Cristiano Nunes - 438964"); 
$display("Test LU's module"); 

x = 4'b0011;        y = 4'b0101; 

// projetar testes do modulo 
#1 $display("%3b %3b %3b",x,y,z0[3:0]); 
#1 $display("%3b %3b %3b",x,y,z1);
 
end 

       endmodule // test_f4 
		 
// Duas operacoes simultaneas de 4 bits para or e and		 
//Exemplo0031 - Ederson Cristiano Nunes - 438964
    //Test LU's module
    //0011 0101 0001
    //0011 0101 0111
