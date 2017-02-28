// Breno Macena Pereira de Souza
// 462017

// ---------------
// -- Flip-Flop JK
// ---------------

module jkff (output q, output qnot, input k, input j, input clk, input clear);
   reg q = 0, qnot = 1;

   initial
   begin
   #5 if(clear)
      begin
        q <= 0;  qnot <= 1;
      end
   end
   always @ (posedge clk)
   begin
      if(j & ~k)
      begin
         q <= 1;  qnot <= 0;
      end
      else if (~j & k | clear)
      begin
         q <= 0;  qnot <= 1;
      end
      else if (j & k)
      begin
         q <= ~q;  qnot <= ~qnot;
      end
   end
endmodule
