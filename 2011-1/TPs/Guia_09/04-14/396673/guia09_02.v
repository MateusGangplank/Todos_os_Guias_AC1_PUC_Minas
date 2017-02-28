// ---------------------
// guia 09_02
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
// -- Exercicio 02
//--------------------------

module ex02(signal,clock);

 input  clock;
 output signal;
 reg    signal;

   initial
    begin
     signal = 1'b0;
    end

   always
    begin
     #48 signal = ~signal;
	
   end
endmodule

//fim module ex02

//--------------------------
// -- test ex02
//--------------------------

module testex02;

 wire  clock;
 clock clk1 ( clock );
 wire saida;
 
 ex02 EX02 (saida,clock);

 initial begin
  $display ( "Guia09_02 - Anderson Belchior de Carvalho - 396673" );
  $dumpfile ( "guia09_02.vcd" );
  $dumpvars (1,clock,saida);
  #120 $finish;
  
 end
endmodule 
 
//fim test ex02