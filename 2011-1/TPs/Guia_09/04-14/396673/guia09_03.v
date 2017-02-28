// ---------------------
// guia 09_03
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
// -- Exercicio 03
//--------------------------
 
 module ex03 (signal,clock);
 
 input  clock;
 output signal;
 reg    signal;


 always @ ( posedge clock )
  begin
      signal = 1'b1;
	#6 signal = 1'b0;
  end
  
 always @ ( negedge clock )
  begin
  		signal = 1'b1;
   #6 signal = 1'b0;
	
  end
endmodule

//fim module ex03

//--------------------------
// -- test ex03
//--------------------------

 module testex03;

 wire  clock;
 clock clk1 ( clock );
 wire saida;
 
 ex03 EX03 (saida,clock);

 initial begin
  $display ( "Guia09_03 - Anderson Belchior de Carvalho - 396673" );
  $dumpfile ( "guia09_03.vcd" );
  $dumpvars (1,clock,saida);
  #120 $finish;
  
 end
 endmodule 
 
//fim test ex03