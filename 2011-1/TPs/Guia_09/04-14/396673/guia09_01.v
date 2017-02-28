// ---------------------
// guia 09_01
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
// -- Exercicio 01
//--------------------------

module ex01(signal,clock);
 
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
endmodule
 
//fim module ex01

//--------------------------
// -- test ex01
//--------------------------

 module testex01;

 wire  clock;
 clock clk1 ( clock );
 wire saida;
 
 ex01 EX01 (saida,clock);

 initial begin
  $display ( "Guia09_01 - Anderson Belchior de Carvalho - 396673" );
  $dumpfile ( "guia09_01.vcd" );
  $dumpvars (1,clock,saida);
  #120 $finish;
  
 end
 endmodule 
 
//fim test ex01