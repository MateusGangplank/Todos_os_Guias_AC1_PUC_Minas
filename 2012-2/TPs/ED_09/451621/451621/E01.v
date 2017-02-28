//Exercicio 01
//Nome: Vitor Angelo Lima
//Matricula: 451621

module clock ( clk );
  output clk;
  reg clk;
  initial begin
    clk = 1'b0;
  end
  
  always begin
    #12 clk = ~clk;
  end
endmodule // clock ( )

module jkff ( output q, output qnot, input j, input k, input clk );
    reg q, qnot;
    always @( posedge clk ) begin

        if ( j & ~k ) begin
          q <= 1; qnot <= 0;
        end

        else if ( ~j & k ) begin
          q <= 0; qnot <= 1;
        end

        else if ( j & k ) begin
            q <= ~q; qnot <= ~qnot;
        end
    end
endmodule // jkff

module teste;

wire clk;
wire a, b, c, d, e;
wire anot, bnot, cnot, dnot, enot;
wire x, y, w, z;
reg  j, k;
reg  pulse;

initial begin
  j = 1; k = 0;
  pulse = 1;
end

clock CLK1 (clk);
jkff JKFFe (e, enot, j, k, pulse );
jkff JKFFd (d, dnot, j, k, e );
jkff JKFFc (c, cnot, j, k, d );
jkff JKFFb (b, cnot, j, k, c );
jkff JKFFa (a, cnot, j, k, b );

initial begin
 // $monitor ( "%d %b %b %b %b", $time, clk, pulse, d, dnot );
  $monitor ( "%d %b %b %b %b %b", $time, a, b, c, d, e );

#12 pulse = 0; j=1; k=1;
#12 pulse = 1;
#12 pulse = 0;
#12 pulse = 1;
#12 pulse = 0;
#12 pulse = 1;
#12 pulse = 0;
#12 pulse = 1;
#12 pulse = 0;
#12 pulse = 1;
#12 pulse = 0;
#12 pulse = 1;
#12 pulse = 0;
#12 pulse = 1;
#12 pulse = 0;
#12 pulse = 1;
#12 pulse = 0;
#12 pulse = 1;
#12 pulse = 0;
#12 pulse = 1;
#12 pulse = 0;
#12 pulse = 1;
#12 pulse = 0;
#12 pulse = 1;
#12 pulse = 0;
#12 pulse = 1;
#12 pulse = 0;
#12 pulse = 1;
#12 pulse = 0;
#12 pulse = 1;
#12 pulse = 0; 
#12 $finish;
end

endmodule
