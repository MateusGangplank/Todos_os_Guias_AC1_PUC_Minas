// ------------------------- 
// Exemplo0023 - Comparador de igualdade 
// Nome: Rafael Lopes Barbosa
// Matricula: 435052
// ------------------------- 
// ------------------------- 
// full adder 
// ------------------------- 
module Igualdade (output s,
							 input a, 
							 input b); 
// descrever por portas

xnor(s,a,b);

endmodule // equals 

module test_Iguadade;
// ------------------------- definir dados 
reg [5:0] x;
reg [5:0] y;
wire [5:0] s;
wire s2;
		Igualdade i1(s[0],x[0],y[0]);
		Igualdade i2(s[1],x[1],y[1]);
		Igualdade i3(s[2],x[2],y[2]);
		Igualdade i4(s[3],x[3],y[3]);
		Igualdade i5(s[4],x[4],y[4]);
		Igualdade i6(s[5],x[5],y[5]);
		
		and(s2,s[0],s[1],s[2],s[3],s[4],s[5]);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0023 - Rafael Lopes Barbosa - 435052"); 
$display("Test ALU's comparador de igualdade"); 
x = 6'b10101; y = 6'b10101;
#1 $display("(1) iguais   (0) diferentes");
#1 $display("%b == %b    (%b)",x,y,s2);

// projetar testes do somador complete 
end 
endmodule // test_fullAdder 