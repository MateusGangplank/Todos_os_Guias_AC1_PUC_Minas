// FAVOR COLOCAR NOME E MATRICULA

module dff ( output q, output qnot,
input   d, input clk, input clear, input preset ); 
reg q, qnot; 
 
always @( posedge clk ) 
if (clear) 
	begin
   	q <= 0; qnot <= ~q;
	end 
else if (preset) 
	begin
 		q <= 1; qnot <= ~q;
	end 
else 
	begin
    q <= d; qnot <= ~q;
	end
 
endmodule // dff 

module teste; 
 reg clk, clear, ld, dado[0:4]; 
 wire  q[0:4], qnot, preset[0:4]; 
 
 and and1(preset[0], ld, dado[4] );
 and and2(preset[1], ld, dado[3] );
 and and3(preset[2], ld, dado[2] );
 and and4(preset[3], ld, dado[1] );
 and and5(preset[4], ld, dado[0] );
 
 dff dff1 (  q[0],  qnot, 
      0,     clk, clear, preset[0] );
 dff dff2 (  q[1],  qnot, 
q[0],     clk, clear, preset[1] ); 
 dff dff3 (  q[2],  qnot, 
q[1],     clk, clear, preset[2] ); 
 dff dff4 (  q[3],  qnot, 
q[2],     clk, clear, preset[3] ); 
 dff dff5 (  q[4],  qnot, 
q[3],     clk, clear, preset[4] );  
 
 initial 
  begin 
   $display ( "Conversor Paralelo Série" ); 
	$display ( "time\tclock\tLD\tclear\tdado\tQ"); 
 
// initial values 
       clk    = 0;
		 clear  = 0; 
		 ld 	  = 0;
		 dado[4]= 1;
		 dado[3]= 0;
		 dado[2]= 1;
		 dado[1]= 0;
		 dado[0]= 0;
 
// input signal changing 
  #4  ld = 1;
  #4  ld = 0;
  #4  ld = 1; 
  #4  ld = 0;
  
  #30 $finish; 
 end // initial 
 
 always 
  #5 clk = ~clk; 
 
 always @( posedge clk ) 
  begin 
   $display ( "%4d\t%1b\t%1b\t%1b\t%1b%1b%1bt%1b%1b\t%1b%1b%1b%1b%1b", $time, clk, ld, clear, dado[0],dado[1],dado[2],dado[3],dado[4], q[0],q[1],q[2],q[3],q[4]); 
  end // always at positive edge clocking changing 
 
endmodule // Conversor Paralelo Serie