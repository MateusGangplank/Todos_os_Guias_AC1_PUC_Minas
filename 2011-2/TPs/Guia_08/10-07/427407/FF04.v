// ------------------------- 
// FF04
// Nome: Guilherme Andrade Salum Terra 
// Matricula: 427407
// ------------------------- 

module dff ( output q, output qnot,
             input d, input clk );
reg q, qnot;

always @( posedge clk )
begin
 q <= d; 	qnot <= ~q;
end

endmodule // dff

module orGate (output s,
	       input a, input b);
reg s;

always @( a or b )
begin
  if ( a )
   begin
    s <= a;
   end
  else
   begin
    if ( b )
     begin
      s <= b;
     end
    else
     begin
      s <= 0;
     end
   end
end
endmodule // orGate

module test_FF04;

reg data;
reg clk;
wire a;
wire b;
wire c;
wire d;
wire e;
wire x;
wire s;
wire q;

orGate fox  (s, data, q);
dff domada  (a, x, s, clk );
dff bilara  (b, x, a, clk );
dff bonanza (c, x, b, clk );
dff luma    (d, x, c, clk );
dff gaia    (e, q, d, clk );

initial begin
	$display("FF04 - Guilherme Terra - 427407");
	$display("Test FF circular, anel torcido, para direita");

	data = 0; clk = 1;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	data = 1; clk = 2;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	data = 0; clk = 3;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	data = 0; clk = 4;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	data = 0; clk = 5;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	data = 0; clk = 6;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	data = 0; clk = 7;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	data = 0; clk = 8;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	data = 0; clk = 9;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	data = 0; clk = 10;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	data = 0; clk = 11;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	data = 0; clk = 12;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	data = 0; clk = 13;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	data = 0; clk = 14;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);

end 

endmodule // test_FF04

/*
Teste

x x x x x

x x x x x

1 x x x x

1 x x x x

0 1 x x x

0 1 x x x

0 0 1 x x

0 0 1 x x

0 0 0 1 x

0 0 0 1 x

0 0 0 0 1

0 0 0 0 1

0 0 0 0 0

0 0 0 0 0
*/