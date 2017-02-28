//-------------------------------------------------------------
// Guia 08 - Exercicio05
// Aluno: Wender Zacarias Xavier
// Matricula: 427472
//-------------------------------------------------------------

     `include "clock.v"

   module dff ( q, qnot, data, clk );
	output q;
	output qnot;
	input data;
	input clk;

	reg q, qnot;

	initial begin
	q = 1'b0;
	qnot = 1'b1;

	end
	
	always @ (posedge clk)
	   begin
	q <= data;	qnot <= ~q;
	end

    endmodule // dff

//-------------------------------------------------------------
// Conversor Paralelo-Serie
//-------------------------------------------------------------

   module convparalel( output[0:4]s, output ser, input[0:4]data , input clk);
	wire [0:4]ns;
	wire x1,x2,x3,x4;
	
	or OR1 (x1,data[1],s[0]);
	or OR2 (x2,data[2],s[1]);
	or OR3 (x3,data[3],s[2]);
	or OR4 (x4,data[4],s[3]);
	dff DFF1(s[0],ns[0],data[0], clk);
	dff DFF2(s[1],ns[1],x1,clk);
	dff DFF3(s[2],ns[2],x2,clk);
	dff DFF4(s[3],ns[3],x3,clk);
	dff DFF5(s[4],ns[4],x4,clk);
	assign ser = s[4];

   endmodule // RegDir

// ------------------------------------------------------------
// Principal
// ------------------------------------------------------------

     module test_RegDir;
   reg [0:4]data;
	wire [0:4]s;
	wire ser;
	wire clk;
	
	clock CLK1 (clk);
	convparalel Conversor(s,ser,data,clk);
	
	initial begin
	data = 5'b11101;
	end

	initial begin
	  $display ("Conversor Paralelo Série");
	  $display ("Aluno:Wender Zacarias Xavier	Matricula:427472");
	  $display ("Data		Output		State");
#13 data=5'b00000;
#170 $finish;
	end

	always @ (posedge clk)
		begin
	  $display ("%b		%b		%b",data,s,ser);
	end
 endmodule // Principal






















