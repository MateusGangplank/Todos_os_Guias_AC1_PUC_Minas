// -------------------------
// Ex0007
// Nome: Bernardo Augusto Godinho de Oliveira
// Matricula: 458576
// -------------------------

module gate (p, s);
         input  [7:0] p;
			output [7:0] s;


assign s = (~p) + 1;
endmodule // gate

module test_base_01;
      reg [7:0] a;
		wire [7:0] s;
		gate XOR1 (a, s);
		
		initial begin:start
		a=8'b11111111;   // 4 valores binarios
		
		
   	end
		
		initial begin:main
		
		         $monitor("%b = %b", a, s);
		  #1     a=8'b00100100; // valores binarios
		end
endmodule 	