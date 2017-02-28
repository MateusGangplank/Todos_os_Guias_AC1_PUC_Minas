// ------------------------- 
// Guia10Exerc01
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453 
// ------------------------- 

module dff ( output q, output qnot, 
input d, input clk, input clear ); 
reg q, qnot; 

always @( posedge clk ) 
begin 
	if ( ~clear ) 
		begin 
		q <= 0; qnot <= ~q; 
	end 
	q <= d; qnot <= ~q;
end 
endmodule // dff 

module ram1x1 ( output w, input addr, input rw,
input clk, input inpu, input clear );
wire s1,s2,s3,s4;

and and1 (s1, addr, rw);
and and2 (s2, s1, clk);

dff kai (s3, s4, inpu, clk, clear);

and and3 (w, addr, s3);

endmodule

module ram1x4 ( output [3:0] we, input addr, input rw,
input clk, input [3:0] inpu, input clear );
wire s1,s2,s3,s4;

ram1x1 Rodrigo ( we[0], addr, rw, clk, inpu[0], clear);
ram1x1 Gustavo ( we[1], addr, rw, clk, inpu[1], clear);
ram1x1 Ana ( we[2], addr, rw, clk, inpu[2], clear);
ram1x1 Larissa ( we[3], addr, rw, clk, inpu[3], clear);

endmodule
 

module test; 
// ------------------------- definir dados 
wire [0:3] we; 
reg addr, rw, clk, clear;
reg [3:0] inpu;

ram1x4 ramiel (we,addr,rw,clk,inpu,clear);
// ------------------------- parte principal 
initial begin 
$display("Guia10Exerc01 - Pedro Henrique Vilar Locatelli - 427453"); 

   $monitor ( "%4d\t%1b\t%1b\t%1b\t%4b\t%1b\t%1b%1b%1b%1b", $time, addr, rw, clk, inpu, clear, we[0],we[1],we[2],we[3]); 
	#1 clear = 0;
	#1 clear = 1;
//	#1 clear = 0;
	#1 clk = 0;
	#1 inpu = 4'b0101;
	#1 addr = 1;
	#1 rw = 1;
	#1 clk = 1;
	#1 clk = 0;
	
	
	
	
end
endmodule