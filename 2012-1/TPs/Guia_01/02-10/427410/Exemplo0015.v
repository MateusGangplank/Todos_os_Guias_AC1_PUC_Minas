// -------------------------
// Exemplo0014
// Nome: Gustavo Barbosa
// Matricula: 427410
module or3 (output s,input p,input q,input r);

 or or1(w1,p,q);
 or or2(s,w1,r);

endmodule

module testeor;

 reg a,b,c;
 wire s;

 or3 or1 (s,a,b,c);
 
 initial begin: start
   a=0; b=0; c=0;
  end

 initial
  begin
  $display("Teste OR3");
   $display("\np || q || r = s\n");
   $monitor("  %b   %b %b %b",s,a,b,c);

   #1 a=0;b=0;c=1;
   #1 a=0;b=1; c=0;
   #1 a=0;b=1;c=1;
   #1 a=1; b=0; c=0;
   #1 a=1;b=0;c=1;
   #1 a=1;b=1; c=0;
   #1 a=1;b=1;c=1;
  end
endmodule
