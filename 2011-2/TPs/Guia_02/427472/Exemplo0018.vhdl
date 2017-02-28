// -------------------------
// Exemplo0018 - BASE 
// Nome: Wender Zacarias Xavier 
// Matricula: 427472 
// ------------------------- 
// ------------------------- 
// test complemento de 2
// ------------------------- 

//----------------------
//--Complemento de 2 gate
//----------------------

module c2gate (output [5:0]s, input [10:0]p);
 assign s = ~p+1;//criar vinculo permanente
        		   //(dependencia)
endmodule // c2gate

//----------------------
//--test c2gate
//----------------------
      module testc2gate;
// ------------------------- definir dados 
		reg [10:0]a; // definir registrador
		wire [5:0]s; // definir saida
// ------------------------- Instancia

		c2gate C2(s,a); // Porta de Complemento de 2

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0018 - Wender Zacarias Xavier - 427472"); 
		$display("Test Complemento de 2"); 
			a = 6'b100111;
			
		$display("\n Resultados \n"); 
#1		$display("a =  C2[100111(2)] = %b(2)", s);
      a =  6'o54;
#1		$display("b = C2[54(8)] = %b(2)", s);
		a = 4'd13;
#1		$display("c = C2[13(8)] = %b(2)", s);
		a = 5'h1B;
#1		$display("d = C2[1B(16)] = %b(2)", s); 
      a = 5'd25-6'd36+1;
#1		$display("e = C2[25(10)-36(10)] = %b(2)", s); 
 

		end 
	endmodule // testc2gate 