// ------------------------- 
// Exemplo0022 - FULL SUBTRACTOR 
// Nome: Thaise Souto
// Matricula: 395504
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
// Exercicio0022 - Full Subtractor 6bits
// ------------------------- 
module fs6 (output [5:0]s, input [5:0]a, input [5:0]b);
	wire [1:0] saida1;
	wire [1:0] saida2;
	wire [1:0] saida3;
	wire [1:0] saida4;	
	wire [1:0] saida5;
	wire [1:0] saida6;
	
	halfSub HF (saida1, a[0], b[0]);	
	assign s[0] = saida1[0];
	
	fullSub FA1 (saida2, a[1], b[1], saida1[1]); 
	assign s[1] = saida2[0];
	
	fullSub FA2 (saida3, a[2], b[2], saida2[1]); 
	assign s[2] = saida3[0];
	
	fullSub FA3 (saida4, a[3], b[3], saida3[1]);
	assign s[3] = saida4[0];
	
	fullSub FA4 (saida5, a[4], b[4], saida4[1]);
	assign s[4] = saida5[0];
	
	fullSub FA5 (saida6, a[5], b[5], saida5[1]);
	assign s[5] = saida6[0];
		
endmodule //exercicio

module test_fullSubtracto; 
// ------------------------- definir dados 
	reg [5:0] x; 
	reg [5:0] y;
	wire [5:0] sub; 
	fs6 SUB (sub, x, y);

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0022 - Thaise Souto - 395504"); 
		$display("Test ALU's full subtractor"); 
		
		// projetar testes do somador completo
		#1 x = 6'b110101; y = 6'b001011;
		$monitor("%6b - %6b = %6b", x, y, sub);

	end 
endmodule // test_fullSubtracto