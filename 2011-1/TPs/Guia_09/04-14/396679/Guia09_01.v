// ---------------------
// Guia 09_01 - Gerador de Pulsos
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
   #6 clk = ~clk;
  end
endmodule // clock

//----------------------------
//-- Pulse
//----------------------------

module pulse (signal, clock);
 input  clock;
 output signal;
 reg    signal;

 always @ (clock)
  begin
       signal = 1'b0;
  #3   signal = 1'b1;
  #3   signal = 1'b0;
    
  
  end
endmodule // pulse

//----------------------------
//-- Test
//----------------------------

module testpulse;
 wire  clock;
 clock c (clock);
 wire  s1;

 pulse   pulse1   (s1, clock);

 initial begin
  $display ("Guia09_01 - Bruno Cezar Andrade Viallet - 396679");
  $dumpfile ("Guia09_01.vcd");
  $dumpvars (1, clock, s1);
   #480 $finish;

 end

endmodule // testpulse