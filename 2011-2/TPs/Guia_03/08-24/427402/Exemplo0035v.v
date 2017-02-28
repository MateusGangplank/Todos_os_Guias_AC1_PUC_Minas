// -------------------------
// Exemplo0035 - Exemplo0033.v
// Nome: Felipe Ferreira Andrade do Carmo
// Matricula: 427402
// ------------------------- 
 
// ------------------------- 
//  f4_gate 
// ------------------------- 
module f4 (output s1, output  s2,output  s3,output  s4,output  s5,
          output  s6,output  s7,output  s8,output [7:0] sFim,
                    input  a,
                    input  b);
 

// Parte And/Or
assign s1 = a&b;
assign s2 = a|b;

// Parte Nand/Nor
assign s3 = ~(a&b);
assign s4 = ~(a|b);

// Parte Xor/Xnor
assign s5 = a^b; //xor
assign s6 = ~(a^b); //xnor

// Parte ~a e ~b
assign s7 = ~a;
assign s8 = ~b;

//Selecao da resposta
assign sFim[0] = s8;
assign sFim[1] = s7;
assign sFim[2] = s6;
assign sFim[3] = s5;
assign sFim[4] = s4;
assign sFim[5] = s3;
assign sFim[6] = s2;
assign sFim[7] = s1;




endmodule // f4 
 
module test_f4; 
// ------------------------- definir dados 
       reg  x;
       reg  y;
       wire z1;
       wire z2;
       wire z3;
       wire z4;
       wire z5;
       wire z6;
       wire z7;
       wire z8;
       wire [7:0] zFim;
 
       f4 modulo ( z1, z2, z3 , z4 , z5, z6, z7 , z8, zFim, x, y);

// ------------------------- parte principal 

   initial begin 
      $display("Exemplo0035 - Felipe Ferreira Andrade do Carmo - 427402");
      $display("Test LU's module"); 
 
      x = 1'b0;       y = 1'b1;
 
   // projetar testes do modulo
	$display("\n  a \tb  \tresposta");
   #1 $display("%3b    %3b        %10b",x,y,zFim);
       x = 1'b1;       y = 1'b0;
   #1 $display("%3b    %3b        %10b",x,y,zFim);
       x = 1'b1;       y = 1'b1;
   #1 $display("%3b    %3b        %10b",x,y,zFim);
       x = 1'b0;       y = 1'b0;
   #1 $display("%3b    %3b        %10b",x,y,zFim);
 
   end 
 
endmodule // test_f4 