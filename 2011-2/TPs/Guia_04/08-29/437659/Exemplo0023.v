// ------------------------- 
// Exemplo0023 – FULL ADDER 
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

// ------------------------- 
//  Comparador Igualdade
// ------------------------- 
module comparadorIgualdade (output s, 
						input a, input b);
	
	xnor(s,a,b);
 
endmodule // comparador   

 
module test_Comparator; 
// ------------------------- definir dados 
      reg [5:0] x; 
      reg [5:0] y;
		wire [5:0] s;
		
		comparadorIgualdade c1(s[0],x[0],y[0]);
		comparadorIgualdade c2(s[1],x[1],y[1]);
		comparadorIgualdade c3(s[2],x[2],y[2]);
		comparadorIgualdade c4(s[3],x[3],y[3]);
		comparadorIgualdade c5(s[4],x[4],y[4]);
		comparadorIgualdade c6(s[5],x[5],y[5]);
		
		wire saida;
		
		and (saida,s[0],s[1],s[2],s[3],s[4],s[5]);
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0023 - Debora Amaral Chaves - 437659"); 
      $display("Test ALU’s Comparador da Igualdade"); 
		#1 x = 6'b000001;  y = 6'b000001;
				
		#1 $display("%6b = %6b ? %b ",x,y,saida); 
		
		#1 x = 6'b010011;  y = 6'b010101;
		
		#1 $display("%6b = %6b ? %b",x,y,saida); 
		
		#1 x = 6'b111111;  y = 6'b000000;
		
		#1 $display("%6b = %6b ? %b ",x,y,saida); 

 
 end 
 
endmodule // test_comparator 

    //Exemplo0023 - Debora Amaral Chaves - 437659
    //Test ALU’s Comparador da Igualdade
    //000001 = 000001 ? 1 
    //010011 = 010101 ? 0
    //111111 = 000000 ? 0