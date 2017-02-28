// -------------------------
// Exemplo0022 - FULL SUBTRACTOR 
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453 
// ------------------------- 
// ------------------------- 
		module halfAdder (output s0, 
									  output s1,
				                 input w,  
				                 input x); 
		
		xor (s0, w, x);          // VER MODIFICACOES NO EXERCICIO ANTERIOR
		and (s1, w, x);
		 
		endmodule // halfAdder 
		
		module fullAdder (output s0, 
								output s1,
		                  input w,  
		                  input x,  
		                  input ci);
			wire sxor,sand1,sand2;				
						 
			halfAdder ha1(sxor,sand1,w,x);
			halfAdder ha2(s0,sand2,ci,sxor);
			or (s1, sand1, sand2);

		endmodule // fullAdder 
		
		module fullSubtractor6bit (output [4:0] s0, 
									      output s1,
				                     input [4:0] w,  
				                     input [4:0] x,  
				                     input ci);
									  
			wire pass1;				
						 
			fullAdder fa1(s0[0], pass1, w[0], ~x[0], ci);
			fullAdder fa2(s0[1], pass2, w[1], ~x[1], pass1);
			fullAdder fa3(s0[2], pass3, w[2], ~x[2], pass2);
			fullAdder fa4(s0[3], pass4, w[3], ~x[3], pass3);
			fullAdder fa5(s0[4], s1, w[4], ~x[4], pass4);

		endmodule // fullSubtractor 
	module test_fullAdder; 
// ------------------------- definir dados 
		reg [4:0] y; 
		reg [4:0] z; 
		reg vazio;
		wire carry1; 
		wire carry2; 
		wire carry3; 
		wire carry4; 
		wire [4:0] s0f;
		wire s1f;
		
		fullSubtractor6bit fs1 (s0f, s1f, y, z, vazio);
		//fullSubtractor fs3 (s0f[2], carry3, y[2], z[2], carry2);
		//fullSubtractor fs4 (s0f[3], carry4, y[3], z[3], carry3);
		//fullSubtractor fs5 (s0f[4], s1f, y[4], z[4], carry4);
		
// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0022 - Pedro Henrique Vilar Locatelli - 427453"); 
		$display("Test ALU's full subtractor"); 
		
		// projetar testes do somador complete
		
		#1 y = 5'b00001; z = 5'b00001; vazio = 1'b1;
		
		$monitor("%b - %b = %b%b", y, z, s1f, s0f ); 
		
		#2 y = 5'b00100; z = 5'b00001; vazio = 1'b1;
		#3 y = 5'b01000; z = 5'b00111; vazio = 1'b1;
		
	end 
endmodule // test_fullAdder 