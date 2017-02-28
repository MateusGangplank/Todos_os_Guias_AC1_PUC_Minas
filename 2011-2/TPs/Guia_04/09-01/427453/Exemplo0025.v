// ------------------------- 
// Exemplo0025 - C2 
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

		module complementoDe1 (output [5:0] s0,
				                   input [5:0] x);
			not (s0[0], x[0]);
			not (s0[1], x[1]);
			not (s0[2], x[2]);
			not (s0[3], x[3]);
			not (s0[4], x[4]);
			not (s0[5], x[5]);
		 
		endmodule //  
		
		module complementoDe2 (output [5:0] s0f,
				                 input [5:0] x);
		 wire [5:0] enter;
		
		 complementoDe1 c1 (enter, x);
		 
		reg vazio = 0;
		wire carry1; 
		wire carry2; 
		wire carry3; 
		wire carry4; 
		wire carry5; 
		wire s1f;
		
		fullAdder fa1 (s0f[0], carry1, x[0], enter[0], vazio);
		fullAdder fa2 (s0f[1], carry2, x[1], enter[1], carry1);
		fullAdder fa3 (s0f[2], carry3, x[2], enter[2], carry2);
		fullAdder fa4 (s0f[3], carry4, x[3], enter[3], carry3);
		fullAdder fa5 (s0f[4], carry5, x[4], enter[4], carry4);
		fullAdder fa6 (s0f[5], s1f, x[5], enter[5], carry5);
		 
		 
		endmodule //  
		
	module test_fullAdder; 
// ------------------------- definir dados 
		reg [5:0] y; 
		wire [5:0] s0f;
		
		complementoDe2 c2 (s0f, y);
		
// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0025 - Pedro Henrique Vilar Locatelli - 427453"); 
		$display("Test ALU's c2"); 
		
		// projetar testes do somador complete
		
		#1 y = 6'b000001;
				
		$monitor("complemento de 2 de %b = %b", y, s0f ); 
		
		#2 y = 6'b000100;
		#3 y = 6'b010000;
		
	end 
endmodule // test_fullAdder 