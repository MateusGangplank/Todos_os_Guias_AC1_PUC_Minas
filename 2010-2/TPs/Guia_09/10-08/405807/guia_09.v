//---------------------
//-- Guia_09
//-- Nome: Júnior
//-- Matricula: 405807
//---------------------

//Clock
module clock ( clk );
 output clk;
 reg    clk;

 initial
  begin
   clk = 1'b0;
  end

 always
  begin
   #30 clk = ~clk;
  end
endmodule


//Exercicio 01
module pulse1 ( signal, clock );
 input  clock;
 output signal;
 reg    signal;

 always @ ( clock )
  begin
      signal = 1'b0;
  #60  signal = 1'b1;
  #60  signal = 1'b0;
  #60  signal = 1'b1;
  end
endmodule

//Exercicio 02
module pulse2 ( signal, clock );
 input  clock;
 output signal;
 reg    signal;
 
 always @ ( clock )
  begin
       signal = 1'b0;
  #10  signal = 1'b1;
  #10  signal = 1'b0;
  end
endmodule

//Exercicio 03
module pulse3 ( signal, clock );
 input  clock;
 output signal;
 reg    signal;

 always @ ( posedge clock )
  begin
      signal = 1'b1;
	#4 signal = 1'b0;
  end
  
 always @ ( negedge clock )
  begin
  			signal = 1'b1;
    #4   signal = 1'b0;
  end
endmodule

//Exercicio 04
module pulse4 ( signal, clock );
 input  clock;
 output signal;
 reg    signal;

  
 always @ ( negedge clock )
  begin
  			signal = 1'b1;
    #150   signal = 1'b0;
  end
endmodule

//Exercicio 05
module pulse5 ( signal, clock );
 input  clock;
 output signal;
 reg    signal;

  
 always @ ( posedge clock )
  begin
  			signal = 1'b1;
    #10   signal = 1'b0;
  end
endmodule

//Módulo de testes
module testes;

 wire  clock;
 clock clk ( clock );
 wire  p1,//pulso do exercicio 01
 		 p2,//pulso do exercicio 02
		 p3,//pulso do exercicio 03
		 p4,//pulso do exercicio 04
		 p5;//pulso do exercicio 05

 pulse1 PULSE1 ( p1, clock );
 pulse2 PULSE2 ( p2, clock );
 pulse3 PULSE3 ( p3, clock );
 pulse4 PULSE4 ( p4, clock );
 pulse5 PULSE5 ( p5, clock );

 initial begin
  $dumpfile ( "guia09_test.vcd" );
  $dumpvars ( 1, clock, p1, p2, p3, p4, p5 );

  #360 $finish;
 end

endmodule