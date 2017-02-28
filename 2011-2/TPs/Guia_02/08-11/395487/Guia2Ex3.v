// ---------------------
// Guia 02 Exercicio 3
// Nome:Álvaro Henrique de Araújo Rungue
// Matricula: 395487
// ---------------------


// parte principal

module exercicio2;

//--registradores para limitar numero de bits

reg [5:0] a;
reg [5:0] b;
reg [3:0] c;
reg [4:0] d;
reg [5:0] e;

//-- registradores para a resposta
reg [5:0] h;
reg [5:0] i;
reg [3:0] j;
reg [4:0] k;
reg [5:0] l;

 initial begin:main

//-- (Numero de Bits)'(base)(numero na base)

//-- Valor dos registradores para os dados

//--EX3
a = 6'b100111;
b = 6'o54;
c = 4'd13;
d = 5'h1b;
e = 5'd25 - 6'd36;


//-- Calculo complemento de 2
h = ~a + 1'b1;
i = ~b + 1'b1;
j = ~c + 1'b1;
k = ~d + 1'b1;
l = ~e + 1'b1;

 
 $display("Guia 2 - Exercicio: 3 - Alvaro");
 $display("Resposta dos complementos de 2:");
  
 $display("a = %b" ,  h );
 $display("b = %b" ,  i );
 $display("c = %b" ,  j );
 $display("d = %b" ,  k );
 $display("e = %b" ,  l );
      
 end

endmodule //
