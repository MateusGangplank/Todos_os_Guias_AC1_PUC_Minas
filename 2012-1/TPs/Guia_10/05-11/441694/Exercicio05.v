 // ------------------------- 
// Exercicio05 
// Nome: Lucas Cardoso 
// Matricula: 441694 
// ------------------------- 
// ------------------------- 
// ------------------------- definir dados

module jkff ( output q, output qnot,input j, input k, input clk,input clear);
 
reg q, qnot; 
always @( posedge clk ) 
begin
if (clear)
begin 
q <= 0; qnot <= 1; 
end 
else 
if ( j & ~k ) 
begin 
q <= 1; qnot <= 0; 
end 
else 
if ( ~j & k ) 
begin 
q <= 0; qnot <= 1; 
end 
else 
if ( j & k ) 
begin 
q <= ~q; qnot <= ~qnot; 
end 
end 
endmodule // jkff

module mux (output [7:0] d,input [7:0] x,input [7:0] x1,input [7:0] x2,
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

endmodule //mux

module dmux (output f1,output f2,output f3,output f4,output f5,
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

endmodule //mux


module mem (output s,input addr,input r,input clk,input x,input clear);

wire a1,nx,q,qnot,s;

and AND1 (a1,addr,r,clk);
not NOT1 (nx,x);
jkff JKFF1 (q,qnot,x,nx,a1,clear);
and AND2 (s,addr,q);

endmodule //1x1 

module mem4 (output [3:0] s,input addr,input r, input clk,input [3:0] x,input clear);

//reg [3:0] x;
//reg clk,clear,r,addr;
wire [3:0] s;

mem mem1x1 (s[0],addr,r,clk,x[0],clear);
mem mem1x1a (s[1],addr,r,clk,x[1],clear);
mem mem1x1b (s[2],addr,r,clk,x[2],clear);
mem mem1x1c (s[3],addr,r,clk,x[3],clear);

endmodule//fim mem1x4

module mem1x8(output [7:0] s, input addr,input r,input clk,
					input [7:0]x,input clear);


wire [7:0] s;

mem4 mem1x4 (s[7:4],addr,r,clk,x[7:4],clear);
mem4 mem1x4a (s[3:0],addr,r,clk,x[3:0],clear);

endmodule //fim mem1x8

module test_Memoria;

reg [7:0] x;
reg clk,clear,r;
reg [2:0] addr;
wire f1,f2,f3,f4,f5,f6,f7,f8;
wire [7:0] b1,b2,b3,b4,b5,b6,b7,b8;
wire [7:0] s;
reg [2:0] chave;

dmux dmux1 (f1,f2,f3,f4,f5,f6,f7,f8,addr,1,clk);
mem1x8 mem1x8a (b1,f1,r,clk,x,clear);
mem1x8 mem1x8b (b2,f2,r,clk,x,clear);
mem1x8 mem1x8c (b3,f3,r,clk,x,clear);
mem1x8 mem1x8d (b4,f4,r,clk,x,clear);
mem1x8 mem1x8e (b5,f5,r,clk,x,clear);
mem1x8 mem1x8f (b6,f6,r,clk,x,clear);
mem1x8 mem1x8g (b7,f7,r,clk,x,clear);
mem1x8 mem1x8h (b8,f8,r,clk,x,clear);
mux mux1(s,b1,b2,b3,b4,b5,b6,b7,b8,chave,clk);

initial
begin 
$display ( " Time X s "); 
clk = 0; 
x = 00000000; r = 1; clear = 1;
// input signal changing 
#3 x = 01000101; addr = 001;clear = 0;
#3 addr = 001; 
#3 addr = 101;
#3 addr = 001; 
#3 $finish; 
end // initial 
always 
#1 clk = ~clk; 
always @( posedge clk ) 
begin 
$display ( "%5d %8b %8b", $time, x ,s); 
end // always at positive edge clocking changing 
endmodule //module test