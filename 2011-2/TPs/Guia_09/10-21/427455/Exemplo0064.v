// FAVOR COLOCAR NOME E MATRICULA AQUI

module jkff ( output q, output qnot,
 input    j, input    k, input clk, input clear );
reg q, qnot;
initial
begin
q = 1'b0;
qnot = ~q;
end

always @( posedge clk ) 
begin
     if ( clear )
     begin
     q <= 0;   qnot <= ~q;
     end
     else
    if ( j & ~k )
     begin
      q <= 1;   qnot <= 0; 
     end 
    else
      if ( ~j & k )
       begin 
        q <= 0;   qnot <= 1;
       end 
      else 
        if ( j & k ) 
         begin
          q <= ~q;   qnot <= ~qnot; 
         end
end 
 
endmodule // jkff


module Exemplo0063;
reg pulse;
reg clear;
reg preset;
wire[2:0] q;
wire[2:0] qnot;
nand NAND1 (y,clear,preset);
jkff t0(qnot[0],q[0],1,1,pulse,y);
jkff t1(qnot[1],q[1],1,1,qnot[0],y);
jkff t2(qnot[2],q[2],1,1,qnot[1],y);


  initial
  begin 
// initial values
    clear = 1;
    preset = 1;
    pulse = 0;


// input signal changing
    $monitor("%4b",q);


   #150 $finish;
 end // initial
 
 always
 	#4 pulse = ~pulse;

   
 
endmodule // Exemplo0051