// ------------------------- 
// Exemplo0021 – FULL ADDER 
// Nome: Luiz Marques de oliveira
// Matricula: 417138 
// ------------------------- 
 
 // ------------------------- 
//  half adder 
// ------------------------- 
module halfAdder (output s, 
						output carry,
                  input a,  
                  input b); 

xor (s, a, b);
and (carry, a, b);
 
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
	or (carry, carry1, carry2);
 
endmodule // fullAdder

// ------------------------- 
//  Complemento de um
// ------------------------- 
module complemento (output s, 
						input a);
	
	not(s,a);
 
endmodule // complemento

 
module test_fullAdder; 
// ------------------------- definir dados 
      reg [5:0] x; 
      reg [5:0] y; 
		reg  carryIn;
		wire [5:0] yb; 
      wire [5:0] soma; 
      wire  carry;
		
		// Nega entrata de um dos operandos
		complemento c1(yb[0],y[0]);
		complemento c2(yb[1],y[1]);
		complemento c3(yb[2],y[2]);
		complemento c4(yb[3],y[3]);
		complemento c5(yb[4],y[4]);
		complemento c6(yb[5],y[5]);
		
		fullAdder fa1(soma[0],carry,x[0],yb[0], carryIn);
		fullAdder fa2(soma[1],carry,x[1],yb[1], carryIn);
		fullAdder fa3(soma[2],carry,x[2],yb[2], carryIn);
		fullAdder fa4(soma[3],carry,x[3],yb[3], carryIn);
		fullAdder fa5(soma[4],carry,x[4],yb[4], carryIn);
		fullAdder fa6(soma[5],carry,x[5],yb[5], carryIn);
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0022 - Luiz Marques de oliveira - 417138"); 
      $display("Test ALU’s subtrator 6 bits"); 
		#1 x = 6'b000001;  y = 6'b000001;  carryIn = 1'b1;
				
		#1 $display("%6b - %6b = %b Carry: %1b",x,y,soma, carryIn); 
		
		#1 x = 6'b010011;  y = 6'b010101;
		
		#1 $display("%6b - %6b = %b Carry: %1b",x,y,soma, carryIn); 
		
		#1 x = 6'b111111;  y = 6'b000000;
		
		#1 $display("%6b - %6b = %b Carry: %1b",x,y,soma, carryIn); 

 
 end 
 
endmodule // test_subtrator 

