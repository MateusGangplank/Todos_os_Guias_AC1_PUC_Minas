// -------------------------
// Exemplo0033 - Exemplo0033.v
// Nome: Felipe Ferreira Andrade do Carmo
// Matricula: 427402
// ------------------------- 
 
// ------------------------- 
//  f4_gate 
// ------------------------- 
module f4 (output [3:0] s1, output [3:0] s2,output [3:0] s3,output [3:0] s4,output [3:0] s5,
          output [3:0] s6,output [3:0] s7,output [3:0] s8,output [7:0] sFim,
                    input  [3:0] a,
                    input  [3:0] b,
                    input  [3:0] c);
 

// Parte ANDOR
assign s1 = a&b;
assign s2 = a|b;

// Parte NandNor
assign s3 = ~(a&b);
assign s4 = ~(a|b);

// Parte da chave
assign s5 = s1&~c;
assign s6 = s2&~c;
assign s7 = s3&c;
assign s8 = s4&c;

//Selecao da resposta
assign sFim[7:4] = s5|s7;
assign sFim[3:0] = s6|s8;




endmodule // f4 
 
module test_f4; 
// ------------------------- definir dados 
       reg  [3:0] x; 
       reg  [3:0] y;
       reg  [3:0] w;
       wire [3:0] z1;
       wire [3:0] z2;
       wire [3:0] z3;
       wire [3:0] z4;
       wire [3:0] z5;
       wire [3:0] z6;
       wire [3:0] z7;
       wire [3:0] z8;
       wire [7:0] zFim;
 
       f4 modulo ( z1, z2, z3 , z4 , z5, z6, z7 , z8, zFim, x, y , 2); 
 
// ------------------------- parte principal 

   initial begin 
      $display("Exemplo0033 - Felipe Ferreira Andrade do Carmo - 427402"); 
      $display("Test LU's module"); 
 
      x = 4'b0000;       y = 4'b0000;  w=4'b0000;
 
   // projetar testes do modulo 
	$display("\n  a \t  b \tc \tresposta");
   #1 $display("%3b    %3b  %3b      %10b",x,y,w,zFim);
          x = 4'b001;       y = 4'b0001;  w=4'b0000;
   #1 $display("%3b    %3b  %3b      %10b",x,y,w,zFim);
 
   end 
 
endmodule // test_f4 