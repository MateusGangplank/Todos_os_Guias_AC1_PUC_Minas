// ---------------------------
//Exercicio03_Guia09
//Nome: Marcos Felipe Martins Silva
//Matricula: 415719
// ---------------------------

//Implementar um gerador de pulsos sincronizado apenas
// com as variações (de subida e de descida) de "clock" e
// duração de 4 unidades de tempo.

module clock ( clk );
 output clk;
 reg    clk;

 initial
  begin
   clk = 1'b0;
  end

 always
  begin
   #16 clk = ~clk;
  end
endmodule

module pulse ( signal, clock );
 input  clock;
 output signal;
 reg    signal;

 always @ ( clock )
  begin
      signal = 1'b0;
  #4  signal = 1'b1;

  end
endmodule // pulse

module Exercicio03;

 wire  clock;
 clock clk ( clock );

 reg   p;

 wire  p1;

 pulse   pulse1   ( p1, clock );


 initial begin
   p = 1'b0;
 end

 initial begin
  $dumpfile ( "Exercicio03.vcd" );
  $dumpvars ( 1, clock, p1, p );

  #160 p = 1'b1;
  #240 p = 1'b0;
  #320 p = 1'b1;
  #400 p = 1'b0;
  #480 p = 1'b1;
  #560 p = 1'b0;
  #576 $finish;
 end

endmodule // Exercicio03
