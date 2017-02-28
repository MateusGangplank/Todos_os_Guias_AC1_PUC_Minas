// ------- Exercicio 05 - ED 02 ------------
// -- Ana Carolina Conceição de Jesus ---
// -- Matricula : 449517 ----------------

// --------------------------------------
// -------- Exercicio 05 - ED 02 --------
// --------------------------------------

module exercicio05;

reg[7:0]a;
reg[7:0]b;
reg[7:0]sa;


initial begin:main

		$display("Exercicio 05 - ED 02 - Ana Carolina - 449517");
		$display("\nExecutar operacoes");
		
		a = 6'b101011;
		b = (~4'b1001)+1;
		sa = a+b;
		
		$display("resposta a = %b",sa[5:0]);
		
		a = 5'b10011;
		b = (~'o15)+1;
		sa = a+b;
		
		$display("resposta b = %b",sa[2:0]);

		a = 'o35;
		b = (~'hC)+1;
		sa = a+b;
		
		$display("resposta c = %b",sa[4:0]);
		
		a = 'hBA;
		b = (~8'b10111001)+1;
		sa = a+b;
		
		$display("resposta d = %b",sa[0]);
		
		a = 'd37;
		b = (~'h1B)+1;
		sa = a+b;
		
		$display("resposta e = %b",sa[3:0]);
	
end

endmodule