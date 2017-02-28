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

module exp01(output[5:0] s0,input[5:0] in01,input[5:0] in02,input selecionador);											 
      wire [5:0] w;
      wire [5:0] z;      
      wire c, c2, c3, c4, c5, c6;
					
		selecionador sl1(s0[0],c,in01[0],in02[0],selecionador,selecionador);
		selecionador sl2(s0[1],c2,in01[1],in02[1],c,selecionador);
		selecionador sl3(s0[2],c3,in01[2],in02[2],c2,selecionador);
		selecionador sl4(s0[3],c4,in01[3],in02[3],c3,selecionador);
		selecionador sl5(s0[4],c5,in01[4],in02[4],c4,selecionador);
		selecionador sl6(s0[5],c6,in01[5],in02[5],c5,selecionador);	
		
endmodule	


module test_selecionador; 
      reg[5:0] in01;
		reg[5:0] in02;
		reg c_in;		
		wire[5:0] s0;
				
		exp01 somador(s0,in01,in02,c_in);
		
 initial begin 
		$display("Nome: Lorena Danielle Gonçalves Bento - 435049");
		in01=6'b001001;	in02=6'b000100; c_in=1'b0;	
		#1 $display("%b + %b = %b",in01,in02,s0);
		
		in01=6'b011011;	in02=6'b001011; c_in=1'b1;	
		#2 $display("%b - %b = %b",in01,in02,s0);
		
		in01=6'b011011;	in02=6'b001101; c_in=1'b1;	
		#3 $display("%b + %b = %b",in01,in02,s0);
		
		in01=6'b011011;	in02=6'b011011; c_in=1'b1;	
		#4 $display("%b - %b = %b",in01,in02,s0);

end 
endmodule


				 						 