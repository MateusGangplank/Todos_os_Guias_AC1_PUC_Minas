// -------------------------
// Exercicio_extra01
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
		$display("\na = %b", a);

	end

endmodule // test