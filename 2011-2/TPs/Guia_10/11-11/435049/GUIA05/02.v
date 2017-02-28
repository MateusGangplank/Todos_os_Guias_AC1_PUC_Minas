// ------------------------- 
// --GUIA 05
// --Nome: Lorena Danielle Gonçalves Bento 
// --Matricula: 435049
// ------------------------- 

module exerc02 (output s0,input [5:0] in00);			 
	assign s0 = ~in00[0] & ~in00[1] & ~in00[2] & ~in00[3] & ~in00[4] & ~in00[5];
endmodule

module ver0(output s0, input[5:0] in00);			
	exerc02 gate_ver0(s0,in00);
endmodule

module half_adder (output s0, output s1,  input in00,  input in01); 
	and and1(s1,in00,in01);
	xor ixor1(s0,in00,in01);
endmodule 

module full_adder (output s0,  output s1,  input in00,  input in01,  input c_in); 
	wire half_adder1[0:1];
	wire half_adder2[0:1];
	half_adder porta1(half_adder1[1],half_adder1[0],in00,in01);
	half_adder porta2(half_adder2[1],half_adder2[0],half_adder1[1],c_in);

	assign s0 = half_adder2[1];
	
	or(s1,half_adder1[0],half_adder2[0]); 
endmodule 


module selecionar(output s0, output s1,input in00,input in01,input c_in,input selecionador);						
	wire XOR1;
	xor XOR_g(XOR1,in01,selecionador);
	full_adder Sum(s0,s1,in00,XOR1,c_in);	
endmodule



module exemplo0031(output[5:0] s0,  input[5:0] in00, input[5:0] in01, input selecionador);				 
      wire [5:0] w; 
      wire [5:0] z;      
      wire c, c2, c3,  c4,c5,c6;
					
		selecionar sum0(s0[0],c,in00[0],in01[0],selecionador,selecionador);
		selecionar sum1(s0[1],c2,in00[1],in01[1],c,selecionador);
		selecionar sum2(s0[2],c3,in00[2],in01[2],c2,selecionador);
		selecionar sum3(s0[3],c4,in00[3],in01[3],c3,selecionador);
		selecionar sum4(s0[4],c5,in00[4],in01[4],c4,selecionador);
		selecionar sum5(s0[5],c6,in00[5],in01[5],c5,selecionador);		
endmodule	


module test_ver0;
      reg[5:0] in00;
		reg[5:0] in01;
		reg c;
		wire w;		
		wire[5:0] z;	
		exemplo0031 somador(z,in00,in01,c);
		ver0 v1(w,z);

initial begin 
      	
		$display("Exemplo0032"); 
      $display("Nome: Lorena Danielle Gonçalves Bento - 435049");

      in00=6'b010011;	in01=6'b000011; c=1'b0;	
		#1 $display("%b + %b = %b  %b",in00,in01,z,w);
		
		in00=6'b011011;	in01=6'b011011; c=1'b1;	
		#2 $display("%b - %b = %b  %b",in00,in01,z,w);

end 
 
endmodule 								  


				 						 