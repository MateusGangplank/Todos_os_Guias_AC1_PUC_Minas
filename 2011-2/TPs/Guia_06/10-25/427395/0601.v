//ARQ1 - Guia06 - Eduardo Botelho de Andrade

module clock (clk);
 output clk;
 reg    clk;
 
 initial 
  begin
   clk = 1'b0;
  end
 
 always
  begin
   #12 clk = ~clk;
  end
  
endmodule

module testModule;
 wire clk;
 clock CLK1 (clk);
 
 initial 
  begin
   $dumpfile ("0601.vcd");
   $dumpvars;
   #120 $finish;
  end
endmodule