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

 always @ ( clock )
  begin
       signal = 1'b1;
  #6  signal = 1'b0;
  #6  signal = 1'b1;
  end
endmodule // pulso

module guia09exercicio01;

 wire  clock;
 clock clk ( clock );
 wire  p1;

 pulso   pulso1   ( p1, clock );

 initial begin
  $dumpfile ( "guia09exercicio01.vcd" );
  $dumpvars ( 1, clock, p1 );

  #480 $finish;
 end

endmodule
