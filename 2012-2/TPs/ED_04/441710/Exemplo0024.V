// ------------------------- 
// Exemplo0024 -  Compara Diferenca
// Nome: Thais Mairink 
// Matricula: 441710 
// ------------------------- 

//---------------------
//--Comparador para diferenca
//-------------------------

module comparaDiferenca(output saida, input[2:0]a, input[2:0]b);

wire  s1,s2,s3;

xor(s1, a[0], b[0]);
xor(s2, a[1], b[1]);
xor(s3, a[2], b[2]);

or(saida, s1, s2, s3);

endmodule

module test_compara;

//----definir dados
reg[2:0]x;
reg [2:0]y;
wire saida ;

comparaDiferenca CD(saida, x, y);

// ------------------------- parte principal
	initial begin
		$display("Exemplo0024 - Thais Mairink - 441710");
		$display("Compara Diferenca");
		
		#1 x = 3'b000; y = 3'b000; 
		
		$monitor ("%b + %b = %b",x , y, saida);
		#1 x = 3'b000; y = 3'b001;
		#1 x = 3'b001; y = 3'b000;
		#1 x = 3'b001; y = 3'b001;
		#1 x = 3'b001; y = 3'b011;
		#1 x = 3'b000; y = 3'b000;
		#1 x = 3'b011; y = 3'b110;
		#1 x = 3'b000; y = 3'b000;
		#1 x = 3'b000; y = 3'b000; 
	end
		
	endmodule
