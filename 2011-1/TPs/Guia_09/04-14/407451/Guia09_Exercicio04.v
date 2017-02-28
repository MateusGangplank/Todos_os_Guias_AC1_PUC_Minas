// Guia 09 - Capitulo 3
 // Nome: Karen Alves Pereira
 // Matricula: 407451
 // Data: 14/04/2011
 
 //-- Clock
 module clock ( cck );
 output cck;
 reg    cck;

  initial
   begin
    cck = 1'b0;
   end

  always
   begin
    #12 cck = ~cck;
   end 
 endmodule
 
 
 module exercicio04 ( signal,clock );
 input  clock;
 output signal;
 reg    signal;

  
 always @ ( negedge clock )
  begin
  		  signal = 1'b1;
    #48 signal = 1'b0;
  end
 endmodule

 //-- Teste
 module teste;

 wire  clock;
 clock cck1 ( clock );
 wire saida;
 
 exercicio04 EX04 (saida,clock);

 initial begin
  $display ( "Guia09 - Exercicio04 - Karen Alves - 407451" );
  $dumpfile ( "Guia09_Exercicio04.vcd" );
  $dumpvars (1,clock,saida);
  #120 $finish;
  
 end
 endmodule 
