// FAVOR COLOCAR NOME E MATRICULA AQUI

// ---------------------------
// -- clock
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

// ---------------------------------

// ---------------------------
// -- exercicio1
// ---------------------------

module exercicio1 (signal, clock);

input clock;
output signal;
reg signal;

always @ (posedge clock)
 begin
      signal = 1'b1;
  #6  signal = 1'b0;
  #6  signal = 1'b1;
  #6  signal = 1'b0;
  end

endmodule

// ---------------------------------

// ---------------------------
// -- exercicio2
// ---------------------------

module exercicio2 (signal, clock);

input clock;
output signal;
reg signal;

always @ (posedge clock)
 begin
      signal = 1'b1;
  #4  signal = 1'b0;
  #4  signal = 1'b1;
  #4  signal = 1'b0;
  #4  signal = 1'b1;
  #4  signal = 1'b0;

  end

endmodule

// ---------------------------------

// ---------------------------
// -- exercicio3
// ---------------------------

module exercicio3 (signal, clock);

input clock;
output signal;
reg signal;

always @ (posedge clock)
 begin
       signal = 1'b1;
  #72  signal = 1'b0;
   end

endmodule

// ---------------------------------

// ---------------------------
// -- exercicio4
// ---------------------------

module exercicio4 (signal, clock);

input clock;
output signal;
reg signal;

always @ (posedge clock)
 begin
       signal = 1'b1;
  #4  signal = 1'b0;
   end
	
always @ (negedge clock)
 begin
       signal = 1'b1;
  #4  signal = 1'b0;
   end

endmodule

// ---------------------------------

// ---------------------------
// -- exercicio5
// ---------------------------

module exercicio5 (signal, clock);

input clock;
output signal;
reg signal;

always @ (posedge clock)
 begin
       signal = 1'b1;
  #24  signal = 1'b0;
   end
	
endmodule

// ---------------------------------


// ---------------------------
// -- testes
// ---------------------------

module guia10;

 wire  clock;
 clock clk ( clock );

 wire  p1,p2,p3,p4, p5;

 exercicio1   pls1   ( p1, clock );
 exercicio2   pls2   ( p2, clock );
 exercicio3   pls3   ( p3, clock );
 exercicio4   pls4   ( p4, clock );
 exercicio5   pls5   ( p5, clock );

 initial begin
  $dumpfile ( "guia10.vcd" );
  $dumpvars ( 1, clock, p1, p2, p3, p4, p5 );

  #480
   $finish;
 end

endmodule // testclock01b

/*
AS CARTAS DE TEMPO FORAM ANALIZADAS

     ----jGRASP exec: gtkwave guia10.vcd
    
    WM Destroy
    
    GTKWave Analyzer v3.3.8 (w)1999-2010 BSI
    
    [0] start time.
    [480] end time.
    
     ----jGRASP: operation complete.

*/


