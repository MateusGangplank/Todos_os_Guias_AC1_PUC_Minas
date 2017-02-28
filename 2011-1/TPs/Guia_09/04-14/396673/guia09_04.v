// ---------------------
// guia 09_04
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
// -- Exercicio 04
//--------------------------
 
module ex04 ( signal,clock );
 
input  clock;
output signal;
reg    signal;
  
always @ ( negedge clock )
  begin
  		  signal = 1'b1;
    #48 signal = 1'b0;
  end
endmodule
 
//fim module ex04

//--------------------------
// -- test ex04
//--------------------------
 
module testex04;

 wire  clock;
 clock clk1 ( clock );
 wire saida;
 
 ex04 EX04 (saida,clock);

 initial begin
  $display ( "Guia09_04 - Anderson Belchior de Carvalho - 396673" );
  $dumpfile ( "guia09_04.vcd" );
  $dumpvars (1,clock,saida);
  #120 $finish;
  
 end
endmodule 

//fim test ex04