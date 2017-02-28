// ---------------------------------- 
// Exemplo0027 - Comparador Diferenca
// Nome: Alvaro Henrique de Araujo Rungue 
// Matricula: 395487
// ---------------------------------- 

module comparador(output [3:0] s , input [3:0] a , input [3:0] b);

xnor XNOR0( s[0] , a [0] , b [0] );
xnor XNOR1( s[1] , a [1] , b [1] );
xnor XNOR2( s[2] , a [2] , b [2] );
xnor XNOR3( s[3] , a [3] , b [3] );

endmodule //-- fim comparador


module comparadorDiferenca(output [3:0] s , input [3:0] a , input [3:0] b);

xor XOR0( s[0] , a [0] , b [0] );
xor XOR1( s[1] , a [1] , b [1] );
xor XOR2( s[2] , a [2] , b [2] );
xor XOR3( s[3] , a [3] , b [3] );

endmodule //-- fim comparador

module comparadorComSelecao( output [3:0] s , input [3:0] a , input [3:0] b , input [3:0] chave );

wire [3:0] tmp0;
wire [3:0] tmp1;

comparador COMPARADOR0(tmp0 , a , b );
comparadorDiferenca COMPARADORDIFERENCA(tmp1 , a , b);

wire [3:0] tmp2;
wire [3:0] tmp3;
assign tmp2 =  (tmp0 & ~chave);
assign tmp3 =  (tmp1 & chave);

assign s = (tmp2 | tmp3);

endmodule //--Fim comparador

module teste_compareComSelecao;

// ------------------------- definir dados 
reg [3:0] a; 
reg [3:0] b;
reg [3:0] chave;
wire [3:0] resp;


comparadorComSelecao COMPARADORCOMSELECAO(resp,a,b,chave);

// ------------------------- parte principal 
  initial
  begin
  $display("Exemplo0027 - Alvaro Henrique de Araujo Rungue - 395487"); 
  $display("\nTest ALU's Comparador Com Diferenca:\n"); 
 
  //-- Mostrar testes
  
  a = 4'b0001;b = 4'b0011;chave = 4'b0000;
  $monitor("a = %b , b =  %b , Resposta : %b *** Chave = %b" , a , b , resp , chave);
  
  
  //-- Entradas
  
  #1 a = 4'b0001;b = 4'b1111;
  #1 a = 4'b0011;b = 4'b1011;
  #1 a = 4'b0001;b = 4'b1011;
  #1 a = 4'b0001;b = 4'b1011;
  
  #1 a = 4'b0001;b = 4'b1111;chave = 4'b1111;
  #1 a = 4'b0011;b = 4'b1011;
  #1 a = 4'b0001;b = 4'b1011;
  #1 a = 4'b0001;b = 4'b1011;

    
  end
endmodule //-- test 

