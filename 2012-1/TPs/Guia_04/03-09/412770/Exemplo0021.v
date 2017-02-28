// ---------------------------------- 
// Exemplo0021 - FULL ADDER 
// Nome:Rayan Darwin 
// Matricula: 412770
// ---------------------------------- 



// ------------------------- 
// full adder
// ------------------------- 

module fullAdder (output s, output carryOut,  input a, input b, input carryIn); 

	
  wire tmp1, tmp2, tmp3;
  
//-- portas 

  xor (tmp1, a, b);   
  and (tmp3, a , b );
  
  and (tmp2, tmp1 , carryIn);  
  
  xor (s , tmp1 , carryIn);
  or (carryOut ,tmp2 ,tmp3 );

endmodule //-- fullAdder

// ------------------------- 
// 4bit full adder 
// ------------------------- 
module fourBitFullAdder(s, carryOut, x, y, carryIn);
  
  output [3:0] s;
  output carryOut;
  input  [3:0] x, y;
  input carryIn;
  wire c1, c2, c3;
  
  //-- portas 
  
  fullAdder FULLADDER0(s[0], c1, x[0], y[0], carryIn);
  fullAdder FULLADDER1(s[1], c2, x[1], y[1], c1);
  fullAdder FULLADDER2(s[2], c3, x[2], y[2], c2);
  fullAdder FULLADDER3(s[3], carryOut, x[3], y[3], c3);
  
endmodule //-- fourbitFullAdder
 

module test_fullAdder; 
// ------------------------- definir dados 
reg [3:0] a; 
reg [3:0] b; 
reg carryIn; 
wire [3:0] soma;
wire carryOut; 

fourBitFullAdder FOURBITFULLADDER0(soma, carryOut, a, b, carryIn);

// ------------------------- parte principal 
  initial
  begin
  $display("Exemplo0021 - Rayan Darwin - 412770"); 
  $display("Test ALU's Full Adder:"); 
 
  //-- Mostrar testes
 
  $monitor($time," a = %b b = %b carry in= %b *** carry out = %b Soma = %b\n" , a , b , carryIn,carryOut,soma);
  end
  
  //-- Entradas
  initial
  begin
  a = 4'd2;b = 4'd4; carryIn = 1'b0;


  #5 a = 4'd2;b = 4'd4;
  #5 a = 4'd6;b = 4'd8;
  #5 a = 4'd1;b = 4'd3;
  #5 a = 4'd5;b = 4'd7;
  #5 a = 4'd10;b = 4'd5;
  carryIn = 1'b1;


  end
endmodule //-- test_fullAdder 