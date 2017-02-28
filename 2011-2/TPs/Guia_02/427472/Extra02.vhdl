// -------------------------
// Extra02 - BASE 
// Nome: Wender Zacarias Xavier 
// Matricula: 427472 
// ------------------------- 
// ------------------------- 
// test complemento de 2
// ------------------------- 

//----------------------
//--Complemento de 2 gate
//----------------------

module c2gate (output [8:0]s, input [7:0]p);
 assign s = ~p+1;//criar vinculo permanente
        		   //(dependencia)
endmodule // c2gate

//----------------------
//--test c2gate
//----------------------
      module testc2gate;
// ------------------------- definir dados 
		reg [7:0]a; // definir registrador
		wire [8:0]s; // definir saida
// ------------------------- Instancia

		c2gate C2(s,a); // Porta de Complemento de 2

// ------------------------- parte principal 
	initial begin 
		$display("Extra02 - Wender Zacarias Xavier - 427472"); 
		$display("Test Complemento de 2"); 
			a = 8'b11110111;
			
		$display("\n Resultados \n"); 
#1		$display("a =  C2[%b(2)] = %b(2)",a, s);
      a =  8'b00100010;
#1		$display("b = C2[%b(2)] = %b(2)",a, s);
		a = 8'b11010000;
#1		$display("c = C2[%b(2)] = %b(2)",a, s);
		a = 8'b00110110;
#1		$display("d = C2[%b(2)] = %b(2)",a, s); 
      a = 8'b11001011;
#1		$display("e = C2[%b(2)] = %b(2)",a, s); 
 

		end 
	endmodule // testc2gate 