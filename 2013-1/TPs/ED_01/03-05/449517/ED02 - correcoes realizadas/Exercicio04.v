// ------- Exercicio 04 - ED 02 ------------
// -- Ana Carolina Concei��o de Jesus ---
// -- Matricula : 449517 ----------------

// --------------------------------------
// -------- Exercicio 04 - ED 02 --------
// --------------------------------------

module exercicio03;

//------- dados

	reg [5:0]a;
	reg [5:0]b;
	reg [4:0]c;
	reg [3:0]d;
	reg [4:0]e;
	
initial begin: main

		$display("Exercicio 04 - ED 02 - Ana Carolina - 449517");
		$display("\nComplemento de 2");
		
		a = ~(6'b101111)+1;
		b = ~('d57)+1;
		c = ~('d25)+1;
		d = ~('hD)+1;
		e = ~('o24)+1;
		
		
		$display("resposta a = %5b",a[4:0]);
		$display("resposta b = %b",b[2:0]);
		$display("resposta c = %b",c[2:0]);
		$display("resposta d = %b",d[1:0]);
		$display("resposta e = %b",e[3:0]);



		
end 

endmodule