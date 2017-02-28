// ------- Exercicio 03 - ED ------------
// -- Ana Carolina Conceição de Jesus ---
// -- Matricula : 449517 ----------------

// --------------------------------------
// -------- Exercicio 03 - ED 02 --------
// --------------------------------------

module exercicio03;

//------- dados

	reg [5:0]a;
	reg [4:0]b;
	reg [4:0]c;
	reg [5:0]d;
	reg [2:0]e;
	
initial begin: main

		$display("Exercicio 03 - ED 02 - Ana Carolina - 449517");
		$display("\nComplemento de 2");
		
		a = ~(6'b101010)+1;
		b = ~('o25)+1;
		c = ~('d27)+1;
		d = ~('h2C)+1;
		e = ~(25 - 35)+1;
		
		// isso é espassamento de linha : %5b
		
		$display("resposta a = %b",a[4:0]);
		$display("resposta b = %b",b[3:0]);
		$display("resposta c = %b",c[2:0]);
		$display("resposta d = %b",d[4:0]);
		$display("resposta e = %b",e[1:0]);



		
end 

endmodule