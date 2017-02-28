// ------------------------- 
// Exemplo0053 – Soma e Subtracao
// Nome: Mateus Augusto Moraes Ferreira  
// Matricula: 435669 
// ------------------------- 
 
// ------------------------- 
//  soma e subtracao (incremento de 1)
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
						input chave);
						
wire XOR1;
xor XOR_g(XOR1,y,chave);
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
					
		somachave soma00(s0[0],c1,x[0],y[0],chave,chave);
		somachave soma11(s0[1],c2,x[1],y[1],c1,chave);
		somachave soma22(s0[2],c3,x[2],y[2],c2,chave);
		somachave soma33(s0[3],c4,x[3],y[3],c3,chave);
		somachave soma44(s0[4],c5,x[4],y[4],c4,chave);
		somachave soma55(s0[5],c6,x[5],y[5],c5,chave);	
		
		endmodule	
// -------------------------------------------------------------	

module circuito(output[5:0] s0,
                input[5:0] x,  
                input[5:0] y,
					 input chave);	
					
	somacompleta6 soma1(s0,x,y,chave);
	
endmodule

//----------------------------------------------------------	

module test_somachave; 

      reg[5:0] x;
		reg[5:0] y;
		reg[5:0] z;
		reg chave;
		
		wire[5:0] w1;
		wire[5:0] w2;
		
		circuito c1(w2,x,z,chave);
		somacompleta6 soma1(w1,w2,y,chave);
				
		
		
 
// ------------------------- ---------------------------------------
 initial begin 
      
		$display("Exemplo0053"); 
      $display("Mateus Augusto Moraes Ferreira Matricula:435669");
		$display("Soma e Subtracao Incremento 1");
		
		x=6'b010011;	z=6'b000110; y=6'b000001; chave=1'b1;	 
		#1 $display("chave=%b (%b - %b) - %b = %b",chave,x,z,y,w1);
		
		x=6'b001011;	z=6'b000110; y=6'b000001; chave=1'b0;	
		#1 $display("chave=%b (%b + %b) - %b = %b",chave,x,z,y,w1);
		

 
 end 
 
endmodule 										  

 