// -- Arquitetura de Computadores I
// -- Guia 10
// -- Nome: Luhan Mairinck Reis 
// -- Matricula: 446987

`include "JKFF.v"

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

module MUX (output [7:0] m, input [7:0] x, input [7:0] y, 
            input chave, input clk);

reg [7:0] m;
always @( posedge clk )
begin
 if(chave)
  begin
   m = y;
  end
 else
  begin
   m = x;
  end
end

endmodule // MUX

module DMX (output add1, output add2, input chave,
            input x, input clk);

reg add1, add2;
always @( posedge clk )
begin
 if(chave)
  begin
   add1 = 1; add2 = 0;
  end
 else
  begin
   add1 = 0; add2 = 1;
  end
end

endmodule //DMX

module RAM1x8 (output [7:0] s,input address, input rw, 
               input clk, input [7:0] x, input clr);

wire [7:0] s;

RAM1x4 R0 (s[7:4], address, rw, clk, x[7:4], clr);
RAM1x4 R1 (s[3:0], address, rw, clk, x[3:0], clr);

endmodule

module test_EX04;

reg [7:0] x;
reg clk,clr,rw,address;
wire [7:0] s;
wire [7:0] q,w;
wire d1,d2;

DMX DMX1 (d1,d2,address,1,clk);
RAM1x8 R1(w,d1,rw,clk,x,clr);
RAM1x8 R2(q,d2,rw,clk,x,clr);
MUX MUX1 (s,w,q,address,clk);

initial
begin 
$display ( " Time     x      s      address");
 
clk = 0; 

x = 0000; rw = 1; clr = 1;

// input signal changing 
#3 x = 11010001; address = 0;clr = 0;
#3 x = 11111000; address = 1;
#3 address = 0;rw = 0;
#3 address = 1; 
#3 $finish; 

end // initial 
always 
#1 clk = ~clk; 

always @( posedge clk ) 
begin 
$display ( "%2d %2b %4b %b", $time, x ,s,address); 
end // always at positive edge clocking changing 
endmodule //module test