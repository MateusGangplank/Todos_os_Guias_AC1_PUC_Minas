// -------------------------
// Extra01 - BASE 
// Nome: Wender Zacarias Xavier 
// Matricula: 427472 
// ------------------------- 
// ------------------------- 
// test complemento de 1
// ------------------------- 

//----------------------
//--Complemento de 1 gate
//----------------------

module c1gate (output [7:0]s, input [7:0]p);
 assign s = ~p;//criar vinculo permanente
        		   //(dependencia)
endmodule // c1gate

//----------------------
//--test c1gate
//----------------------
      module testc1gate;
// ------------------------- definir dados 
		reg [7:0]a; // definir registrador
		wire [7:0]s; // definir saida
// ------------------------- Instancia

		c1gate C1(s,a); // Porta de Complemento de 1

// ------------------------- parte principal 
	initial begin 
		$display("Extra01 - Wender Zacarias Xavier - 427472"); 
		$display("Test Complemento de 1"); 
			a = 8'b10010101;
			
		$display("\n Resultados \n"); 
#1		$display("a =  C1[%b] = %b(2)",a, s);
      a = 8'b11111101;
#1		$display("b = C1[%b] = %b(2)",a, s);
		a = 8'b10100110;
#1		$display("c = C1[%b] = %b(2)",a, s);
		a = 8'b11100010;
#1		$display("d = C1[%b] = %b(2)",a, s); 
      a = 8'b01110101;
#1		$display("e = C1[%b] = %b(2)",a, s); 
 

		end 
	endmodule // testc1gate 