// -------------------------
// Exemplo0023
// Nome: Lucas Siqueira Chagas
// Matricula: 380783
// ------------------------- 

// -------------------------
//  Diferenca
// ------------------------- 
module Igualdade (output s, input [3:0]a, input[3:0] b);

 xor (igualdade1,a[0],b[0]);
 xor (igualdade2,a[1],b[1]);
 xor (igualdade3,a[2],b[2]);
 xor (igualdade4,a[3],b[3]);

 nor (s4, igualdade1, igualdade2);
 nor (s3, s4, igualdade3);
 nor (s, s3, igualdade4);


endmodule // igualdade
 
module teste_Igualdade;
// ------------------------- definir dados 
reg [3:0] x;
reg [3:0] y;
wire igualdadeFinal;


  Igualdade h1 (igualdadeFinal, x,y);


// ------------------------- parte principal 
 initial begin 
$display("Exemplo0024 - Lucas Siqueira Chagas - 380783");
$display("Test ALU’s Diferenca"); 


x = 4'b0111;  y = 4'b0101;
#1
$display("%6b e %6b = %1b",x,y,~igualdadeFinal);
#1
x = 6'b1011;  y = 6'b1101;
$display("%6b e %6b = %1b",x,y,~igualdadeFinal);
#1
x = 4'b0011;  y = 4'b0011;
$display("%6b e %6b = %1b",x,y,~igualdadeFinal);

 end 
 
endmodule // test_fullAdder