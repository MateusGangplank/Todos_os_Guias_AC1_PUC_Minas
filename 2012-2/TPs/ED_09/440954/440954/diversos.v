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

	always @( posedge clk or posedge preset or posedge clear)
	begin 
		if (clear ) 
		begin 
			q = 0; qnot = 1; 
		end 
		else if (preset) 
		begin 
			q = 1; qnot = 0; 
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
				  input j, input k, input clk,
				  input clear, input preset);

	reg q, qnot;

	always @( posedge clk or posedge preset or posedge clear )
	begin
		if(clear)
		begin
			q = 0;
			qnot = 1;
		end
		else if(preset)
		begin
			q = 1;
			qnot = 0;
		end
		else if ( j & ~k ) 
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
//-- Contador decrescente
//--------------
module contDec(output [4:0]s, input x, input pulse, input preset, input clear);

	wire [4:0]q;
	wire [4:0]qnot;
	
	jkff JKFF1 (q[4], qnot[4], x, x, pulse, clear, preset);
	jkff JKFF2 (q[3], qnot[3], x, x, qnot[4], clear, preset);
	jkff JKFF3 (q[2], qnot[2], x, x, qnot[3], clear, preset);
	jkff JKFF4 (q[1], qnot[1], x, x, qnot[2], clear, preset);
	jkff JKFF5 (q[0], qnot[0], x, x, qnot[1], clear, preset);
	
	assign s[0] = qnot[4];
	assign s[1] = qnot[3];
	assign s[2] = qnot[2];
	assign s[3] = qnot[1];
	assign s[4] = qnot[0];
	
endmodule // contDec

//--------------
//-- Contador Crescente
//--------------
module contCre(output [4:0]s, input x, input pulse, input preset, input clear);

	wire [4:0]q;
	wire [4:0]qnot;
	
	jkff JKFF1 (q[4], qnot[4], x, x, pulse, clear, preset);
	jkff JKFF2 (q[3], qnot[3], x, x, q[4], clear, preset);
	jkff JKFF3 (q[2], qnot[2], x, x, q[3], clear, preset);
	jkff JKFF4 (q[1], qnot[1], x, x, q[2], clear, preset);
	jkff JKFF5 (q[0], qnot[0], x, x, q[1], clear, preset);
	
	assign s[0] = qnot[4];
	assign s[1] = qnot[3];
	assign s[2] = qnot[2];
	assign s[3] = qnot[1];
	assign s[4] = qnot[0];
	
endmodule // contCre

//--------------
//-- Contador decádico crescente
//--------------
module contDeca(output [5:0]s, input x, input pulse, input preset, input clear);

	wire [5:0]q;
	wire [5:0]qnot;
	wire a,b;

	jkff JKFF1 (q[0], qnot[0], x, x, pulse, b, preset);	
	jkff JKFF2 (q[1], qnot[1], x, x, qnot[0], b, preset);
	jkff JKFF3 (q[2], qnot[2], x, x, qnot[1], b, preset);
	jkff JKFF4 (q[3], qnot[3], x, x, qnot[2], b, preset);
	jkff JKFF5 (q[4], qnot[4], x, x, qnot[3], b, preset);
	jkff JKFF6 (q[5], qnot[5], x, x, qnot[4], b, preset);
	
	nand NAND1 (a, ~q[0], q[1], ~q[2], q[3], ~q[4], ~q[5]);
	nand NAND2 (b, a, clear);
	
	assign s = q;
endmodule // contDeca

//--------------
//-- Contador decádico decrescente
//--------------
module contDecaDec(output [5:0]s, input x, input pulse, input clear);

	wire [5:0]q;
	wire [5:0]qnot;
	wire a, b;

	jkff JKFF1 (q[0], qnot[0], x, x, pulse, clear, b);	
	jkff JKFF2 (q[1], qnot[1], x, x, q[0], clear, b);
	jkff JKFF3 (q[2], qnot[2], x, x, q[1], clear, b);
	jkff JKFF4 (q[3], qnot[3], x, x, q[2], clear, b);
	jkff JKFF5 (q[4], qnot[4], x, x, q[3], clear, b);
	jkff JKFF6 (q[5], qnot[5], x, x, q[4], clear, b);
	
	and AND1 (a, ~qnot[0], qnot[1], ~qnot[2], qnot[3], ~qnot[4], ~qnot[5]);
	or OR1 (b, a, ~x);
	
	assign s = q;
	
endmodule // contDecaDec

//--------------
//-- Contador decádico flip flop T
//--------------
module contDecaT(output [3:0]s, input pulse, input clear);

	wire [3:0]q;
	wire [3:0]qnot;
	wire a, b;
	
	and AND1 (a, q[0], ~q[1], q[2], ~q[3]);
	or OR1(b, a, clear);

	tff TFF1	(q[3], qnot[3], pulse, pulse, 0, b);
	tff TFF2	(q[2], qnot[2], qnot[3], qnot[3], 0, b);
	tff TFF3	(q[1], qnot[1], qnot[2], qnot[2], 0, b);
	tff TFF4	(q[0], qnot[0], qnot[1], qnot[1], 0, b);

	assign s[0] = q[3];	
	assign s[1] = q[2];	
	assign s[2] = q[1];	
	assign s[3] = q[0];
	
endmodule // contDecaT