// ------------------------- 
// Exemplo0031 � FULL ADDER 
// Nome: Andr� Henriques Fernandes	 
// Matricula: 427386
// ------------------------- 
 
 // ------------------------- 
//  half adder 
// ------------------------- 
module halfAdder (output s, 
						output carry,
                  input a,  
                  input b); 

xor xor1(s, a, b);
and and1(carry, a, b);
 
endmodule // halfAdder 

 
// ------------------------- 
//  full adder 
// ------------------------- 
module fullAdder (output s, 
						output carry,
                  input a,  
                  input b,  
                  input carryIn);
	
	wire s0,carry1,carry2;				
						 
	halfAdder ha(s0,carry1,a,b);
	halfAdder ha1(s,carry2,s0,carryIn);
	or or1(carry, carry1, carry2);
 
endmodule // fullAdder 
 
 module igualZero(output zero, input [5:0] entrada);
 	nor nor1(zero, entrada[0],entrada[1],entrada[2],entrada[3],entrada[4],entrada[5]);
 endmodule
 
module test_fullAdder; 
// ------------------------- definir dados 
      reg [5:0] x; 
      reg [5:0] y; 
      reg  chave;
		output [5:0] y_negado;  
      wire [5:0] soma; 
      wire [5:0] carry;
		wire igualZero;

		
		xor xor1(y_negado[0],y[0],chave);
		xor xor2(y_negado[1],y[1],chave);
		xor xor3(y_negado[2],y[2],chave);
		xor xor3(y_negado[3],y[3],chave);
		xor xor4(y_negado[4],y[4],chave);
		xor xor5(y_negado[5],y[5],chave);

				
		fullAdder fa1(soma[0],carry[0],x[0],y_negado[0], chave);
		fullAdder fa2(soma[1],carry[1],x[1],y_negado[1], carry[0]);
		fullAdder fa3(soma[2],carry[2],x[2],y_negado[2], carry[1]);
		fullAdder fa4(soma[3],carry[3],x[3],y_negado[3], carry[2]);
		fullAdder fa5(soma[4],carry[4],x[4],y_negado[4], carry[3]);
		fullAdder fa6(soma[5],carry[5],x[5],y_negado[5], carry[4]);
		
		igualZero isZero(igualZero,soma);
		
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0032 - Andre Henriques - 427386"); 
      $display("Test ALU�s full adder  and full subtractor"); 
		#1 x = 6'b000001;  y = 6'b000001;  chave = 1'b1;
				
		#1 $display("%6b - %6b = %b Chave: %1b Resultado � zero? %1b (1=SIM/0=NAO)",x,y,soma, chave,igualZero); 
		
		#1 x = 6'b010011;  y = 6'b010101;  chave = 0'b0;
		
		#1 $display("%6b + %6b = %b Chave: %1b Resultado � zero? %1b (1=SIM/0=NAO)",x,y,soma, chave,igualZero); 
		
		#1 x = 6'b111111;  y = 6'b000000;  chave = 1'b1;
		
		#1 $display("%6b - %6b = %b Chave: %1b Resultado � zero? %1b (1=SIM/0=NAO)",x,y,soma, chave,igualZero); 


 
 // projetar testes do somador complete 
 
 end 
 
endmodule // test_fullAdder 