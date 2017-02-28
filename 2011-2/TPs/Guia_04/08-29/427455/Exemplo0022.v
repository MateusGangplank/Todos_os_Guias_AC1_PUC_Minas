// ------------------------- 
// Exemplo0022  
// Nome: Pedro Ballona 
// Matricula: 427455
// ------------------------- 
 
// ------------------------- 
//  meia Soma 
// ------------------------- 
module meiaSubtracao (output s0,	 output s1,  
                               input a,  
                               input b); 
 
// descrever por portas



and(s1,~a,b);
xor(s0,a,b);


 
endmodule // fullSubtrator


// ------------------------- 
//  full subtrator 
// ------------------------- 
module fullSubtrator (output s0,	 output s1,  
                               input a,  
                               input b,  
                               input borrowIn); 
 
// descrever por portas
wire meiaSubtracao1[0:1];
wire meiaSubtracao2[0:1];

meiaSubtracao porta1(meiaSubtracao1[1],meiaSubtracao1[0],a,b);
meiaSubtracao porta2(meiaSubtracao2[1],meiaSubtracao2[0],meiaSubtracao1[1],borrowIn);

assign s0 = meiaSubtracao2[1];
or(s1,meiaSubtracao1[0],meiaSubtracao2[0]);
 
endmodule // fullSubtrator 
 
module test_fullSubtrator; 
// ------------------------- definir dados 
     
		reg [5:0] x; 
      reg [5:0] y; 
      //reg  borrow;		 
      wire [5:0] subtracao;
		wire borrow;
		wire borrow2;
		wire borrow3;
		wire borrow4;
		wire borrow5;
		wire borrow6;		
		
		
		meiaSubtracao subtracao0(subtracao[0],borrow,x[0],y[0]);
		fullSubtrator subtracao1(subtracao[1],borrow2,x[1],y[1],borrow);
		fullSubtrator subtracao2(subtracao[2],borrow3,x[2],y[2],borrow2);
		fullSubtrator subtracao3(subtracao[3],borrow4,x[3],y[3],borrow3);
		fullSubtrator subtracao4(subtracao[4],borrow5,x[4],y[4],borrow4);
		fullSubtrator subtracao5(subtracao[5],borrow6,x[5],y[5],borrow5);				
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0022 - Pedro Ballona - 427455"); 
      $display("Test ALU’s full adder");
		x = 6'b00011; y = 6'b00011;
 		#1 $display("%b",subtracao);
 
 // projetar testes do subtracaodor complete 
 
 end 
 
endmodule // test_fullSubtrator 