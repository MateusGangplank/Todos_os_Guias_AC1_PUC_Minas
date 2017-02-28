// -- Arquitetura de Computadores I
// -- Guia 10
// -- Nome: Luhan Mairinck Reis 
// -- Matricula: 446987

`include "JKFF.v"

module MUX (output [7:0] d,input [7:0] x,input [7:0] x1,input [7:0] x2,
				input [7:0] x3,input [7:0] x4,input [7:0] x5,
				input [7:0] x6,input [7:0] x7,input [2:0] chave,input clk);

reg [7:0] d;
always @( posedge clk )
begin
if(chave)
begin
 if(chave[0] && chave[1] && chave[3])
 begin
 d = x7;
 end
 else
 begin
  if(chave[1] && chave[2])
  begin
  d = x6;
  end
  else
  begin
  	if(chave[2] && chave[0])
  	begin
	 d = x5;
	end
	else
	begin
	 if(chave[3])
	 begin
	 d = x4;
	 end
	 else
	 begin
	  if(chave[0] && chave[1])
	  begin
	  d = x3;
	  end
	  else
	  begin
	   if(chave[1])
		begin
		d = x2;
		end
		else
		begin
		 if(chave[0])
		 begin
		 d = x1;
		 end
		end
	  end
	 end
	end
  end
 end
end
else
begin
d = x;
end
end

endmodule //MUX

module DMX (output f1,output f2,output f3,output f4,output f5,
					output f6,output f7,output f8,input [2:0] chave,input x,
					input clk);

wire n1;
reg f1,f2,f3,f4,f5,f6,f7,f8;
always @( posedge clk )
begin
if(chave)
begin
 if(chave[0] && chave[1] && chave[3])
 begin
 f8 = 1; f7 = 0;f6 = 0;f5 = 0;f4 = 0;f3 = 0;f2 = 0;f1 = 0;
 end
 else
 begin
  if(chave[1] && chave[2])
  begin
   f8 = 0; f7 = 1;f6 = 0;f5 = 0;f4 = 0;f3 = 0;f2 = 0;f1 = 0;
  end
  else
  begin
  	if(chave[2] && chave[0])
  	begin
	 f8 = 0; f7 = 0;f6 = 1;f5 = 0;f4 = 0;f3 = 0;f2 = 0;f1 = 0;
	end
	else
	begin
	 if(chave[3])
	 begin
	 f8 = 0; f7 = 0;f6 = 0;f5 = 1;f4 = 0;f3 = 0;f2 = 0;f1 = 0;
	 end
	 else
	 begin
	  if(chave[0] && chave[1])
	  begin
	  f8 = 0; f7 = 0;f6 = 0;f5 = 0;f4 = 1;f3 = 0;f2 = 0;f1 = 0;
	  end
	  else
	  begin
	   if(chave[1])
		begin
		f8 = 0; f7 = 0;f6 = 0;f5 = 0;f4 = 0;f3 = 1;f2 = 0;f1 = 0;
		end
		else
		begin
		 if(chave[0])
		 begin
		 f8 = 0; f7 = 0;f6 = 0;f5 = 0;f4 = 0;f3 = 0;f2 = 1;f1 = 0;
		 end
		end
	  end
	 end
	end
  end
 end
end
else
begin
f8 = 0; f7 = 0;f6 = 0;f5 = 0;f4 = 0;f3 = 0;f2 = 0;f1 = 1;
end
end

endmodule //DMX
module RAM (output s, input address, input rw, 
               input clk, input x, input clr);
					
wire s, q, qnot, notX;

and AND1 (s, address, rw, clk);
not NOT1 (notX, x);
jkff jkff1 (q, qnot, x, notX, s, clr);
and AND2 (s, address, q);

endmodule // RAM

module RAM1x4 (output [3:0] s, input address, input rw, 
               input clk, input [3:0] x, input clr);

RAM R0 (s[0],address,rw,clk,x[0],clr);
RAM R1 (s[1],address,rw,clk,x[1],clr);
RAM R2 (s[2],address,rw,clk,x[2],clr);
RAM R3 (s[3],address,rw,clk,x[3],clr);

endmodule // RAM1x4


module RAM1x8 (output [7:0] s,input address, input rw, 
               input clk, input [7:0] x, input clr);

wire [7:0] s;

RAM1x4 R0 (s[7:4], address, rw, clk, x[7:4], clr);
RAM1x4 R1 (s[3:0], address, rw, clk, x[3:0], clr);

endmodule

module test_RAM1x8;

reg [7:0] x;
reg clk,clr,rw;
reg [2:0] address;
wire f1,f2,f3,f4,f5,f6,f7,f8;
wire [7:0] b1,b2,b3,b4,b5,b6,b7,b8;
wire [7:0] s;
reg [2:0] chave;

DMX DMX1 (f1,f2,f3,f4,f5,f6,f7,f8,address,1,clk);
RAM1x8 R0 (b1,f1,r,clk,x,clr);
RAM1x8 R1 (b2,f2,r,clk,x,clr);
RAM1x8 R2 (b3,f3,r,clk,x,clr);
RAM1x8 R3 (b4,f4,r,clk,x,clr);
RAM1x8 R4 (b5,f5,r,clk,x,clr);
RAM1x8 R5 (b6,f6,r,clk,x,clr);
RAM1x8 R6 (b7,f7,r,clk,x,clr);
RAM1x8 R7 (b8,f8,r,clk,x,clr);
MUX MUX1(s,b1,b2,b3,b4,b5,b6,b7,b8,chave,clk);

initial
begin 
$display ( " Time x s "); 
clk = 0; 
x = 00000000; rw = 1; clr = 1;
// input signal changing 
#3 x = 01000101; address = 001;clr = 0;
#3 address = 001; 
#3 address = 101;
#3 address = 001; 
#3 $finish; 
end // initial 
always 
#1 clk = ~clk; 
always @( posedge clk ) 
begin 
$display ( "%5d %8b %8b", $time, x ,s); 
end // always at positive edge clocking changing 
endmodule //module test