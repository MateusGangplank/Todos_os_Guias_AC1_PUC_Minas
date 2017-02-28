// -------------------------
// Exemplo0021 - FULL ADDER 
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453 
// ------------------------- 
// ------------------------- 
		module halfAdder (output s0, 
								output s1,
		                  input w,  
		                  input x); 
		
//		xor (s0, w, x);
//		and (s1, w, x);
		xor XOR1(s0, w, x);
		and AND1(s1, w, x);

		endmodule // halfAdder

		module fullAdder (output s0,
								output s1,
		                  input w,
		                  input x,
		                  input ci);
			wire sxor,sand1,sand2;

			halfAdder ha1(sxor,sand1,w,x);
			halfAdder ha2(s0,sand2,ci,sxor);
//			or (s1, sand1, sand2);
			or OR1(s1, sand1, sand2);

		endmodule // fullAdder

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
		
		fullAdder fa1 (s0f[0], carry1, y[0], z[0], vazio);
		fullAdder fa2 (s0f[1], carry2, y[1], z[1], carry1);
		fullAdder fa3 (s0f[2], carry3, y[2], z[2], carry2);
		fullAdder fa4 (s0f[3], carry4, y[3], z[3], carry3);
		fullAdder fa5 (s0f[4], s1f, y[4], z[4], carry4);
		
// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0021 - Pedro Henrique Vilar Locatelli - 427453"); 
		$display("Test ALU's full adder"); 
		
		// projetar testes do somador complete
		
		#1 y = 5'b00001; z = 5'b00001; vazio = 1'b0;
		
		$monitor("%b + %b = %b%b", y, z, s1f, s0f ); 
		
		#2 y = 5'b00101; z = 5'b00101; vazio = 1'b0;
		
	end 
endmodule // test_fullAdder 