// ------------------------- 
// Guia08Exerc01
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453 
// ------------------------- 

module dff ( output q, output qnot, 
input d, input clk ); 
reg q, qnot; 
always @( posedge clk ) 
begin 
q <= d; qnot <= ~q; 
end 
endmodule // dff 

module lsr ( output a, output b, output c, output d,
input data, input clk );
wire s1,s2,s3,s4,s5,s6,s7;

dff dff4 ( d, s1, data, clk );
dff dff3 ( c, s2, d, clk );
dff dff2 ( b, s3, c, clk );
dff dff1 ( a, s4, b, clk );

endmodule

module test; 
// ------------------------- definir dados 
wire w,x,y,z; 
reg data, clk;
lsr lsr1 (w,x,y,z,data,clk);
// ------------------------- parte principal 
initial begin 
$display("Guia08Exerc01 - Pedro Henrique Vilar Locatelli - 427453"); 
// initial values 
clk    = 0; 
data      = 1; 
#4  data = 1;
#4  data = 1;
#4  data = 1; 
#4  data = 0;
#30 $finish; 
 end // initial 
 
 always 
  #5 clk = ~clk; 
 
 always @( posedge clk ) 
  begin 
   $display ( "%4d\t%1b\t%1b\t%1b%1b%1b%1b", $time, clk, data, w, x, y, z); 
  end // always at positive edge clocking changing 
endmodule