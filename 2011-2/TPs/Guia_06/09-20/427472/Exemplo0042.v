// -------------------------
// Guia 06 - Exemplo0042.v
// Nome: Wender Zacarias Xavier 
// Matricula: 427472 
// ------------------------- 

// --------------------------- 
// -- Clock generator 
// --------------------------- 

    module clock ( clk ); 
     output clk; 
     reg     clk; 

      initial 
       begin 
      clk = 1'b0; 
       end 

     always 
       begin 
 #12 clk = ~clk; 
        end 
       endmodule 
		 
// --------------------------- 
// -- Pulse generator 
// --------------------------- 

 module pulse ( signal, clock ); 
       input  clock; 
       output signal; 
       reg     signal; 

        always @ ( clock ) 
       begin 
         signal = 1'b1; 
#3  signal = 1'b0; 
#3  signal = 1'b1; 
#3  signal = 1'b0; 

    end 
endmodule // pulse 

// --------------------------- 
// -- Trigger generator 
// --------------------------- 

 module trigger ( signal, on, clock ); 
  input  on, clock; 
  output signal; 
  reg     signal; 

   always @ ( posedge clock & on ) 
   begin 
 #60 signal = 1'b1; 
 #60 signal = 1'b0; 
   end 
 
   endmodule // trigger 
	
// --------------------------- 
// -- Module Exemplo0042
// --------------------------- 

module Exemplo0042; 

     wire   clock; 
     clock clk ( clock ); 

     reg   p; 
     wire  p1,t1; 

    pulse   PS1    ( p1, clock ); 
    trigger TG1 ( t1, p, clock ); 

    initial begin 
    p = 1'b0; 
    end 

   initial begin 
	$display ("Exemplo0042.v - Wender Zacarias Xavier - 427472");
   $display ("Test Pulse and Trigger Generator"); 
   $dumpfile ( "Exemplo0042.vcd" ); 
   $dumpvars ( 1, clock, p1, p, t1 ); 

#060 p = 1'b1; 
#120 p = 1'b0; 
#180 p = 1'b1; 
#240 p = 1'b0; 
#300 p = 1'b1; 
#360 p = 1'b0; 
#376 $finish; 
    end 

 endmodule // Exemplo0042 