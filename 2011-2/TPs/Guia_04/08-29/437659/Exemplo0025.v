// ------------------------- 
// Exemplo0025 – FULL ADDER 
// Nome: Debora Amaral Chaves 
// Matricula: 437659 
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
//  Complemento de 1
// ------------------------- 
module complementoDeUm (output s, 
						input a);
	
	not(s,a);
 
endmodule // complemento de 1 

module test_Complemento2; 
// ------------------------- definir dados 
     	reg [5:0] y;
		wire [5:0] s;
		wire [5:0] carry;
		wire[5:0] yb;
		
		// Nega entrata 
		complementoDeUm c1(yb[0],y[0]);
		complementoDeUm c2(yb[1],y[1]);
		complementoDeUm c3(yb[2],y[2]);
		complementoDeUm c4(yb[3],y[3]);
		complementoDeUm c5(yb[4],y[4]);
		complementoDeUm c6(yb[5],y[5]);
		
		halfAdder ha(s[0],carry[0],yb[0],1);
		fullAdder fa1(s[1],carry[1],yb[1],0,carry[0]);
		fullAdder fa2(s[2],carry[2],yb[2],0,carry[1]);
		fullAdder fa3(s[3],carry[3],yb[3],0,carry[2]);
		fullAdder fa4(s[4],carry[4],yb[4],0,carry[3]);
		fullAdder fa5(s[5],carry[5],yb[5],0,carry[4]);
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0025 - Debora Amaral Chaves - 437659"); 
      $display("Test ALU’s Complemento de 2"); 
		#1 y = 6'b000001;
				
		#1 $display("%6b - Complemento de 2: %6b ",y,s); 
		
		#1 y = 6'b010101;
		
		#1 $display("%6b - Complemento de 2: %6b",y,s); 
		
		#1 y = 6'b000000;
		
		#1 $display("%6b - Complemento de 2: %7b ",y,s); 

 
 end 
 
endmodule // test_complemento2

 //Exemplo0025 - Debora Amaral Chaves - 437659
    //Test ALU’s Complemento de 2
    //000001 - Complemento de 2: 111111 
    //010101 - Complemento de 2: 101011
    //000000 - Complemento de 2: 000000 