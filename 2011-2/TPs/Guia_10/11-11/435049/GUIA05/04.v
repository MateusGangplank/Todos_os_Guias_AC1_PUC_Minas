// ------------------------- 
// --GUIA 05
// --Nome: Lorena Danielle Gonçalves Bento 
// --Matricula: 435049
// ------------------------- 

module half_adder (output s0, output s1, input in01, input in02); 
//--portas
	and and1(s1,in01,in02);
	xor xor1(s0,in01,in02);
endmodule 

 
module full_adder (output s0,output s1,input in01, input in02, input c_in); 
	wire half_adder1[0:1];
	wire half_adder2[0:1];
	half_adder porta1(half_adder1[1],half_adder1[0],in01,in02);
	half_adder porta2(half_adder2[1],half_adder2[0],half_adder1[1],c_in);
	assign s0 = half_adder2[1];
	or or1(s1,half_adder1[0],half_adder2[0]); 
endmodule 
 

module selecionador(output s0, output s1,input in01,input in02,input c_in,input selecionador);						
	wire XOR1;
	xor XOR_g(XOR1,in02,selecionador);
	full_adder Sum(s0,s1,in01,XOR1,c_in);	
endmodule


module exemplo0034(output[5:0] s0, input[5:0] in01,  input[5:0] in02, input selecionador);					 
      wire [5:0] w; 
      wire [5:0] z;      
      wire c, c2, c3, c4, c5, c6;
					
		selecionador sum0(s0[0],c,x[0],y[0],selecionador,selecionador);
		selecionador sum1(s0[1],c2,x[1],y[1],c,selecionador);
		selecionador sum2(s0[2],c3,x[2],y[2],c2,selecionador);
		selecionador sum3(s0[3],c4,x[3],y[3],c3,selecionador);
		selecionador sum4(s0[4],c5,x[4],y[4],c4,selecionador);
		selecionador sum5(s0[5],c6,x[5],y[5],c5,selecionador);	
		
endmodule	


module circuit(output[5:0] s0, input[5:0] in01, input[5:0] in02, input selecionador);						
	 exemplo0034 e1(s0,in01,in02,selecionador);	
endmodule


module circuit2 (output[5:0] s0,input[5:0] in01); 
	exemplo0034 e1(s0,in01,in01,1);
endmodule 


module test_selecionar; 
      reg[5:0] in01;		reg[5:0] w;		reg[5:0] e;		reg c;		
		wire[5:0] in02;		wire[5:0] i;		wire[5:0] i2;
		
		circuit2 c2(i2,e);
		circuit c1(i,in01,i2,c);
		exemplo0034 sum(in02,i,w,c);
				
 initial begin 
      
		$display("Exemplo0032"); 
      $display("Nome: Lorena Danielle Gonçalves Bento - 435049");
		
		in01=6'b011011;	e=6'b010110; w=6'b000001; c=1'b1;	
		#1 $display("(%b - (%b*0)) - %b = %b",in01,e,w,in02);
		
	   in01=6'b010001;	e=6'b100110; w=6'b000001; c=1'b0;	
		#2 $display("(%b - (%b*0)) + %b = %b",in01,e,w,in02);
		

 
 end 
 
endmodule 										  


				 						 