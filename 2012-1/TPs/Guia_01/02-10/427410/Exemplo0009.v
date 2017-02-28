// Exemplo0009
// Nome: Gustavo Barbosa
// Matricula: 427410

module nand2 (output s,input p,input q);

 assign s = ((~p)|(~q));
 
endmodule

module testenand;

 reg a,b;
 wire s;
 
 nand2 nand1 (s,a,b);
 
 initial begin: start
   a=0; b=0;
  end

 initial begin
   $display("Teste NAND");
   $display("\n(~p)|(~q)\n");
   $monitor("  %b   %b %b",s,a,b);

   #1 a=0;b=1;
   #1 a=1; b=0;
   #1 a=1; b=1;
  end
endmodule
