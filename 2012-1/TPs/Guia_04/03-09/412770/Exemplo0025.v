// ---------------------------------- 
// Exemplo0025 - Complemento 2 
// Nome: Rayan Darwin 
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



//-- *********************************************************************************************


module complementoDois( output [3:0] s  , input [3:0] x  );

wire tmp1;

fourBitFullAdder FOURBITFULLADDER0( s , tmp1 , ~x , 0001 , 0 );

endmodule //-- fim complemento de 2

 

module test_complementoDois; 
// ------------------------- definir dados 
reg [3:0] a; 
wire [3:0] resp;

complementoDois COMPLEMENTODOIS0(resp,a);

// ------------------------- parte principal 
  initial
  begin
  $display("Exemplo0025 - Rayan Darwin - 412770"); 
  $display("Test ALU's Complemento 2:"); 
 
  //-- Mostrar testes
  
  a = 4'b0001;
  $monitor("a = %b , Resposta : %b" , a , resp);
  
  
  //-- Entradas
  
  #1 a = 4'b0101;
  #1 a = 4'b0010;
  #1 a = 4'b1001;
  #1 a = 4'b0111;

    
  end
endmodule //-- test complemento 2