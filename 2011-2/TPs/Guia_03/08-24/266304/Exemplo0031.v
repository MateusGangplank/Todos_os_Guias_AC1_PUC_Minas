// -------------------------
// Exemplo0031 - F4 
// Nome: Afonso Spinelli
// Matricula: 266304
// ------------------------- 
 
// ------------------------- 
//  f4_gate 
// ------------------------- 
module f4 (output [7:0] s,
           input  [3:0] a,
           input  [3:0] b);
 
   // descricao das portas AND
   assign s[3] = a[3] & b[3];
   assign s[2] = a[2] & b[2];
   assign s[1] = a[1] & b[1];
   assign s[0] = a[0] & b[0];
   
   // descricao das portas OR
   assign s[7] = a[3] | b[3];
   assign s[6] = a[2] | b[2];
   assign s[5] = a[1] | b[1];
   assign s[4] = a[0] | b[0];
 
endmodule // f4 
 
module test_f4; 
// ------------------------- definir dados 
       reg  [3:0] x; 
       reg  [3:0] y; 
       wire [7:0] z;
 
       f4 modulo (z, x, y); 
 
// ------------------------- parte principal 
 
   initial begin 
      $display("Exemplo0031 - Afonso Spinelli - 266304");
      $display("Test LU's module");
 
      x = 4'b0011;       y = 4'b0101;
      
    // projetar testes do modulo
   #1 $monitor("%3b & %3b = %3b \n%3b | %3b = %3b \n",x,y,z[3:0],x,y,z[7:4]);
   #2 x = 4'b1010;	y = 4'b1111;
   #3 x = 4'b1010;	y = 4'b0111;
 
   end 
 
endmodule // test_f4