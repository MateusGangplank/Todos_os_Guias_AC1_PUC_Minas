//Guilherme Rodrigues Melo de Oliveira - 427409
//---------------------------------------------
//Somador algebrico(ampliado) - soma e subtracao
//                            - verficar se é 0  
//---------------------------------------------

module AND6 (output s0,	 
             input [5:0] x);
				 
assign s0 = ~x[0] & ~x[1] & ~x[2] & ~x[3] & ~x[4] & ~x[5];

endmodule

//-----------------------------------------------------

module ver0(output s0,
            input[5:0] x);
				
AND6 gate_ver0(s0,x);

endmodule

//---------------------------------------------------

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

module test_ver0;

      reg[5:0] x;
		reg[5:0] y;
		reg c;
		wire w;
		
		wire[5:0] z;
		
		
		exemplo0031 somador(z,x,y,c);
		ver0 v1(w,z);

// ------------------------------------------------------

initial begin 
      
		
		$display("Exemplo0032"); 
      $display("Guilherme Rodrigues Melo de Oliveira");

      x=6'b010011;	y=6'b000011; c=1'b0;	
		#1 $display("%b + %b = %b   =0? %b",x,y,z,w);
		
		x=6'b011011;	y=6'b011011; c=1'b1;	
		#2 $display("%b - %b = %b =0? %b",x,y,z,w);

end 
 
endmodule 								  


				 						 