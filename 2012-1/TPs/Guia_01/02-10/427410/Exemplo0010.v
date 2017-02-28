// Exemplo0010
// Nome: Gustavo Barbosa
// Matricula: 427410

module nor2 (output s,input p,input q);

 assign s = ((~q)&(~p));

endmodule

module testenor;

 reg a,b;
 wire s;

 nor2 nor1 (s,a,b);

 initial begin: start
   a=0; b=0;
  end

 initial
  begin
  $display("Teste AND3");
   $display("\n(~q)&(~p) = s\n");
   $monitor("  %b   %b %b",s,a,b);

   #1 a=0;b=1;
   #1 a=1; b=0;
   #1 a=1;b=1;
  end
endmodule
