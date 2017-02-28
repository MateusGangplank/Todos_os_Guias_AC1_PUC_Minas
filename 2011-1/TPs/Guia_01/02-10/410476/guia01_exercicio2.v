//-------------------------------
//Guia 01 .
//Larissa Fernades Leijoto-410476
//-------------------------------


//------------------------------
// --NOR gate----
//------------------------------

module norgate (s,a,b,c);
output s;
input a,b,c;

assign s = ~( a | b) | c;

endmodule // norgate

//-----------------------------
//--Teste NOR gate
//-----------------------------

module testnorgate;
 reg   a, b, c;
 wire  s;
          // instancia
 norgate NOR1 (s, a, b, c);
 
          // parte principal
 initial begin
      $display("Guia01/Exercicio2 - Larissa Fernandes Leijoto - 410476");
      $display("Test NOR gate");
      $display("\na | b | c = s\n");
      a=0; b=0;c=0;
  #1  $display("%b | %b | %b = %b", a, b, c, s);
      a=0; b=0;c=1;
  #1  $display("%b | %b | %b = %b", a, b, c, s);
      a=0; b=1;c=0;
  #1  $display("%b | %b | %b = %b", a, b, c, s);
      a=0; b=1;c=1;
  #1  $display("%b | %b | %b = %b", a, b, c, s);
      a=1;b=0;c=0;
  #1  $display("%b | %b | %b = %b", a, b, c, s);
      a=1; b=0;c=1;
  #1  $display("%b | %b | %b = %b", a, b, c, s);
      a=1; b=1;c=0;
  #1  $display("%b | %b | %b = %b", a, b, c, s);
      a=1; b=1;c=1;
  #1  $display("%b | %b | %b = %b", a, b, c, s);
   end

endmodule // testnorgate
