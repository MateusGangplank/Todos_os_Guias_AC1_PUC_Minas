
// ---------------------
// Exercicio 03
// Nome: J�ssica Daniela
// Matricula: 407450
// ---------------------

module clock ( clk );
 output clk;
 reg  clk;
 initial
  begin
   clk = 1'b0;
  end
 always
  begin
  #2 clk = ~clk;
  end
endmodule

module pulse ( signal, clock );
 input  clock;
 output signal;
 reg    signal;
 always @ ( clock )
  begin
      signal = 1'b0;
  #2  signal = 1'b1;
  end
endmodule // pulse

module teste;
 wire  clock;
 clock clk ( clock );
 reg s;
 wire pt;
 pulse p1 (pt,clock);
 initial
 begin
 s = 1'b0;
 end
 
 initial begin
  $dumpfile ( "exercicio03.vcd" );
  $dumpvars(1, clock, pt);
  		s = 1'b0;
  #100 s = 1'b1;
  #150 s = 1'b0;
  #200 s = 1'b1;
  #250 $finish;
 end
 endmodule