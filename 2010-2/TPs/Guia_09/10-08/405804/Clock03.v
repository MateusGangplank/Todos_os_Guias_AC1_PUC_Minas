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
   #18 clk = ~clk;
  end
  
endmodule

// ---------------------------
// -- Pulso Exercicio03
// ---------------------------

module exer03 ( signal, clock );
 input  clock;
 output signal;
 reg    signal;

 always @ ( posedge clock )
  begin
      signal = 1'b1;
	#4 signal = 1'b0;
  end
  
 always @ ( negedge clock )
  begin
  		signal = 1'b1;
   #4 signal = 1'b0;
  end
endmodule // exer03

//----------------------------
//-- Pulso Exercicio04
//----------------------------

module exer04 ( signal, clock );
 input  clock;
 output signal;
 reg    signal;

  
 always @ ( negedge clock )
  begin
  		  signal = 1'b1;
    #90 signal = 1'b0;
  end
endmodule

//----------------------------
//-- Pulso Exercicio05
//----------------------------

module exer05 ( signal, clock );
 input  clock;
 output signal;
 reg    signal;

  
 always @ ( posedge clock )
  begin
  	    signal = 1'b1;
    #6 signal = 1'b0;
  end
endmodule

// ---------------------------
// -- Testar Clock
// ---------------------------

module testclock03extras;

 wire  clock;
 clock clk ( clock );

 wire  p3, p4, p5;

 exer03	 EXER03   ( p3, clock );
 exer04	 EXER04	 ( p4, clock );
 exer05	 EXER05	 ( p5, clock );

 initial begin
  $dumpfile ( "Clock03.vcd" );
  $dumpvars ( 1, clock, p3, p4, p5);

  #300 $finish;
 end

endmodule // testclockextras