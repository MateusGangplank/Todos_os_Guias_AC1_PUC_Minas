// ---------------------------
//Exercicio02_Guia09
//Nome: Marcos Felipe Martins Silva
//Matricula: 415719
// ---------------------------

//implementar um gerador de pulsos com um ter�o do periodo

module clock ( clk );
 output clk;
 reg    clk;

 initial
  begin
   clk = 1'b0;
  end

 always
  begin
   #9 clk = ~clk;
  end
endmodule

module pulse ( signal, clock );
 input  clock;
 output signal;
 reg    signal;

 always @ ( clock )
  begin
      signal = 1'b1;
  #3  signal = 1'b0;
  #3  signal = 1'b1;
  #3  signal = 1'b0;
  end
endmodule // pulse

module Exercicio02;

 wire  clock;
 clock clk ( clock );

 reg   p;

 wire  p1;

 pulse   pulse1   ( p1, clock );


 initial begin
   p = 1'b0;
 end

 initial begin
  $dumpfile ( "Exercicio02.vcd" );
  $dumpvars ( 1, clock, p1, p );

  #160p = 1'b1;
  #240 p = 1'b0;
  #320 p = 1'b1;
  #400 p = 1'b0;
  #480 p = 1'b1;
  #560 p = 1'b0;
  #576 $finish;
 end

endmodule // Exercicio02