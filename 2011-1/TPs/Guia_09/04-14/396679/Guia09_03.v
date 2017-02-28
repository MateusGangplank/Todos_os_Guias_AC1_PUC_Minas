// ---------------------
// Guia 09_03 - Gerador de Pulsos
// Nome: Bruno Cezar Andrade Viallet
// Matricula: 396679
// ---------------------

//----------------------------
//-- Clock
//----------------------------

module clock (clk);
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
endmodule // clock

//----------------------------
//-- Pulse
//----------------------------

module pulse (signal, clock);
 input  clock;
 output signal;
 reg    signal;

  initial
  begin
   signal = 1'b0;
  end

 always
  begin
   #6 signal = ~signal;
  
  end
endmodule // pulse

//----------------------------
//-- Test
//----------------------------

module testpulse;
 wire  clock;
 clock clk (clock);
 wire  s1;
 
 pulse   pulse1   (s1, clock);

 initial begin
  $display ("Guia09_03 - Bruno Cezar Andrade Viallet - 396679");
  $dumpfile ("Guia09_03.vcd");
  $dumpvars (1, clock, s1);
   #480 $finish;

  end

endmodule // testpulse