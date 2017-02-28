//Guilherme Rodrigues Melo de Oliveira - 427409
//---------------------------------------------
//Somador algebrico(ampliado) - soma e subtracao
//                            - decremento de 1 operando  
//---------------------------------------------

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
module selecionar(output s0,
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
module exemplo0031(output[5:0] s0,
						 input[5:0] x,
						 input[5:0] y,
						 input selecionador);
						 
						 
      wire [5:0] w; 
      wire [5:0] z;      
      wire c;
		wire c2;
		wire c3;
		wire c4;
		wire c5;
		wire c6;
					
		selecionar sum0(s0[0],c,x[0],y[0],selecionador,selecionador);
		selecionar sum1(s0[1],c2,x[1],y[1],c,selecionador);
		selecionar sum2(s0[2],c3,x[2],y[2],c2,selecionador);
		selecionar sum3(s0[3],c4,x[3],y[3],c3,selecionador);
		selecionar sum4(s0[4],c5,x[4],y[4],c4,selecionador);
		selecionar sum5(s0[5],c6,x[5],y[5],c5,selecionador);	
		
		endmodule	
// -------------------------------------------------------------	

module circuit(output[5:0] s0,
               input[5:0] x,  
               input[5:0] y,
					input selecionador);	
					
	 exemplo0031 e1(s0,x,y,selecionador);
	
endmodule

//----------------------------------------------------------
module circuit2 (output[5:0] s0,	    
                 input[5:0] x); 
 

exemplo0031 e1(s0,x,x,1);

 
endmodule 

//---------------------------------------------------------	

module test_selecionar; 

      reg[5:0] x;
		reg[5:0] w;
		reg[5:0] e;
		reg c;
		
		wire[5:0] y;
		wire[5:0] i;
		wire[5:0] i2;
		
		circuit2 c2(i2,e);
		circuit c1(i,x,i2,c);
		exemplo0031 sum(y,i,w,c);
				
		
		
 
// ------------------------- ---------------------------------------
 initial begin 
      
		$display("Exemplo0033"); 
      $display("Guilherme Rodrigues Melo de Oliveira / 427409");
		$display("\n");
		
		x=6'b011011;	e=6'b010110; w=6'b000001; c=1'b1;	
		#1 $display("(%b - (%b*0)) - %b = %b",x,e,w,y);
		
	   x=6'b010001;	e=6'b100110; w=6'b000001; c=1'b0;	
		#2 $display("(%b - (%b*0)) + %b = %b",x,e,w,y);
		

 
 end 
 
endmodule 										  


				 						 