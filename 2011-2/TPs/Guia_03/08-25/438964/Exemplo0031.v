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

and a0 (s1[0],a[0],b[0]);
and a1 (s1[1],a[1],b[1]);
and a2 (9
and a3

or  
or
or
or

endmodule // f4 

module test_f4; 
// ------------------------- definir dados 
   reg  [3:0] x; 
   reg  [3:0] y; 
   wire [3:0] z; 

   f4 modulo (z, x, y); 

// ------------------------- parte principal 

initial begin 
$display("Exemplo0031 - Ederson Cristiano Nunes - 438964"); 
$display("Test LU's module"); 

x = 4'b0011;        y = 4'b0101; 

// projetar testes do modulo 
#1 $display("%3b %3b %3b",x,y,z); 

end 

       endmodule // test_f4 
 