------------------------------------------------------------------------------------------
// Pontificia Universidade Catolica de Minas Gerais
//  
//  Nome:n�dia de souza Maciel Vieira Ferreira
------------------------------------------------------------------------------------------

module clock ( clk );
 output clk;
 reg    clk;

 initial
  begin
   clk = 1'b0;
  end

 always
  begin
   #2 clk = ~clk;
  end
endmodule

module pulse ( signal, clock );
 input  clock;
 output signal;
 reg    signal;

 always @ ( clock )
  begin
      signal = 1'b0;
  #20  signal = 1'b1;
  #20  signal = 1'b0;
  
  
  end
endmodule // pulse

module teste;

 wire  clock;
 clock clk ( clock );
 reg s;
 wire pt;
 pulse p1 (pt,clock);
 
 initial
 begin
 s = 1'b0;
 end
 
 initial begin
  $dumpfile ( "Exercici4.vcd" );
  $dumpvars(1, clock, pt);
  		s = 1'b0;
  #50 s = 1'b1; 
  #100 s = 1'b0;
  #150 s = 1'b1;
  #200 $finish;
 end
 endmodule