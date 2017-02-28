// -----------------------------------------------------------------------------------------
// Guia 05-02 - Subtrator de 2 bits
// Nome: Jessica Luisa Betonico Andrade
// Matricula: 412748
// ------------------------------------------------------------------------------------------

module notGate(s, x);

	output s;
	input x;

nand NAND1(s, x, x);

endmodule

module andGate(s, x, y);

	output s0,s;
	input x,y;
	wire s,s0;

	nand NAND1(s, x, y);
	notGate NOT1_NAND1(s0, s);

endmodule

module orGate(s0, x, y);

	output s0,sX,sY;
	input x, y;
	wire s0, sX, sY;

	notGate NOT1(sX, x);
	notGate NOT2(sY, y);
	nand NAND1(s0, sX, sY);

endmodule

module saida0(s, x, y);

	output s, s1, s2, s3, s4;
	input x,y;
	wire s, s1;

	notGate NOT1(s1, x);
	nand NAND1(s2, s1, y);
	notGate NOT2(s3, y);
	nand NAND2(s4, s3, x);
	nand NAND3(s, s2, s4);

endmodule

module saida1(s, x, y);

	output s1,s2,s;
	input x, y;
	wire s;

	notGate NOT1(s1, x);
	nand NAND1(s2, s1, y);
	notGate NOT2(s, s2);

endmodule

module meiaDiferenca1(s0, s1, x, y);

	input x,y;
	output s0, s1;
	wire s0,s1;

	saida0 S0(s0, x, y);
	saida1 S1(s1, x, y);

endmodule

module diferencaCompleta(s3, s5, x, y, z);

	input x, y, z;
	output s1, s0, s3, s4, s5;
	wire s1, s0;

	meiaDiferenca1 MEIASOMA1(s0, s1, x, y);
	meiaDiferenca1 MEIASOMA2(s3, s4, s0, z);
	or OR1(s5, s1, s4);
	
endmodule

module diferenca_2bits (s0, s1, s2, a0, a1, b0, b1);

	input a0, a1, b0, b1;
	output s0, s1, s2, saida0, saida1;

	wire saida0, saida1;

	diferencaCompleta DIFERENCACOMPLETA1(s0, saida0, a0, b0, 0);
	diferencaCompleta DIFERENCACOMPLETA2(s1, s2, a1, b1, saida0);

endmodule


module teste;

	reg a0, a1, b0, b1;
	output s0, s1;

	diferenca_2bits DIFERENCACOMPLETA(s0, s1, s2, a0, a1, b0, b1);

initial begin:start
	a0=0; a1=0; b0=0; b1=0;
end

initial begin: main

 		$display("Guia 05_02 -Jessica Luisa Betonico Andrade - 412748 ");
      $display("Subtractor de 2 bits");
		$display("A  -  B  = S");
		$monitor("%b%b - %b%b= %b%b%b", a1, a0, b1, b0, s2, s1, s0);

	#1 a1=0; a0=1; b1=0; b0=0;
	#1 a1=1; a0=0; b1=0; b0=0;
	#1 a1=1; a0=1; b1=0; b0=0;

	#1 a1=0; a0=0; b1=0; b0=1;
	#1 a1=0; a0=1; b1=0; b0=1;
	#1 a1=1; a0=0; b1=0; b0=1;
	#1 a1=1; a0=1; b1=0; b0=1;

	#1 a1=0; a0=0; b1=1; b0=0;
	#1 a1=0; a0=1; b1=1; b0=0;
	#1 a1=1; a0=0; b1=1; b0=0;
	#1 a1=1; a0=1; b1=1; b0=0;

	#1 a1=0; a0=0; b1=1; b0=1;
	#1 a1=0; a0=1; b1=1; b0=1;
	#1 a1=1; a0=0; b1=1; b0=1;
	#1 a1=1; a0=1; b1=1; b0=1;


end
endmodule

