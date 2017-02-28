// ---------------------------
// -- Exercicio03------------
// ---------------------------

//
//--  Celso R Fran�a Jr
//--    PUC-MG

//----------------------------
//---------Clock--------------
//----------------------------
module clock ( clk );
 output clk;
 reg    clk;

 initial
  begin
   clk = 1'b0;
  end

 always
  begin
   # 1clk = ~clk;
  end
endmodule


//----------------------------
//---------PULSO--------------
//----------------------------
module pulse ( signal, clock );
 input  clock;
 output signal;
 reg    signal;

 always @ ( clock )
  begin
       signal = 1'b0;
  #4   signal = 1'b1;
  #4   signal = 1'b0;
    
  
  end
endmodule // pulse

//----------------------------
//---------Teste--------------
//----------------------------
module testpulse;

 wire  clock;
 clock clk ( clock );

 wire  p1;

 pulse   pulse1   ( p1, clock );

 initial begin
 
  $dumpfile ( "exercicio03.vcd" );
  $dumpvars (1, clock, p1);
   #480 $finish;

  end

endmodule // exercicio03