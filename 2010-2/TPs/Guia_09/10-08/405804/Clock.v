// ---------------------
// AC1 - 06/10/2010
//	Guia 09 - v 0.1
//
// Nome: Gustavo Guimarães
// Matricula: 405804
// ---------------------

// ----------------------------
// -- Clock
// ----------------------------

//`include "clock.v"

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

// ---------------------------
// -- Pulso Exercicio01
// ---------------------------
	
module exer01 ( signal, clock );

 input  clock;
 output signal;
 reg    signal;

 always @ ( clock )
  begin
       signal = 1'b0;
  #24  signal = 1'b1;
  #24  signal = 1'b0;
  end
  
endmodule // exer01

// ---------------------------
// -- Pulso Exercicio02
// ---------------------------

module exer02 ( signal, clock );

 input  clock;
 output signal;
 reg    signal;

 always @ ( clock )
  begin
      signal = 1'b0;
  #4  signal = 1'b1;
  #4  signal = 1'b0;
  end
  
endmodule // exer02

// ---------------------------
// -- Testar Clock
// ---------------------------

module testclock;

 wire  clock;
 clock clk ( clock );

 wire  p1, p2;

 exer01   EXER01   ( p1, clock );
 exer02   EXER02   ( p2, clock );

 initial begin
  $dumpfile ( "Clock.vcd" );
  $dumpvars ( 1, clock, p1, p2);

  #300 $finish;
 end

endmodule // testclock
