// -------------------------
// Exemplo0007
// Nome: Gustavo Barbosa
// Matricula: 427410

module nor2 (output s,input p,input q);

 assign s = (~(p|q));

endmodule

module testnor;

 reg a,b;
 wire s;

 nor2 nor1 (s,a,b);

 initial begin: start
   a=0; b=0;
  end

 initial begin
   $display("Teste NOR");
   $display("\n~(a|b) = s\n");
   $monitor("  %b   %b %b",s,a,b);

   #1 a=0;b=1;
   #1 a=1; b=0;
   #1 a=1;b=1;
  end
endmodule

