//-------------------------------------------------------------
// Guia 08 - Exercicio04
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
// Registrador de Deslocamento para Direita com carga em Todos os Estagios
//-------------------------------------------------------------

   module RegDir ( output[4:0]s, output [4:0]ns, input data , input clk);
	wire z;
	or OR1(z,data,s[0]);
	dff DFF1(s[0], ns[0], s[1], clk);
	dff DFF2(s[1], ns[1], s[2], clk);
	dff DFF3(s[2], ns[2], s[3], clk);
	dff DFF4(s[3], ns[3], s[4], clk);
	dff DFF5(s[4], ns[4],  z  , clk);

   endmodule // RegDir

// ------------------------------------------------------------
// Principal
// ------------------------------------------------------------

     module RegDirTest;
    	
	reg data;
	wire [0:4]s;
	wire [0:4]ns;
	wire clk;
	
	clock CLK1 (clk);
	RegDir REG1(s,ns,data,clk);
	
	initial begin
	data = 1'b1;
	end

	initial begin
	  $display ("Registrador de Deslocamento para Esquerda com carga inicial em todos os estagios");
	  $display ("Aluno:Wender Zacarias Xavier	Matricula:427472");
	  $display ("Data	Output");
#13 data=1'b1;
#160 $finish;
	end

	always @ (posedge clk)
		begin
	  $display ("%b		%b",data,s);
	end
 endmodule // Principal






















