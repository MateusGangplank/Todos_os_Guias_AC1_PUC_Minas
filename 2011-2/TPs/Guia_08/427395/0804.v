//Guia08
//Autor: Eduardo Botelho
//Matricula: 427395

//flip flop tipo D
module dff (output q, output qnot,
            input d, input clk);
 reg q, qnot;
 
 always @(posedge clk)
 begin
  q<=d; qnot <= ~q;
 end

endmodule

/*flip flip tipo SR
module srff (output q, output qnot,
      input a, input r, input clk);
  reg q, qnot;

  always @(posedge clk)
   begin
    if (s & ~r)
     begin
      q <= 1; qnot <=0;
     end
    else
     if (~s & r)
      begin
       q <= 0; qnot <=1;
      end
     else
      if (s & r)
       begin
        q <= 0; qnot <= 0;
       end
     end
    end
endmodule
*/

module rotateleft5 (output a, output b, output c, output d, output e, input dat, input clk);

  wire s0,s1,s2,s3,s4,s5;

  or or1 (s0,a,dat);
  dff d5 (e,s1,s0,clk);
  dff d4 (d,s2,e, clk);
  dff d3 (c,s3,d, clk);
  dff d2 (b,s4,c, clk);
  dff d1 (a,s5,b, clk);

endmodule

module test;
 reg a,clk;
 wire w1,w2,w3,w4,w5;
  initial begin
    a=0;
    clk=0;
  end

  rotateleft5 rl1 (w1,w2,w3,w4,w5,a,clk);

  initial begin
   $display("Guia08 - Autor: Eduardo Botelho");
   $display("w1 w2 w3 w4 w5 a clk");
   $monitor("%b %b %b %b %b %b %b",w1,w2,w3,w4,w5,a,clk);
   #5 a=1; clk=1;
   #5 a=0; clk=0;

   #5 clk = ~clk;
   #5 clk = ~clk;
   #5 clk = ~clk;
   #5 clk = ~clk;
   #5 clk = ~clk;
   #5 clk = ~clk;
   #5 clk = ~clk;
   #5 clk = ~clk;
   #5 clk = ~clk;
   #5 clk = ~clk;
   #5 clk = ~clk;
   #5 clk = ~clk;


  end
endmodule

