// ------------------------- 
// Exemplo0033 - FULL ADDER 
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453 
// ------------------------- 
// ------------------------- 
		module halfAdder (output s0, 
								output s1,
		                  input w,  
		                  input x); 
		
		xor (s0, w, x);
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
				
		module testZero (output magi,
							  input [5:0] casper,
							  input belthasar,
							  input melchior);
							  
			wire m1,m2,m3,m4,nimagi;
			or (m1, casper[0], casper[1]);
			or (m2, casper[2], casper[3]);
			or (m3, m1, m2);
			or (m4, m3, casper[4]);
			or (nimagi, m4, belthasar);
			xor(magi, nimagi, melchior);
			
		endmodule
			
		
	module test_fullAdder; 
// ------------------------- definir dados 
		reg [5:0] y; 
		reg [5:0] z; 
		reg vazio;
		reg vazio1;
		reg nihil;
		wire carry1; 
		wire carry2; 
		wire carry3; 
		wire carry4; 
		wire carry5; 
		wire sxe1; 
		wire sxe2; 
		wire sxe3; 
		wire sxe4; 
		wire sxe5; 
		wire sxe6; 
		wire [5:0] s0f;
		wire s1r;
		wire s1f;
		wire zero;
		wire res;
		
		xor (sxe1, vazio, z[0]);
		xor (sxe2, vazio, z[1]);
		xor (sxe3, vazio, z[2]);
		xor (sxe4, vazio, z[3]);
		xor (sxe5, vazio, z[4]);
		xor (sxe6, vazio, z[5]);
		
		fullAdder fa1 (s0f[0], carry1, y[0], sxe1, vazio);
		fullAdder fa2 (s0f[1], carry2, y[1], sxe2, carry1);
		fullAdder fa3 (s0f[2], carry3, y[2], sxe3, carry2);
		fullAdder fa4 (s0f[3], carry4, y[3], sxe4, carry3);
		fullAdder fa5 (s0f[4], carry5, y[4], sxe5, carry4);
		fullAdder fa6 (s0f[5], s1r, y[5], sxe6, carry5);
		
		xor (s1f, s1r, vazio);
		

		
		testZero tz (zero, s0f, s1f, nihil);
		
// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0032 - Pedro Henrique Vilar Locatelli - 427453"); 
		$display("Test ALU's full adder"); 
		
		// projetar testes do somador complete
		#1 nihil = 1'b1;
		#1 vazio1 = 1'b1;
		
		#1 y = 5'b00001; z = 5'b00001; vazio = 1'b0;
		
		$monitor("%b op %b com chave %b (0+, 1-) = %b%b que e' %b (1-tudo zero, 0-nao zero)", y, z, vazio, s1f, s0f, zero ); 
		
		#2 y = 5'b00101; z = 5'b00101; vazio = 1'b0;
		#2 y = 5'b00101; z = 5'b00101; vazio = 1'b1;
		#2 y = 5'b00001; z = 5'b00001; vazio = 1'b1;
		#2 y = 5'b00101; z = 5'b00001; vazio = 1'b1;
		#2 y = 5'b00101; z = 5'b00001; vazio = 1'b0;
		#2 y = 5'b01011; z = 5'b00001; vazio = 1'b1;
		
	end 
endmodule // test_fullAdder 