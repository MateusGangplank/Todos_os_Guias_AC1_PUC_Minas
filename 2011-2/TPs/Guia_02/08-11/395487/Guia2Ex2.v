// ---------------------
// Guia 02 Exercicio 2
// Nome:Álvaro Henrique de Araújo Rungue
// Matricula: 395487
// ---------------------


// parte principal

module exercicio2;

//--registradores para limitar numero de bits
//--registradores para as respostas

reg [5:0] a;
reg [5:0] b;
reg [3:0] c;
reg [6:0] d;
reg [9:0] e;

//--Registradores para os dados

//--Letra A
reg[5:0] f;
reg[4:0] g;

//--Letra B
reg[4:0] h;
reg[4:0] i;

//--Letra C
reg[9:0] j;
reg[5:0] k;

//--Letra D
reg[8:0] l;
reg[8:0] m;

//--Letra E
reg[4:0] n;
reg[5:0] o;
reg[6:0] p;

 initial begin:main

//-- (Numero de Bits)'(base)(numero na base)

//-- Valor dos registradores para os dados

//--Letra A
f = 6'b100010;
g = 5'b11010;

//--Letra B
h = 5'b11010;
i = 5'o23;

//--Letra C
j = 10'o1234;
k = 6'h2d;

//--Letra D
l = 9'h1a9;
m = 9'b101101001;

//--Letra E
n = 5'd25;
o = 6'o41;
p = 7'h6b;
 
 a = f + g;
 b = h + i;
 c = j / k;
 d = l - m;
 e = (n * o) + p;
 
 
      $display("Guia 2 - Exercicio: 2 - Alvaro");
      $display("Resposta das somas:");
  
 $display("a = %b" ,  a );
 $display("b = %b" ,  b );
 $display("c = %b" ,  c );
 $display("d = %b" ,  d );
 $display("e = %b" ,  e );
      
 end

endmodule //
