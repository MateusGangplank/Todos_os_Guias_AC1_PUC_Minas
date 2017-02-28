//---------------------------
//Nome: Alvaro Henrique
//Matrícula: 395487
//---------------------------

//--------------------------
// -- Guia09 Exercicio 03 --
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
 
 
 module exercicio03 (signal,clock);
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


 
 //-------------------------
 //-- Teste do Ex3
 //-------------------------
 
 module teste;

 wire  clock;
 clock cck1 ( clock );
 wire saida;
 
 exercicio03 EX03 (saida,clock);

 initial begin
  $display("Guia 9 - Ex3 - Alvaro Henrique - 395487 \n");
  $dumpfile ( "Guia09Ex03.vcd" );
  $dumpvars (1,clock,saida);
  #120 $finish;
  
 end
 endmodule 
 
 //-----------------
 //-- Fim Guia 03 --
 //-----------------