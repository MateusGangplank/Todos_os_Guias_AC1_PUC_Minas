//ARQ1 - Eduardo Botelho de Andrade

module and3 (output s,
             input a,
             input b,
             input c);

 assign s = a & b & c ;
 
endmodule

module tabela_verdade;

 reg a,b,c;
 wire s;
 
 and3 and1 (s,a,b,c);
 
 initial
  begin
   a=0; b=0; c=0;
  end

 initial
  begin
   $display("Output  A  B  C");
   $monitor("  %b   %b %b %b",s,a,b,c);

   #1 c=1;
   #1 b=1; c=0;
   #1 c=1;
   #1 a=1; b=0; c=0;
   #1 c=1;
   #1 b=1; c=0;
   #1 c=1;
  end
endmodule
