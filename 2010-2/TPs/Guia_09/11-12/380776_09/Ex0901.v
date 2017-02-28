// ---------------------
// Exemplo 09_01 
// Nome: J�lio C�zar Taveira Ara�jo
// Matricula: 380776
// ---------------------

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
   #6 clk = ~clk;
  end
  
endmodule

//----------------------------
//---------Pulso--------------
//----------------------------

module pulse ( signal, clock );

 input  clock;
 output signal;
 reg    signal;

 always @ ( clock )
  begin
        signal = 1'b0;
  #12   signal = 1'b1;
  #12   signal = 1'b0;
    
  
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
 
  $dumpfile ( "Ex0901.vcd" );
  $dumpvars (1, clock, p1);
   #480 $finish;
	

 end

endmodule //Ex0901