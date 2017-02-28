// -------------------------
// Exemplo0014
// Nome: Gustavo Barbosa
// Matricula: 427410

module and3 (output s,input p,input q,input r);


 and and1(w1,p,q);
 and and2(s,w1,r);

endmodule

module testeand;

 reg a,b,c;
 wire s;
 
 and3 and1 (s,a,b,c);
 
 initial begin: start
   a=0; b=0; c=0;
  end

 initial
  begin
   $display("Teste AND3");
   $display("\np & q & r = s\n");
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
