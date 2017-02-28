// ------------------------- 
// Exemplo0054 – Soma e Subtracao
// Nome: Mateus Augusto Moraes Ferreira  
// Matricula: 435669 
// ------------------------- 
 
// ------------------------- 
//  soma e subtracao (decremento de 1)
// ------------------------- 
module half_adder (output s0,	 
                 output s1,  
                 input x,  
                 input y);
 

and AND1(s1,x,y);
xor XOR1(s0,x,y);

endmodule 

// ------------------------- 
module full_adder (output s0,	 
                   output s1,  
                   input x,  
                   input y,  
                   input c_in); 
 

wire half_adder1[0:1];
wire half_adder2[0:1];

half_adder porta1(half_adder1[1],half_adder1[0],x,y);
half_adder porta2(half_adder2[1],half_adder2[0],half_adder1[1],c_in);

assign s0 = half_adder2[1];
or(s1,half_adder1[0],half_adder2[0]);
 
endmodule 
//---------------------------------
module somachave (output s0,
                  output s1,
						input x,
						input y,
						input c_in,
						input selecionador);
						
wire XOR1;
xor XOR_g(XOR1,y,selecionador);
full_adder Sum(s0,s1,x,XOR1,c_in);	

endmodule
//---------------------------------
module somacompleta6(output[5:0] s0,
						  input[5:0] x,
						  input[5:0] y,
						  input chave);
						 
						 
      wire [5:0] w; 
      wire [5:0] z;      
      wire c1;
		wire c2;
		wire c3;
		wire c4;
		wire c5;
		wire c6;
					
		somachave sum0(s0[0],c1,x[0],y[0],chave,chave);
		somachave sum1(s0[1],c2,x[1],y[1],c1,chave);
		somachave sum2(s0[2],c3,x[2],y[2],c2,chave);
		somachave sum3(s0[3],c4,x[3],y[3],c3,chave);
		somachave sum4(s0[4],c5,x[4],y[4],c4,chave);
		somachave sum5(s0[5],c6,x[5],y[5],c5,chave);	
		
		endmodule	
// -------------------------------------------------------------	

module circuito(output[5:0] s0,
                input[5:0] x,  
                input[5:0] y,
					 input chave);	
					
	 somacompleta6 e1(s0,x,y,chave);
	
endmodule

//----------------------------------------------------------
module circuito2 (output[5:0] s0,	    
                  input[5:0] x); 
 

somacompleta6 e1(s0,x,x,1);

 
endmodule 

//---------------------------------------------------------	

module test_selecionar; 

      reg[5:0] x;
		reg[5:0] w;
		reg[5:0] e;
		reg chave;
		
		wire[5:0] y;
		wire[5:0] i;
		wire[5:0] i2;
		
		circuito2 c2(i2,e);
		circuito c1(i,x,i2,chave);
		somacompleta6 sum(y,i,w,chave);
				
		
		
 
// ------------------------- ---------------------------------------
     initial begin 
      
		$display("Exemplo0054"); 
      $display("Mateus Augusto Moraes Ferreira Matricula:435669");
		$display("Soma Subtracao Decremento 1");
		
		x=6'b011011;	e=6'b010110; w=6'b000001; chave=1'b1;	
		#1 $display("(%b - (%b*0)) - %b = %b",x,e,w,y);
		
	   x=6'b010001;	e=6'b100110; w=6'b000001; chave=1'b0;	
		#2 $display("(%b - (%b*0)) + %b = %b",x,e,w,y);

 end 
 
endmodule 										  


				 						 