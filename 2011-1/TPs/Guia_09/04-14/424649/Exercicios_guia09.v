//	Nome: Giselle Caroline Vieira
// Matrícula: 424649
// Guia 09



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



// Exercicio 01
module exercicio01(signal,clock);

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



// Exercicio 02
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



// Exercicio 03
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



// Exercicio 04
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



// Exercicio 05
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




// Teste
module teste;

 wire  clock;
 clock clk1 ( clock );
 
 wire saida1,saida2,saida3,saida4,saida5;
 
 exercicio01 EX01 (saida1,clock);
 exercicio02 EX02 (saida2,clock);
 exercicio03 EX03 (saida3,clock);
 exercicio04 EX04 (saida4,clock);
 exercicio05 EX05 (saida5,clock);

 initial begin
  $dumpvars (1,clock,saida1,saida2,saida3,saida4,saida5);
  #120 $finish;
  
 end
endmodule 

