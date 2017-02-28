// -------------------------
// FF05
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

module andGate (output s,
                input x, input y);
assign s = x & y;
endmodule // orGate

module test_FF05;

reg id;
reg g, h, i, j, k;
reg clk;
reg clear;
wire a;
wire b;
wire c;
wire d;
wire e;
wire t, y, u, p, o;

andGate danubio (t, id, g);
andGate fox     (y, id, h);
andGate grego   (u, id, i);
andGate quebeck (p, id, j);
andGate ebano   (o, id, k);

dff domada  (a, x, x, clk, t, clear );
dff bilara  (b, x, a, clk, y, clear );
dff bonanza (c, x, b, clk, u, clear );
dff luma    (d, x, c, clk, p, clear );
dff gaia    (e, x, d, clk, o, clear );

initial begin
	$display("FF05 - Guilherme Terra - 412753");
	$display("Test FF Paralel in / Serial out");

	id = 0; clk = 1; g = 0; h = 0; i = 0; j = 0; k = 0; clear = 1;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	id = 1; clk = 2; g = 1; h = 1; i = 0; j = 0; k = 0; clear = 0;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	id = 0; clk = 3; g = 0; h = 0; i = 0; j = 0; k = 0; clear = 0;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	id = 0; clk = 4; g = 0; h = 0; i = 0; j = 0; k = 0; clear = 0;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	id = 0; clk = 5; g = 0; h = 0; i = 0; j = 0; k = 0; clear = 0;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	id = 0; clk = 6; g = 0; h = 0; i = 0; j = 0; k = 0; clear = 0;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	id = 0; clk = 7; g = 0; h = 0; i = 0; j = 0; k = 0; clear = 0;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	id = 0; clk = 8; g = 0; h = 0; i = 0; j = 0; k = 0; clear = 0;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	id = 0; clk = 9; g = 0; h = 0; i = 0; j = 0; k = 0; clear = 0;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	id = 0; clk = 10; g = 0; h = 0; i = 0; j = 0; k = 0; clear = 0;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	id = 0; clk = 11; g = 0; h = 0; i = 0; j = 0; k = 0; clear = 0;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
 	id = 0; clk = 12; g = 0; h = 0; i = 0; j = 0; k = 0; clear = 0;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	id = 0; clk = 13; g = 0; h = 0; i = 0; j = 0; k = 0; clear = 0;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	id = 0; clk = 14; g = 0; h = 0; i = 0; j = 0; k = 0; clear = 0;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);
	id = 0; clk = 15; g = 0; h = 0; i = 0; j = 0; k = 0; clear = 0;
#1	$display("\n%b %b %b %b %b",a,b,c,d,e);


end

endmodule // test_FF05

/*
Testes

0 0 0 0 0

0 0 0 0 0

1 0 0 0 0

1 0 0 0 0

1 1 0 0 0

1 1 0 0 0

x 1 1 0 0

x 1 1 0 0

x x 1 1 0

x x 1 1 0

x x x 1 1

x x x 1 1

x x x x 1

x x x x 1

x x x x x
*/