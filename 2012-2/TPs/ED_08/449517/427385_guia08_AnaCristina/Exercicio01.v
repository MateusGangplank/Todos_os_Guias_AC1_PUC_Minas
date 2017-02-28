// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exercicio01
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385

`include "flipflops.v"

module leftShiftRegister(data, clk);
	input data, clk;
	wire q1,q2,q3,q4,q5;
	wire qnot1,qnot2,qnot3,qnot4,qnot5;
	dff flip1(q1,qnot1,data,clk);
	dff flip2(q2,qnot2,q1,clk);
	dff flip3(q3,qnot3,q2,clk);
	dff flip4(q4,qnot4,q3,clk);
	dff flip5(q5,qnot5,q4,clk);
	
	always @(posedge clk)
		begin
			$display("%d %b %b %b %b %b", $time,q5,q4,q3,q2,q1);
		end
endmodule //leftShiftRegister

module principal;
	reg data;
	wire clk;
	
	clock clk1(clk);
	leftShiftRegister lsr(data,clk);
	   
		initial begin
		$display("Exercicio01 - Ana Cristina - 427385");
		$display("Left Shift Register");
		$display("\t\t   t a b c d e");
		data = 0;  
		#5  data = 1;
		#10 data= 0;
		#10 data = 1;
		#20 data = 0;
		#10 data = 1;
		#30 $finish;
	end
endmodule //principal