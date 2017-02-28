// Exemplo0012
// Nome: Gustavo Barbosa
// Matricula: 427410

module xnor2 (output s,input p,input q);

 assign s = (p&q)|((~p)&(~q));

endmodule

module testexnor;

 reg a,b;
 wire s;

 xnor2 xnor1 (s,a,b);

 initial begin: start
   a=0; b=0;
  end

//Principal
 initial begin
    $display("Teste XNOR");
   $display("\n(p&q)|((~p)&(~q) = s\n");
   $monitor("  %b   %b %b",s,a,b);

   #1 a=0;b=1;
   #1 a=1; b=0;
   #1 a=1;b=1;
  end
endmodule
