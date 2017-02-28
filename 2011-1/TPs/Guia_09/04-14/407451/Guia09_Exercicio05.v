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
 
 
 module exercicio05 ( signal,clock );
 input  clock;
 output signal;
 reg    signal;

  
 always @ ( posedge clock )
  begin
  	    signal = 1'b1;
    #3 signal = 1'b0;
  end
endmodule


 //-- Teste
 module teste;

 wire  clock;
 clock cck1 ( clock );
 wire saida;
 
 exercicio05 EX05 (saida,clock);

 initial begin
  $display ( "Guia09 - Exercicio05 - Karen Alves - 407451" );
  $dumpfile ( "Guia09_Exercicio05.vcd" );
  $dumpvars (1,clock,saida);
  #120 $finish;
  
 end
 endmodule 
