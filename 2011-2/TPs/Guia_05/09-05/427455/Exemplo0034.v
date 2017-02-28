// ------------------------- 
// Exemplo0034 / Somados/Subtrator
// Nome: Pedro Ballona
// Matricula: 427455 
// ------------------------- 
 
// ------------------------- 
//  meia Soma 
// ------------------------- 
module meiaSoma (output s0,	 output s1,  
                               input a,  
                               input b); 
 
// descrever por portas



and(s1,a,b);
xor(s0,a,b);


 
endmodule // fullAdder


// ------------------------- 
//  full adder 
// ------------------------- 
module fullAdder (output s0,	 output s1,  
                               input a,  
                               input b,  
                               input carryIn); 
 
// descrever por portas
wire meiaSoma1[0:1];
wire meiaSoma2[0:1];

meiaSoma porta1(meiaSoma1[1],meiaSoma1[0],a,b);
meiaSoma porta2(meiaSoma2[1],meiaSoma2[0],meiaSoma1[1],carryIn);

assign s0 = meiaSoma2[1];
or(s1,meiaSoma1[0],meiaSoma2[0]);
 
endmodule // fullAdder

// ------------------------- 
//  FAFS 
// ------------------------- 
module FAFS (output s0,	 output s1,  
                               input a,  
                               input b,  
                               input carryIn,
										 input sel); 
 
// descrever por portas
wire xor1;
xor(xor1,b,sel);
fullAdder FA(s0,s1,a,xor1,carryIn);


 
endmodule // FAFS


// ------------------------- 
//  FAFS6b
// -------------------------
module somador6b (output[5:0] c,
										 input[5:0] a,
										 input[5:0] b,
										 input sel);

 
		wire [5:0] x; 
      wire [5:0] y;      
      //wire [5:0] soma;
		wire carry;
		wire carry2;
		wire carry3;
		wire carry4;
		wire carry5;
		wire carry6;			
		FAFS soma0(c[0],carry,a[0],b[0],sel,sel);
		FAFS soma1(c[1],carry2,a[1],b[1],carry,sel);
		FAFS soma2(c[2],carry3,a[2],b[2],carry2,sel);
		FAFS soma3(c[3],carry4,a[3],b[3],carry3,sel);
		FAFS soma4(c[4],carry5,a[4],b[4],carry4,sel);
		FAFS soma5(c[5],carry6,a[5],b[5],carry5,sel);	
		

										 
endmodule//somador6b

// ------------------------- 
//  Mais um Operando
// ------------------------- 
module M1 (output[5:0] s0,	    input[5:0] a,  
                               input[5:0] b,
										 input sel); 
 
// descrever por portas



somador6b S1(s0,a,b,sel);

 
endmodule // fullAdder

// ------------------------- 
//  Menos um Operando
// ------------------------- 
module Me1 (output[5:0] s0,	    input[5:0] a); 
 
// descrever por portas



somador6b S1(s0,a,a,1);

 
endmodule // fullAdder





module test_FAFS; 
// ------------------------- definir dados 
      reg[5:0] x;
		reg[5:0] w;
		reg[5:0] e;
		reg c;
		
		wire[5:0] y;
		wire[5:0] m1;
		wire[5:0] me1;
		
		Me1 p2(me1,e);
		M1 p1(m1,x,me1,c);
		somador6b somador(y,m1,w,c);
				
		
		
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0034 - Pedro Ballona - 427455"); 
      $display("Test ALU’s somador/subtratpr (1-subtrator 0-somador)");
		x=6'b000011;	e=6'b000010; w=6'b000001; c=1'b1;	
		#1 $display("(%b - (%b*0)) - %b = %b",x,e,w,y);
		
		
		
 
 // projetar testes do somador complete 
 
 end 
 
endmodule // test_c2 