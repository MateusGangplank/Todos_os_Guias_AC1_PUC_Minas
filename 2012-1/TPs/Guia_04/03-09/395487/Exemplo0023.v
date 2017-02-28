// ---------------------------------- 
// Exemplo0023 - Comparador
// Nome: Alvaro Henrique de Araujo Rungue 
// Matricula: 395487
// ---------------------------------- 

module comparador(output [3:0] s , input [3:0] a , input [3:0] b);

xnor XNOR0( s[0] , a [0] , b [0] );
xnor XNOR1( s[1] , a [1] , b [1] );
xnor XNOR2( s[2] , a [2] , b [2] );
xnor XNOR3( s[3] , a [3] , b [3] );

endmodule //-- fim comparador

module teste_comparador;

// ------------------------- definir dados 
reg [3:0] a; 
reg [3:0] b; 
wire [3:0] resp;


comparador COMPARADOR1(resp,a,b);

// ------------------------- parte principal 
  initial
  begin
  $display("Exemplo0023 - Alvaro Henrique de Araujo Rungue - 395487"); 
  $display("\nTest ALU's Comparador:\n"); 
 
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


