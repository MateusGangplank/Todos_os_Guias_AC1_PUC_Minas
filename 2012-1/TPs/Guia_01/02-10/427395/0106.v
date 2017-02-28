//ARQ1 - Eduardo Botelho de Andrade

module xor2 (output s,
             input a,
             input b);

 assign s = ((~a)&b)|(a&(~b));
 
endmodule

module tabela_verdade;

 reg a,b;
 wire s;
 
 xor2 xor1 (s,a,b);
 
 initial
  begin
   a=0; b=0;
  end

 initial
  begin
   $display("Output  A  B");
   $monitor("  %b   %b %b",s,a,b);

   #1 b=1;
   #1 a=1; b=0;
   #1 b=1;
  end
endmodule
