// -------------------------
// Diversos
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

//--------------
//-- dff
//--------------
module dff ( output q, output qnot, input d, input clk );
	reg q, qnot;
	
	always @( posedge clk )
	begin
		q <= d; qnot <= ~d;
	end
endmodule // dff

//--------------
//-- tff
//--------------
module tff ( output q, output qnot,
				 input t, input clk,
				 input preset, input clear );

	reg q, qnot;


	always @( posedge clk )
	begin
		if ( ~clear )
		begin
			q <= 0; qnot <= 1;
		end
		else if ( ~preset )
		begin
			q <= 1; qnot <= 0;
		end
		else
		begin
		if ( t )
		begin
			q <= ~q; qnot <= ~qnot;
		end
	end
	end
endmodule // tff

//--------------
//-- srff
//--------------
module srff ( output q, output qnot,
				  input s, input r, input clk );

	reg q, qnot;

	always @( posedge clk )
	begin
		if ( s & ~r )
		begin
			q <= 1; qnot <= 0;
		end
		else if ( ~s & r )
		begin
			q <= 0; qnot <= 1;
		end
		else if ( s & r )
		begin
			q <= 0; qnot <= 0; // arbitrary
		end
	end
endmodule // srff

//--------------
//-- jkff
//--------------
module jkff ( output q, output qnot,
				  input j, input k, input clk );

	reg q, qnot;

	always @( posedge clk )
	begin
		if ( j & ~k )
		begin
			q <= 1; qnot <= 0;
		end
		else if ( ~j & k )
		begin
			q <= 0; qnot <= 1;
		end
		else if ( j & k )
		begin
			q <= ~q; qnot <= ~qnot;
		end
	end
endmodule // jkff

//--------------
//-- clock
//--------------
module clock ( clk );
	output clk;
	reg clk;
	initial begin
	   clk = 1'b0;
	end
	
	always begin
	   #5 clk = ~clk;
	end
endmodule // clock ( )

//--------------
//-- LeftSHR
//--------------
module leftShr (output [4:0]s, input d, input clk);
	wire qnot;

	dff DFF1 (s[0], qnot, d, clk);
	dff DFF2 (s[1], qnot, s[0], clk);
	dff DFF3 (s[2], qnot, s[1], clk);
	dff DFF4 (s[3], qnot, s[2], clk);
	dff DFF5 (s[4], qnot, s[3], clk);

endmodule//leftShr

//--------------
//-- LeftSHR
//--------------
module leftShr1 (output [4:0]s, input d, input clk);
	wire qnot;
	wire d1, d2, d3, d4;
	
	dff DFF1 (s[0], qnot, d, clk);

	or OR1 (d1, d, s[0]);
	dff DFF2 (s[1], qnot, d1, clk);

	or OR2 (d2, d, s[1]);
	dff DFF3 (s[2], qnot, d2, clk);

	or OR3 (d3, d, s[2]);
	dff DFF4 (s[3], qnot, d3, clk);
	
	or OR4 (d4, d, s[3]);
	dff DFF5 (s[4], qnot, d4, clk);
	
endmodule//leftShr1

//--------------
//-- RightSHR
//--------------
module rightShr (output [4:0]s, input d, input clk);
	wire qnot, x;
	
	or OR1(x, d, s[0]);
	
	dff DFF1 (s[4], qnot, x, clk);
	dff DFF2 (s[3], qnot, s[4], clk);
	dff DFF3 (s[2], qnot, s[3], clk);
	dff DFF4 (s[1], qnot, s[2], clk);
	dff DFF5 (s[0], qnot, s[1], clk);
	
endmodule//rightShr

//--------------
//-- LeftRotate
//--------------
module leftRotate (output [4:0]s, input d, input clk);
	wire qnot;	
	
	or OR1 (d0, d, s[4]);
	
	dff DFF1 (s[0], qnot, d0, clk);
	dff DFF2 (s[1], qnot, s[0], clk);
	dff DFF3 (s[2], qnot, s[1], clk);
	dff DFF4 (s[3], qnot, s[2], clk);
	dff DFF5 (s[4], qnot, s[3], clk);
	
endmodule // leftRotate

//--------------
//-- Parrallel
//--------------
module parallel (output [4:0]s, input [4:0]d, input load, input clk);
	wire qnot;	
	wire [4:0]i;
	wire [4:0]w;

	and AND1 (i[0], d[0], load);
	and AND2 (i[1], d[1], load);
	and AND3 (i[2], d[2], load);
	and AND4 (i[3], d[3], load);
	and AND5 (i[4], d[4], load);
	
	or OR1 (w[0], i[0], 1'b0);
	or OR2 (w[1], i[1], s[0]);
	or OR3 (w[2], i[2], s[1]);
	or OR4 (w[3], i[3], s[2]);
	or OR5 (w[4], i[4], s[3]);
	
	dff DFF1 (s[0], qnot, w[0], clk);
	dff DFF2 (s[1], qnot, w[1], clk);
	dff DFF3 (s[2], qnot, w[2], clk);
	dff DFF4 (s[3], qnot, w[3], clk);
	dff DFF5 (s[4], qnot, w[4], clk);
	
endmodule // parallel