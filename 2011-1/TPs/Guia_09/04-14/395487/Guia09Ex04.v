//---------------------------
//Nome: Alvaro Henrique
//Matrícula: 395487
//---------------------------

//--------------------------
// -- Guia09 Exercicio 04 --
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
 
 //-------------------------
 //-- Teste do Ex4
 //-------------------------
 
 module teste;

 wire  clock;
 clock cck1 ( clock );
 wire saida;
 
 exercicio04 EX04 (saida,clock);

 initial begin
  $display("Guia 9 - Ex4 - Alvaro Henrique - 395487 \n");
  $dumpfile ( "Guia09Ex04.vcd" );
  $dumpvars (1,clock,saida);
  #120 $finish;
  
 end
 endmodule 
 
 //-----------------
 //-- Fim Guia 04 --
 //-----------------
