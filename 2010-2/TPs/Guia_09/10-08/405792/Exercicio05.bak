// --Pontificia Universidade Catolica de Minas Gerais
// -- Guia 09 - 05/10/2010
// -- Nome: Jonathan Felipe Xavier	Matricula: 415704

module clock ( clk );
 output clk;
 reg    clk;

 initial
  begin
   clk = 1'b1;
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
      signal = 1'b1;
  #12  signal = 1'b0;
  #12  signal = 1'b1;
  
  
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
  $dumpfile ( "Exercicio05.vcd" );
  $dumpvars(1, clock, pt);
  		s = 1'b0;
  #50 s = 1'b1; 
  #100 s = 1'b0;
  #150 s = 1'b1;
  #200 $finish;
 end
 endmodule