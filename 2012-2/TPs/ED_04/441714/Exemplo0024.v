// -------------------------
// Exemplo0024 - Diferente
// Nome: Yousef Otacilio
// Matricula: 441714
// -------------------------
// -------------------------
// Diferente
// -------------------------


module dif(output S, input [2:0]a, input [2:0]b);
	
	wire w1, w2, w3;

	xnor x1 (w1, a[0], b[0]);
	xnor x2 (w2, a[1], b[1]);
	xnor x3 (w3, a[2], b[2]);
	nand and2 (S, w1, w2, w3);
	
	
endmodule //dif

//------------------
module testdif;

reg [2:0] a;
reg [2:0] b;
wire s;

dif teste(s,a,b);
	

initial 	begin
	

	$display ("Exemplo0024 - Yousef -441714");
	$display ("Diferente");
	
	$monitor("a = %4b e Diferente á b = %4b ? 1- sim 0- não \n Resultado = %4b \n",a,b,s);

	
	#1 a = 6'b000;	b = 6'b000;
	#1	a = 6'b001;	b = 6'b000;
	#1	a = 6'b001;	b = 6'b001;
	#1	a = 6'b111;	b = 6'b111;
	#1	a = 6'b111;	b = 6'b000;
	#1	a = 6'b100;	b = 6'b100;
	#1	a = 6'b001;	b = 6'b100;
	#1	a = 6'b010;	b = 6'b100;
	
	end

endmodule //testdiferente
