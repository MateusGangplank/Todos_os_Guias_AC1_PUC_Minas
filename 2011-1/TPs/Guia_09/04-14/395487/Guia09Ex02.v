//---------------------------
//Nome: Alvaro Henrique
//Matrícula: 395487
//---------------------------

//--------------------------
// -- Guia09 Exercicio 02 --
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


 module exercicio02(signal,clock);

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


 
 //-------------------------
 //-- Teste do Ex2
 //-------------------------
 
 module teste;

 wire  clock;
 clock cck1 ( clock );
 wire saida;
 
 exercicio02 EX02 (saida,clock);

 initial begin
  $display("Guia 9 - Ex2 - Alvaro Henrique - 395487 \n");
  $dumpfile ( "Guia09Ex02.vcd" );
  $dumpvars (1,clock,saida);
  #120 $finish;
  
 end
 endmodule 
 
 //-----------------
 //-- Fim Guia 02 --
 //-----------------