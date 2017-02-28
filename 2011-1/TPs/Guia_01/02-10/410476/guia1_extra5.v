//-------------------------------
//Guia 01 .
//Larissa Fernades Leijoto-410476
//-------------------------------


//------------------------------
// --XOR gate----
//------------------------------

module xorgate (s,a,b);
output s;
input a,b;

assign s =  (~a&b | a&~b);

endmodule // xorgate

//-----------------------------
//--Teste XOR gate
//-----------------------------

module testandgate;
 reg   a, b;
 wire  s;
          // instancia
 xorgate XOR1 (s, a, b);
 
          // parte principal
 initial begin
      $display("Guia01/EXTRA2 - Larissa Fernandes Leijoto - 410476");
      $display("Test XOR gate");
      $display("\na ^ b  = s\n");
      a=0; b=0;
  #1  $display("%b ^ %b = %b", a, b, s);
      a=0; b=1;
  #1  $display("%b ^ %b = %b", a, b, s);
      a=1; b=0;
  #1  $display("%b ^ %b = %b", a, b, s);
      a=1; b=1;
  #1  $display("%b ^ %b = %b", a, b, s);
 
   end

endmodule // testxorgate
