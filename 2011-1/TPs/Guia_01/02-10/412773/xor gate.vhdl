// ---------------------
// Nome:Silvino Henrique Santos de Souza	
// Matricula: 412773
// ---------------------

// ---------------------
// -- XOR gate
// ---------------------

module xorgate (s, p, q);
 output s;
 input  p, q;

 assign s = ((p ^ q));

endmodule // xorgate

// ---------------------
// -- test xor gate
// ---------------------

module testxorgate;
 reg   a, b;
 wire  s;
          // instancia
 xorgate XOR1 (s, a, b);
 
          // parte principal
 initial begin
      $display("Guia 1 - Silvino Henrique Santos de Souza - 412773");
      $display("Test XOR gate");
      $display("\n((a ^ b)) = s\n");
      a=0; b=0;
  #1  $display("(%b ^ %b) = %b", a, b, s);
      a=0; b=1;
  #1  $display("(%b ^ %b) = %b", a, b, s);
      a=1; b=0;
  #1  $display("(%b ^ %b) = %b", a, b, s);
      a=1; b=1;
  #1  $display("(%b ^ %b) = %b", a, b, s);

 end

endmodule // testxorgate

/*Teste
Guia 1 - Silvino Henrique Santos de Souza - 412773
    Test XOR gate
    
    ((a ^ b)) = s
    
    (0 ^ 0) = 0
    (0 ^ 1) = 1
    (1 ^ 0) = 1
    (1 ^ 1) = 0*/