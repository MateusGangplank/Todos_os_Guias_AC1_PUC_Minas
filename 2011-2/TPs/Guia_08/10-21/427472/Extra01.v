//-------------------------------------------------------------
// Guia 08 - Extra01
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
// Registrador de Deslocamento para Direita
//-------------------------------------------------------------

   module RegDir ( output[4:0]s, output [4:0]ns, input[4:0]data , input clk);
	wire x1,x2,x3,x4,x5;
	
	or OR1 (x1,data[0],s[4]);
	or OR2 (x2,data[1],s[0]);
	or OR3 (x3,data[2],s[1]);
	or OR4 (x4,data[3],s[2]);
	or OR5 (x5,data[4],s[3]);


	dff DFF1(s[0],ns[0],x1,clk);
	dff DFF2(s[1],ns[1],x2,clk);
	dff DFF3(s[2],ns[2],x3,clk);
	dff DFF4(s[3],ns[3],x4,clk);
	dff DFF5(s[4],ns[4],x5,clk);

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
	  $display ("Data	Output");
#13 data=5'b00000;
#160 $finish;
	end

	always @(posedge clk)
		begin
	  $display ("%b		%b",data,s);
	end
 endmodule // Principal






















