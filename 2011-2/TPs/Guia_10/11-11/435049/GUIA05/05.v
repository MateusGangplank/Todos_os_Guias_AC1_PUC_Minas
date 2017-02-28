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

module and_6bits (output s0, input[5:0] in01);
	assign s0 = in01[0] & in01[1] & in01[2] & in01[3] & in01[4] & in01[5];
endmodule


module or_6bits (output s0,input[5:0] in01);
	assign s0 = in01[0] | in0x[1] | in01[2] | in01[3] |in01[4] | in01[5];
endmodule


module equal (output s0, input[5:0] in01,input[5:0] in02); 
wire w0, w1, w2, w3, w4, w5;
wire[5:0] w;

xnor xn1(w0,in01[0],in02[0]);
xnor xn2(w1,in01[1],in02[1]);
xnor xn3(w2,in01[2],in02[2]);
xnor xn4(w3,in01[3],in02[3]);
xnor xn5(w4,in01[4],in02[4]);
xnor xn6(w5,in01[5],in02[5]);

assign w[0] = w0; assign w[1] = w1; assign w[2] = w2;
assign w[3] = w3; assign w[4] = w4; assign w[5] = w5;

and_6bits a6 (s0,w);

endmodule


module greater (output s0, input[5:0] in01,input[5:0] in02); 
wire w0, w1, w2, w3, w4, w5;
wire[5:0] w;

and a1(w0,in01[0],~in02[0]);
and a2(w1,in01[1],~in02[1]);
and a3(w2,in01[2],~in02[2]);
and a4(w3,in01[3],~in02[3]);
and a5(w4,in01[4],~in02[4]);
and a6(w5,in01[5],~in02[5]);

assign w[0] = w0;
assign w[1] = w1;
assign w[2] = w2;
assign w[3] = w3;
assign w[4] = w4;
assign w[5] = w5;

or_6bits o6 (s0,w);

endmodule


module less (output s0, input[5:0] in01,input[5:0] in02); 
wire w0, w1, w2, w3, w4, w5;
wire[5:0] w;

and a1(w0,~in01[0],in02[0]);
and a2(w1,~in01[1],in02[1]);
and a3(w2,~in01[2],in02[2]);
and a4(w3,~in01[3],in02[3]);
and a5(w4,~in01[4],in02[4]);
and a6(w5,~in01[5],in02[5]);

assign w[0] = w0;
assign w[1] = w1;
assign w[2] = w2;
assign w[3] = w3;
assign w[4] = w4;
assign w[5] = w5;

or_6bits o6 (s0,w);

endmodule


module mux (output s0,input[1:0] selecionador, input[5:0] in01,   input[5:0] in02); 
wire e0;wire g0;wire l0;
wire and1;wire and2;wire and3;
wire or1;

equal e1(e0,in01,in02);
greater g1(g0,in01,in02);
less l1(l0,in01,in02);

and(and1,e0,~selecionador[0],~selecionador[1]);
and(and2,g0,selecionador[0],~selecionador[1]);
and(and3,l0,~selecionador[0],selecionador[1]);

or(or1,and1,and2);
or(s0,or1,and3);

endmodule 

module test_selecionar; 
      reg[5:0] in01;		reg[5:0] w;		reg[1:0] selecionador;
		wire c;
				
						
		
 initial begin 
      
		
		$display("Exemplo0035"); 
      $display("Nome: Lorena Danielle Gonçalves Bento - 435049");
		
		in01=6'b100011; w=6'b101011; selecionador = 2'b00;	
		#1 $display("(%b = %b) %b",in01,w,c);
		
		in01=6'b101011; w=6'b111110;	selecionador = 2'b01;
		#2 $display("(%b > %b) %b",in01,w,c);
		
		in01=6'b101111; w=6'b110110;	selecionador = 2'b10;
		#3 $display("(%b < %b) %b",in01,w,c);
		

end 
 
endmodule

				 						 