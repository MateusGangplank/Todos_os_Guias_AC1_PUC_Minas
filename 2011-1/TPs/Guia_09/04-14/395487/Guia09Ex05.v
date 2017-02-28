//---------------------------
//Nome: Alvaro Henrique
//Matrícula: 395487
//---------------------------

//--------------------------
// -- Guia09 Exercicio 05 --
//--------------------------


 //----------------------
 //-- Clock
 //----------------------
 
 
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


 
 //-------------------------
 //-- Teste do Ex5
 //-------------------------
 
 module teste;

 wire  clock;
 clock cck1 ( clock );
 wire saida;
 
 exercicio05 EX05 (saida,clock);

 initial begin
  $display("Guia 9 - Ex5 - Alvaro Henrique - 395487 \n");
  $dumpfile ( "Guia09Ex05.vcd" );
  $dumpvars (1,clock,saida);
  #120 $finish;
  
 end
 endmodule 
 
 //-----------------
 //-- Fim Guia 05 --
 //-----------------