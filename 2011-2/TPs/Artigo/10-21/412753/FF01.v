// -------------------------
// FF01
// Nome: Luis Vasconcelos Dias 
// Matricula: 412753
// ------------------------- 

module dff ( output q, output qnot, 
             input d, input clk, 
             input preset, input clear );
reg q, qnot;

always @( posedge clk )
begin
 if ( clear == 1 )
  begin
   q <= 0; 	qnot <= 1;
  end
 else
  begin
 if ( preset == 1 )
  begin
   q <= 1; 	qnot <= 0;
  end
 else
  begin
   q <= d; 	qnot <= ~q;
  end
  end
end

endmodule // dff

module test_FF01;

reg data;
reg clk;
reg preset, clear;
wire a;
wire b;
wire c;
wire d;
wire e;
wire x;

dff domada  (a, x, b, clk, preset, clear );
dff bilara  (b, x, c, clk, preset, clear );
dff bonanza (c, x, d, clk, preset, clear );
dff luma    (d, x, e, clk, preset, clear );
dff gaia    (e, x, data, clk, 0, 0 );

initial begin
	$display("FF01 - Guilherme Terra - 412753");
	$display("Test FF (Left) Shift Register (D)");

	data = 1; clk = 1; preset = 0; clear = 1;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	data = 0; clk = 2; preset = 0; clear = 0;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	data = 1; clk = 3;
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

end

endmodule // test_FF01 

/*
Testes

0 0 0 0 1

0 0 0 0 1

0 0 0 1 1

0 0 0 1 1

0 0 1 1 0

0 0 1 1 0

0 1 1 0 0

0 1 1 0 0

1 1 0 0 0

1 1 0 0 0

1 0 0 0 0

*/