// ---------------------------------- 
// Exemplo0024 - Comparador Diferenca
// Nome: Alvaro Henrique de Araujo Rungue 
// Matricula: 395487
// ---------------------------------- 

module comparadorDiferenca(output [3:0] s , input [3:0] a , input [3:0] b);

xor XOR0( s[0] , a [0] , b [0] );
xor XOR1( s[1] , a [1] , b [1] );
xor XOR2( s[2] , a [2] , b [2] );
xor XOR3( s[3] , a [3] , b [3] );

endmodule //-- fim comparador

module teste_comparadorDiferenca;

// ------------------------- definir dados 
reg [3:0] a; 
reg [3:0] b; 
wire [3:0] resp;


comparadorDiferenca COMPARADORDIFERENCA1(resp,a,b);

// ------------------------- parte principal 
  initial
  begin
  $display("Exemplo0024 - Alvaro Henrique de Araujo Rungue - 395487"); 
  $display("\nTest ALU's Comparador Diferenca:\n"); 
 
  //-- Mostrar testes
  
  a = 4'b0001;b = 4'b0011;
  $monitor("a = %b , b =  %b , Resposta : %b" , a , b , resp);
  
  
  //-- Entradas
  
  #1 a = 4'b0001;b = 4'b1111;
  #1 a = 4'b0011;b = 4'b1011;
  #1 a = 4'b0001;b = 4'b1011;
  #1 a = 4'b0001;b = 4'b1011;

    
  end
endmodule //-- test_fullAdder 


