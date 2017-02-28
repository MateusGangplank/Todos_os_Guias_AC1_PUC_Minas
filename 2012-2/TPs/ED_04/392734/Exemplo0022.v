// ------------------------- 
// Exemplo0022 - FULL SUBTRACTOR 
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// ------------------------- 

// ------------------------- 
// half subtractor 
// ------------------------- 
module halfSub (output [1:0]s, input x, input y);
	wire b_out;
	wire sub;
	wire notX;
	
	not NOTX (notX, x);
	and bOut (b_out, notX, y);
	xor sub (sub, x, y);
	
	assign s[0] = sub;
	assign s[1] = b_out;
endmodule // halfSub

// ------------------------- 
// full subtractor 
// ------------------------- 
module fullSub (output [1:0]s, input a, input b, input borrowIn); 
	wire [1:0]sub1;
	wire [1:0]sub2;
	wire b_Out;
	
	halfSub HS1 (sub1, a, b);
	halfSub HSF2 (sub2, sub1[0], borrowIn );
	or C_OUT (b_Out, sub1[1], sub2[1]);
	
	assign s[1] = b_Out;
	assign s[0] = sub2[0];
endmodule // fullSub

// ------------------------- 
// Full Subtractor 3bits
// ------------------------- 
module fs4 (output [2:0]s, input [2:0]a, input [2:0]b);
	wire [1:0] saida1;
	wire [1:0] saida2;
	wire [1:0] saida3;
	
	halfSub HF (saida1, a[0], b[0]);	
	assign s[0] = saida1[0];
	
	fullSub FA1 (saida2, a[1], b[1], saida1[1]); 
	assign s[1] = saida2[0];
	
	fullSub FA2 (saida3, a[2], b[2], saida2[1]); 
	assign s[2] = saida3[0];

endmodule //exercicio

module test_fullSubtracto; 
// ------------------------- definir dados 
	reg [2:0] x; 
	reg [2:0] y;
	wire [2:0] sub; 
	fs4 SUB (sub, x, y);

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0022 - João Henrique Mendes de Oliveira - 392734"); 
		$display("Test ALU's full subtractor"); 
		
		// projetar testes do somador completo
		#1 x = 3'b011; y = 3'b101;
		$monitor("%3b - %3b = %3b", x, y, sub);
		#1 x = 3'b001; y = 3'b111;
		#1 x = 3'b111; y = 3'b011;

	end 
endmodule // test_fullSubtracto