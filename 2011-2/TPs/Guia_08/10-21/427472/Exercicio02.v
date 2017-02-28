//-------------------------------------------------------------
// Guia 08 - Exercicio02
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
// Registrador de Deslocamento para Esquerda
//-------------------------------------------------------------

   module RegDir ( output[4:0]s, output [4:0]ns, input[4:0]data , input clk);
	wire x0,x1,x2,x3;
	
	or OR1 (x0, data[0], s[1]);
	or OR2 (x1, data[1], s[2]);
	or OR3 (x2, data[2], s[3]);
	or OR4 (x3, data[3], s[4]);

	dff DFF1(s[0], ns[0], x0, clk);
	dff DFF2(s[1], ns[1], x1, clk);
	dff DFF3(s[2], ns[2], x2, clk);
	dff DFF4(s[3], ns[3], x3, clk);
	dff DFF5(s[4], ns[4], data[4], clk);

   endmodule // RegDir

// ------------------------------------------------------------
// Principal
// ------------------------------------------------------------

     module test_RegDir;
   reg [0:4]data;
	wire [0:4]s;
	wire [0:4]ns;
	wire clk;
	
	clock CLK1 (clk);
	RegDir REG1(s,ns,data,clk);
	
	initial begin
	data = 5'b11001;
	end

	initial begin
	  $display ("Registrador de Deslocamento para Esquerda com carga inicial em todos os estagios");
	  $display ("Aluno:Wender Zacarias Xavier	Matricula:427472");
	  $display ("Data		Output");
#13 data=5'b00000;
#100 $finish;
	end

	always @ (posedge clk)
		begin
	  $display ("%b		%b",data,s);
	end
 endmodule // Principal






















