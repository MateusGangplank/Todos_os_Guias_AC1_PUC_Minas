//-------------------------------
//Guia 01 .
//Larissa Fernades Leijoto-410476
//-------------------------------


//------------------------------
// --XNOR gate----
//------------------------------

module xnorgate (s,a,b,c,d);
output s;
input a,b,c,d;

assign s = ~( a ^ b) ^(c ^ d);

endmodule // xnorgate

//-----------------------------
//--Teste XNOR gate
//-----------------------------

module testxnorgate;
 reg   a, b, c,d;
 wire  s;
          // instancia
 xnorgate XNOR1 (s, a, b, c,d);
 
          // parte principal
 initial begin
      $display("Guia01/Exercicio3 - Larissa Fernandes Leijoto - 410476");
      $display("Test XNOR gate");
      $display("\na ^ b ^ c = s\n");
      a=0; b=0;c=0;d=0;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=0; b=0;c=0;d=1;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=0; b=0;c=1;d=0;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=0; b=0;c=1;d=1;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=0;b=1;c=0;d=0;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=0; b=1;c=0;d=1;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=0; b=1;c=1;d=0;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=0; b=1;c=1;d=1;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=1; b=0;c=0;d=0;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=1; b=0;c=0;d=1;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=1; b=0;c=1;d=0;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=1;b=0;c=1;d=1;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=1; b=1;c=0;d=0;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=1; b=1;c=0;d=1;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=1; b=1;c=1;d=0;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);
      a=1; b=1;c=1;d=1;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c, d, s);

   end

endmodule // testnorgate
