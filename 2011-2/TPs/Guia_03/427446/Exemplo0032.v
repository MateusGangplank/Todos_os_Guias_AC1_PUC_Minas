//-------------------------------------
//Exemplo0032 - operação selecionável
//Nome: Mateus Guilherme do Carmo Cruz
//Matrícula: 427446
//-------------------------------------


module f4selectable (output [3:0] s0, output [3:0] s1, input [3:0]a, input [3:0]b);
	assign s0 = a | b;
	assign s1 = a & b;
endmodule //f4 selectable

module chave(s,a,b,sinal);
	input [3:0]a;
	input [3:0]b;
	input sinal;
	output [3:0]s;
	reg [3:0]s;
	
	always @(a or b or sinal)
	
	begin
		if(~sinal)
			s = a;
		else
			s = b;
	end
endmodule

module test_f4selectable;
	//definir dados
	reg [3:0] a;
	reg [3:0] b;
	reg chave;
	wire [3:0] w0;
	wire [3:0] w1;
	wire [3:0] s;
	
	//instancia
	f4selectable f4s1(w0,w1,a,b);
	chave chave1(s,w0,w1, chave);
	
	//valor inicial
	initial begin
		a = 4'b0000;
		b = 4'b0000;
		chave = 0;
	end
	
	//parte principal
	initial begin
		$display("Exemplo0032 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("LU selectable - running tests");
		$display("chave	\t a   (| ou &)   b = s");
		$monitor("%b	\t %4b or/and %4b = %4b", chave,a,b,s);
		#1 chave = 1;
		#1 a = 4'b0000; b = 4'b0001; chave = 0;
		#1 chave = 1;
		
		#1 chave = 1;
		#1 a = 4'b1001; b = 4'b0010; chave = 0;
		#1 chave = 1;
		
		#1 chave = 1;
		#1 a = 4'b0101; b = 4'b0011; chave = 0;
		#1 chave = 1;
		
		#1 chave = 1;
		#1 a = 4'b1101; b = 4'b0100; chave = 0;
		#1 chave = 1;
		
		#1 chave = 1;
		#1 a = 4'b0011; b = 4'b0101; chave = 0;
		#1 chave = 1;
		
		#1 chave = 1;
		#1 a = 4'b1100; b = 4'b0110; chave = 0;
		#1 chave = 1;
		
		#1 chave = 1;
		#1 a = 4'b1111; b = 4'b0111; chave = 0;
		#1 chave = 1;
	end
	
endmodule //teste_f4selectable