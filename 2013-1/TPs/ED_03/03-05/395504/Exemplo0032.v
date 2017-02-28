//-------------------------------------
//Exemplo0032 - operação selecionável
//Nome: Thaise Souto Martins
//Matrícula: 395504
//-------------------------------------


module f4selectable (output [1:0] s0, output [1:0] s1, input [1:0]a, input [1:0]b);
	or or1(s0[0],a[0],b[0]);
	or or2(s0[1],a[1],b[1]);
	and and1(s1[0],a[0],b[0]);
	and and2(s1[1],a[1],b[1]);
endmodule //f4 selectable

module chave(s,a,b,sinal);
	input [1:0]a;
	input [1:0]b;
	input sinal;
	output [1:0]s;
	reg [1:0]s;
	
	always @(a or b or sinal)
	
	begin
		if(~sinal)
			s = a;
		else
			s = b;
	end
endmodule

module test_f4selectable;
	reg [1:0] a;
	reg [1:0] b;
	reg chave;
	wire [1:0] w0;
	wire [1:0] w1;
	wire [1:0] s;
	
	f4selectable f4s1(w0,w1,a,b);
	chave chave1(s,w0,w1, chave);
	
	initial begin
		a = 2'b00;
		b = 2'b00;
		chave = 0;
	end

	initial begin
		$display("Exemplo0032 - Thaise Souto Martins - 395504");
		$display("LU selectable - running tests -(0):or,(1):and");
		$display("\nchave\t a   (| ou &)   b = s");
		$monitor("%b\t %4b or/and %4b = %4b",chave,a,b,s);
		#1 chave = 1;
		#1 a = 2'b00; b = 2'b01; chave = 0;
		
		#1 chave = 1;
		#1 b = 2'b10; chave = 0;
		
		#1 chave = 1;
		#1 b = 2'b11; chave = 0;
		#1 chave = 1;
		
		#1 a = 2'b01; b = 2'b00; chave = 0;
		#1 chave = 1;
		
		#1 b = 2'b01; chave = 0;
		#1 chave = 1;
		
		#1 b = 2'b10; chave = 0;
		#1 chave = 1;
		
		#1 b = 2'b11; chave = 0;
		#1 chave = 1;
		
		#1 a = 2'b10; b = 2'b00; chave = 0;
		#1 chave = 1;
		
		#1 b = 2'b01; chave = 0;
		#1 chave = 1;
		
		#1 b = 2'b10; chave = 0;
		#1 chave = 1;
		
		#1 b = 2'b11; chave = 0;
		#1 chave = 1;
		
		#1 a = 2'b11; b = 2'b00; chave = 0;
		#1 chave = 1;
		
		#1 b = 2'b01; chave = 0;
		#1 chave = 1;
		
		#1 b = 2'b10; chave = 0;
		#1 chave = 1;
		
		#1 b = 2'b11; chave = 0;
		#1 chave = 1;
	end
	
endmodule //teste_f4selectable