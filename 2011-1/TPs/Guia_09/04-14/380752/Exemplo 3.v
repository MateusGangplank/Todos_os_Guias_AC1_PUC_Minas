// Exemplo 03
// Nome: Bruno Rafael Nicolletti
// Matricula: 380752

module clock ( clk );
 output clk;
 reg    clk;

 initial
  begin
   clk = 1'b0;
  end

 always
  begin
   #1 clk = ~clk;
  end
  
endmodule

module pulso ( sinal, clock );
 input  clock;
 output sinal;
 reg    sinal;

 always @ ( clock )
  begin
       sinal = 1'b1;
  #6  sinal = 1'b0;
  #6  sinal = 1'b1;
  #6  sinal = 1'b0;
  #6  sinal = 1'b1;
  #6  sinal = 1'b0;
  end
endmodule

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

endmodule