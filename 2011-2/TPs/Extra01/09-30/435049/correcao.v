// ------------------------- 
// Correção da Prova01  
// Nome: Lorena Danielle Gonçalves Bento
// Matricula: 435049 
// ------------------------- 
// ------------------------- 
// Correção da Prova em Verilog
// ------------------------- 

module correcao0(a, b, c, d, out1, out2, out3);
	output out1, out2, out3;
	input a,b,c,d;
	wire(resp,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,not1,not2,not3,not4);
	not n1(not1,c);
	not n2(not2,d);
	
	//---s2-----
	and a1(q1,not1,not2,b);
	and a2(q2,not1,a);
	and a3(q3,not2,a,b);
	
	
	or o1(out1,q1,q2,q3);
	//Fim s2
	
	
	//---s1-----
	not n3(not3,a);
	not n4(not4,b);
	
	and a4(q4,not1,not2,not3,not4);
	and a5(q5,not1,not3,b,d);
	and a6(q6,c,d,a,b);
	and a7(q7,a,c,not2,not4);
	
	
	or o2(out2,q4,q5,q6,q7);
	//Fim s1
	
	//---s0-----
	and a8(q8,d,not3,not4);
	and a9(q9,c,not3);
	and a10(q10,c,d,not4);
		
	or o3(out3,q8,q9,q10);
	//Fim s0
	
	//resultado
	or o4(resp,out1,out2,out3);
	
endmodule