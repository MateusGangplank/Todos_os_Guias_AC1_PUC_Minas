// ---------------------------
// Larissa Fernande Leijoto-410476
//Guia 09
// ---------------------------

module clock ( clk );
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

module pulso ( signal, clock );
 input  clock;
 output signal;
 reg    signal;

 always @ ( negedge clock )
  begin
      signal = 1'b1;
  #48 signal = 1'b0;
  end
endmodule // pulso

module guia09exercicio04;

 wire  clock;
 clock clk ( clock );
 wire  p1;

 pulso   pulso1   ( p1, clock );

 initial begin
  $dumpfile ( "guia09exercicio04.vcd" );
  $dumpvars ( 1, clock, p1);

  #480 $finish;
 end

endmodule
