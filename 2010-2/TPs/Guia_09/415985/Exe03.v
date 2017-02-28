// ---------------------
// PUC - MG
// Nome: Bruno César Lopes Silva
// Matricula: 415985
//
//	Guia 09 - Exercicio 03
// ---------------------

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

module pulso ( sinal, clock );
 input  clock;
 output sinal;
 reg    sinal;

 always @ ( clock )
  begin
       sinal = 1'b1;
  #4  sinal = 1'b0;
  #4  sinal = 1'b1;
  #4  sinal = 1'b0;
  #4  sinal = 1'b1;
  #4  sinal = 1'b0;
  end
endmodule // pulso

module testclock01b;

 wire  clock;
 clock clk ( clock );

 reg   p;

 wire  p1,t1;

 pulso   pulso1   ( p1, clock );

 initial begin
   p = 1'b0;
 end

 initial begin
  $dumpfile ( "exercicio03.vcd" );
  $dumpvars ( 1, clock, p1, p, t1 );

  #060 p = 1'b1;
  #120 p = 1'b0;
  #180 p = 1'b1;
  #240 p = 1'b0;
  #300 p = 1'b1;
  #360 p = 1'b0;
  #376 $finish;
 end

endmodule // clock2