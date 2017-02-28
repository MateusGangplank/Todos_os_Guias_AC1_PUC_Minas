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

 always @ ( posedge clock )
  begin
      signal = 1'b1;
  #6  signal = 1'b0;
  #6  signal = 1'b1;
  #6  signal = 1'b0;
  end
endmodule // pulse

module pulso2 ( signal, clock );
 input  clock;
 output signal;
 reg    signal;

 always @ ( negedge clock )
  begin
      signal = 1'b1;
  #6  signal = 1'b0;
  #6  signal = 1'b1;
  #6  signal = 1'b0;
  end
endmodule // pulso


module guia09exercicio03;

 wire  clock;
 clock clk ( clock );
 wire  p1;
 wire  p2;

 pulso   pulso1   ( p1, clock );
 pulso2   pulso2   ( p2, clock );

 initial begin
  $dumpfile ( "guia09exercicio03.vcd" );
  $dumpvars ( 1, clock, p1, p2);

  #480 $finish;
 end

endmodule
