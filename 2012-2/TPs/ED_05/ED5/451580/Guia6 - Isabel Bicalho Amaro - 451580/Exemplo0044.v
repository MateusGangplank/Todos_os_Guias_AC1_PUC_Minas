// --------------------------
// Nome: Isabel Bicalho Amaro
// Matricula: 451580
// --------------------------

// --------------------------
// test clock generator(1)
// --------------------------

   module clock(clk);
	
	output clk;
	reg clk;
	
	initial begin
	   clk = 1'b0;
	end
	
	always begin
	   #12 clk = ~clk;
	end
	
	endmodule // clock( )
	
    
	 module pulse1 ( signal, clock );
    
	    input clock;
       output signal;
       reg signal;
	
	 always @ ( negedge clock ) begin
	       signal = 1'b0;
		 #4 signal = 1'b1;
		 #4 signal = 1'b0;
	 end
	 	 
    always @ ( posedge clock ) begin
          signal = 1'b1;
       #4 signal = 1'b0;
       #4 signal = 1'b1;
    end

    endmodule // pulse
	 
	 
    module Exemplo0044;

       wire clock;
       clock clk ( clock );
       wire p1;
       pulse1 pls1 ( p1, clock );

    initial begin

       $dumpfile ( "Exemplo0044.vcd" );
       $dumpvars ( 0, clock, p1 );
       #480 $finish;
    end

    endmodule // Exemplo0044