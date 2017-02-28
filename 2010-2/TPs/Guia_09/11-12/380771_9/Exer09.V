//
// AC 1 - 2010
// TP 9
// Nome:Igor Rodrigues de Oliveira
// Matricula: 380771
//



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


module exe01(signal, clock);

 input  clock;
 output signal;
 reg    signal;

  initial
  begin
   signal = 1'b0;
  end

 always
  begin
   #24 signal = ~signal;
  end
  
endmodule



module exe02(signal, clock);

 input  clock;
 output signal;
 reg    signal;

  initial
  begin
   signal = 1'b0;
  end

 always
  begin
   #4 signal = ~signal;
  end
  
endmodule



module exe03 ( signal, clock );
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
   #4 signal = 1'b0;
  end
  
endmodule 



module exe04 ( signal, clock );
 input  clock;
 output signal;
 reg    signal;

  
 always @ ( negedge clock )
  begin
  		  signal = 1'b1;
    #60 signal = 1'b0;
  end
endmodule



module exe05 ( signal, clock );
 input  clock;
 output signal;
 reg    signal;

  
 always @ ( posedge clock )
  begin
  	    signal = 1'b1;
    #4 signal = 1'b0;
  end
endmodule



module teste;

 wire  clock;
 clock clk1 ( clock );
 
 wire s1, s2, s3, s4, s5;
 
 exe01 e01 (s1 , clock);
 exe02 e02 (s2 , clock);
 exe03 e03 (s3 , clock);
 exe04 e04 (s4 , clock);
 exe05 e05 (s5 , clock);

 initial begin
  $dumpfile ( "guia09.vcd" );
  $dumpvars (1, clock, s1, s2, s3, s4, s5);

  #120 $finish;
 end

endmodule 
