// -------------------------
// Exemplo0011
// Nome: Gustavo Barbosa
// Matricula: 427410

module xor2 (output s,input p,input q);

 assign s = ((~p)&q )|(p&(~q));

endmodule

module testexor;

 reg a,b;
 wire s;

 xor2 xor1 (s,a,b);

 initial begin: start
   a=0; b=0;
  end

 initial
  begin
   $display("Teste XOR");
   $display("\n (~p)&q )|(p&(~q) = s\n");
   $monitor("  %b   %b %b",s,a,b);

   #1 a=0;b=1;
   #1 a=1; b=0;
   #1 a=1;b=1;
  end
endmodule
