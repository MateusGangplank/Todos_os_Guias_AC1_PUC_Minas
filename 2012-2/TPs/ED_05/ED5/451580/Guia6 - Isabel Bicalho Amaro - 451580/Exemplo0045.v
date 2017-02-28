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
	
    
	 module pulse1 ( signal );
    
       output signal;
       reg signal;
	
	 initial begin
	    signal = 1'b0;
	 end
	 
	 always begin
		 #24 signal = ~signal;
	 end

    endmodule // pulse
	 
	 
    module Exemplo0045;

       wire clock;
       clock clk ( clock );
       wire p1;
       pulse1 pls1 ( p1 );

    initial begin

       $dumpfile ( "Exemplo0045.vcd" );
       $dumpvars ( 0, clock, p1 );
       #480 $finish;
    end

    endmodule // Exemplo0045