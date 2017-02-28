// --------------
// Exemplo0003 - XOR
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 02/08/2012
// --------------

// --------------
// -- xor gate
// --------------
module xorgate(output [0:3]s, input [0:3]p, input [0:3]q);
 assign s = p ^ q;
endmodule

// -------------
// -- test xor gate
// -------------
module testorgate;
//-------------- Dados locais
 reg [0:3]a;
 reg [0:3]b; //Definir registradores 
 wire [0:3]s; //Definir conexão (fio)

// ------------- Intância
 xorgate XOR1(s, a, b);

// ------------- Preparação
 initial begin: start
  a = 4'b0011; b = 4'b0101;
 end

// ------------- Parte principal
 initial begin: main
   $display("Exemplo0005 - Josemar Alves Caetano - 448662");
   $display("Teste XOR gate.");
   $display("\na ^ b = s\n");
  
   $monitor("\t%b ^ %b = %b", a , b, s);
  #1 a = 0; b = 0; //Valores decimais
  #1 a = 4'b0010; b = 4'b0001; //Valores binários
  #1 a = 4'd1; b = 3; //Valores decimais
  #1 a = 4'o5; b = 2; //Octal e decimal
  #1 a = 4'hA; b = 3; //Hexadecimal e decimal
  #1 a = 4'h9; b = 4'o3; //Hexadecimal e octal
 
 end //main
 
endmodule //testxorgate 
 

