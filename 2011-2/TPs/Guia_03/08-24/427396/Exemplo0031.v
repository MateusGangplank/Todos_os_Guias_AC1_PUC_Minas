// -------------------------
// Exemplo0031 - F4
// Nome: Eduardo Manoel
// Matricula: 427396
// -------------------------
// -------------------------
//  f4_gate
// -------------------------
module f4 (output [7:0]s, input [3:0]p, input [3:0]q);
// Calculo do AND dos valores serão armazenados nas quatro primeiras posicoes do retorno [3:0]
	 assign s[3] = (p[3] & q[3]); 
	 assign s[2] = (p[2] & q[2]); 
	 assign s[1] = (p[1] & q[1]); 
	 assign s[0] = (p[0] & q[0]); 

// Calculo do OR dos valores serão armazenados nas quatro ultimas posicoes do retorno [7:4]
	 assign s[7] = (p[3] | q[3]); 
	 assign s[6] = (p[2] | q[2]); 
	 assign s[5] = (p[1] | q[1]); 
	 assign s[4] = (p[0] | q[0]); 

endmodule //f4

module test_f4;
// ------------------------- definir dados
   reg  [3:0] x;
	reg  [3:0] y;
	wire [7:0] z;
f4 modulo (z, x, y);
// ------------------------- parte principal
   initial begin
      $display("Exemplo0031 - Eduardo Manoel - 427396");
      $display("Test LU's module");
		#1 x = 4'b0011;	y = 4'b0101;
   // projetar testes do modulo
		$monitor("Resultado AND bit a bit: %3b & %3b = %4b \nResultado OR bit a bit: %3b | %3b = %4b \n",x,y,z[3:0],x,y,z[7:4]);
		#2 x = 4'b0000;	y = 4'b1111;
		#3 x = 4'b1010;	y = 4'b0101;
end
endmodule // test_f4