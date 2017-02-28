// ---------------------
// guia 09_05
// Nome: Anderson Belchior de Carvalho
// Matricula: 396673
// ---------------------

//--------------------------
// -- Clock
//--------------------------

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
 
//fim module clock

//--------------------------
// -- Exercicio 05
//--------------------------
 
module ex05 ( signal,clock );
 
input  clock;
output signal;
reg    signal;

  
always @ ( posedge clock )
  begin
  	    signal = 1'b1;
    #3 signal = 1'b0;
  end
endmodule

//fim module ex05

//--------------------------
// -- test ex05
//--------------------------

 module testex05;

 wire  clock;
 clock cck1 ( clock );
 wire saida;
 
 ex05 EX05 (saida,clock);

 initial begin
  $display ( "Guia09_05 - Anderson Belchior de Carvalho - 396673" );
  $dumpfile ( "guia09_05.vcd" );
  $dumpvars (1,clock,saida);
  #120 $finish;
  
 end
 endmodule 
 
//fim test ex05
