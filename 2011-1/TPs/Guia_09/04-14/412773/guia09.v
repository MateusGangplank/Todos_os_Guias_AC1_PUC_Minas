//---------------------------
//Nome: Silvino Henrique Santos de Souza
//Matrícula: 412773
//---------------------------


// ----------------------------
// -- clock
// ----------------------------

module clock ( clk );
 output clk;
 reg    clk;

 initial
  begin
   clk = 1'b0;
  end

 always
  begin
   #24 clk = ~clk;
  end
endmodule



// ----------------------------
// -- exercicio 1
// ----------------------------

module guia0901 (signal,clock);

 input  clock;
 output signal;
 reg    signal;

  initial
  begin
   signal = 1'b0;
  end

 always
  begin
   #12 signal = ~signal;
	
  end
endmodule



// ----------------------------
// -- exercicio 2
// ----------------------------

module guia0902 (signal,clock);

 input  clock;
 output signal;
 reg    signal;

  initial
  begin
   signal = 1'b0;
  end

 always
  begin
   #96 signal = ~signal;
	
  end
endmodule



// ----------------------------
// -- exercicio 3
// ----------------------------

module guia0903 (signal,clock);
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



// ----------------------------
// -- exercicio 4
// ----------------------------

module guia0904 ( signal,clock );
 input  clock;
 output signal;
 reg    signal;

  
 always @ ( negedge clock )
  begin
  		  signal = 1'b1;
    #96 signal = 1'b0;
  end
endmodule



// ----------------------------
// -- exercicio 5
// ----------------------------

module guia0905 ( signal,clock );
 input  clock;
 output signal;
 reg    signal;

  
 always @ ( posedge clock )
  begin
  	    signal = 1'b1;
    #6 signal = 1'b0;
  end
endmodule




// ----------------------------
// -- teste
// ----------------------------

module teste;

 wire  clock;
 clock clk1 ( clock );
 
 wire exercicio1, exercicio2, exercicio3, exercicio4, exercicio5;
 
 guia0901 GUIA0901 (exercicio1,clock);
 guia0902 GUIA0902 (exercicio2,clock);
 guia0903 GUIA0903 (exercicio3,clock);
 guia0904 GUIA0904 (exercicio4,clock);
 guia0905 GUIA0905 (exercicio5,clock);

 initial begin
  $dumpfile ( "guia09.vcd" );
  $dumpvars (1, clock, exercicio1, exercicio2, exercicio3, exercicio4, exercicio5);
  #480 $finish;
  
 end
endmodule 

