 // -------------------------
// Exemplo0027 -
// Nome: Thais Mairink 
// Matricula: 441710 
// -------------------------

module comparaDiferenca(output saida, input[2:0]a, input[2:0]b);

wire  s1,s2,s3;

xor(s1, a[0], b[0]);
xor(s2, a[1], b[1]);
xor(s3, a[2], b[2]);

or(saida, s1, s2, s3);

endmodule


module compara(output saida, input[2:0]a, input[2:0]b);

wire  s1,s2,s3;

xnor(s1, a[0], b[0]);
xnor(s2, a[1], b[1]);
xnor(s3, a[2], b[2]);

and(saida, s1, s2, s3);

endmodule

module principal(output [2:0] s,input[2:0] a,input[2:0] b,input chave);
         wire s7, s8;
	
    compara C1(s7,a,b);
    comparaDiferenca CD1(s8,a,b);
	
	assign s = chave? s8: s7;
endmodule

module test;
	// ------------------------- definir dados
	reg [2:0] x;
	reg [2:0] y;
	reg chave;
	reg carryIn;
	wire carryOut;
	wire [2:0] saida, s;
	
	principal P( saida,x, y,chave);
	// ------------------------- parte principal
	initial begin
		$display("Exemplo0026 - Thais Mairink - 441710");
		$display("");

		#1 x = 3'b000; y = 3'b000;  chave = 1;
		
		$monitor ("%b - %b = %b ",x,y,saida);
		#1 x = 3'b000; y = 3'b001;
		#1 x = 3'b001; y = 3'b000;
		#1 x = 3'b001; y = 3'b001;
		#1 x = 3'b001; y = 3'b011;
		#1 x = 3'b000; y = 3'b000;
		#1 x = 3'b011; y = 3'b110;
		#1 x = 3'b000; y = 3'b000;
		chave = 0;
		$monitor ("%b - %b = %b ",x,y,saida);
		#1 x = 3'b000; y = 3'b000;
		#1 x = 3'b000; y = 3'b001;
		#1 x = 3'b001; y = 3'b000;
		#1 x = 3'b001; y = 3'b001;
		#1 x = 3'b001; y = 3'b011;
		#1 x = 3'b000; y = 3'b000;
		#1 x = 3'b011; y = 3'b110;
		#1 x = 3'b000; y = 3'b000;
	end
endmodule
