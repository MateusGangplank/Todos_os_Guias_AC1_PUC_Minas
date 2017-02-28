// -------------------------
// Exercicio_extra02
// Nome: Rayan Darwin
// Matricula: 412770
// -------------------------
module test;
// ------------------------- definir dados
		reg [7:0] a;
// ------------------------- parte principal

	initial begin
		$display("Exercicio-extra01 - Rayan Darwin - 412770");
		a = 8'b10101010;
		a = ~a;
		a = a + 1;
		$display("\na = %b", a);

	end

endmodule // test