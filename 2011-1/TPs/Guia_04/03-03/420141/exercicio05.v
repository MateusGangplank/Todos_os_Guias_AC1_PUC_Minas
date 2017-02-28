// Guia 04
// Nome: Raphaela Fernanda Silva
// Matricula: 420141

module xorgate (s,a,b);
output s;
input a,b;
wire s1,s2,s3,s4;

nand NAND1 (s3,a,b);
nand NAND2 (s1,a,s3);
nand NAND3 (s2,b,s3);
nand NAND4 (s,s1,s2);

endmodule

module andgate (s,a,b);
output s;
input a,b;
wire s1;

nand NAND1 (s1,a,b);
nand NAND2 (s,s1,s1);

endmodule

module orgate (s,a,b);
output s;
input a,b;
wire s1,s2;

nand NAND1 (s1,a,a);
nand NAND2 (s2,b,b);
nand NAND3 (s,s1,s2);

endmodule

module notgate (s,a);
output s;
input a;

nand NAND1 (s,a,a);

endmodule


module operadorMD (s,s0,a,b);
output s,s0;
input a,b;
wire s1;

xorgate XOR1 (s,a,b);
notgate NOT1 (s1,a);
andgate AND1 (s,s1,b);

endmodule


module operadorDC (s,s0,a,b,v1);
output s,s0;
input a,b,v1;
wire s1,s2,s3;


operadorMD MD1 (s1,s2,a,b);
operadorMD MD2 (s,s3,s1,v1);
orgate OR1 (s,s2,s3);

endmodule

module testDC;
reg a,b,v1;
wire s,s0;

operadorDC DC (s,s0,a,b,v1);

initial begin: start
		a=0;  b=0; v1=0;
		
end


initial begin:main

		$display("Operador Diferenca Completa - Modelo Compacto ");
		#1 $display("a - b - v1 = s  s0");
		#1 $monitor("%b - %b - %b  = %d  %d", a,b,v1,s0,s);

		#1 a = 0; b = 0; v1=1;
		#1 a = 0; b = 1; v1=0;
		#1 a = 0; b = 1; v1=1;
		#1 a = 1; b = 0; v1=0;
		#1 a = 1; b = 0; v1=1;
		#1 a = 1; b = 1; v1=0;
		#1 a = 1; b = 1; v1=1;



end

endmodule
