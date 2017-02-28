module dff ( output q, output qnot,  
input   d, input clk ); 
reg q, qnot; 
 
always @( posedge clk ) 
begin 
    q <= d;          qnot <= ~q; 
end 
 
endmodule // dff 

module teste; 
 reg clk, d; 
 wire  q[0:4], qnot; 
 
 dff dff1 (  q[4],  qnot, 
      d,     clk );
 dff dff2 (  q[3],  qnot, 
q[4],     clk ); 
 dff dff3 (  q[2],  qnot, 
q[3],     clk ); 
 dff dff4 (  q[1],  qnot, 
q[2],     clk ); 
 dff dff5 (  q[0],  qnot, 
q[1],     clk );  
 
 initial 
  begin 
   $display ( "Deslocamento Esquerda" ); 
	$display ( "time\tclock\tdado\tQ"); 
 
// initial values 
       clk    = 0; 
       d      = 1; 
 
// input signal changing 
  #4  d = 1;
  #4  d = 1;
  #4  d = 1; 
  #4  d = 0;
  
  #30 $finish; 
 end // initial 
 
 always 
  #5 clk = ~clk; 
 
 always @( posedge clk ) 
  begin 
   $display ( "%4d\t%1b\t%1b\t%1b%1b%1b%1b%1b", $time, clk, d, q[0],q[1],q[2],q[3],q[4]); 
  end // always at positive edge clocking changing 
 
endmodule // DeslocamentoEsquerda