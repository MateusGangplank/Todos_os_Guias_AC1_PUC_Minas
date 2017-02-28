// ------------------------- 
// Exemplo0032 / Somador/Subtrator
// Nome: Pedro Ballona
// Matricula: 427455 
// ------------------------- 
 

// ------------------------- 
//  and6Negado
// ------------------------- 
module and6Negado (output s,	input[5:0] a); 
 




assign s = ~a[0] & ~a[1] & ~a[2] & ~a[3] & ~a[4] & ~a[5];

endmodule

// ------------------------- 
//  F0
// ------------------------- 
module F0 (output s,	input[5:0] a);

and6Negado p1(s,a);

endmodule 
 

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



module test_F0; 
// ------------------------- definir dados 
      reg[5:0] x;
		reg[5:0] w;
		reg c;
		wire a;
		
		wire[5:0] y;
		
		
		somador6b somador(y,x,w,c);
		F0 da0(a,y);
		//reg x;
		//reg w;
		//reg c;
		//wire y[1:0];
		
		//FAFS soma0(y[0],y[1],x,w,c,c);
		
		
		
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0032 - Pedro Ballona - 427455"); 
      $display("Test ALU’s somador/subtratpr (1-subtrator 0-somador) Deu Zero? 0-não 1-sim");
		x=6'b000011;	w=6'b000011; c=1'b1;	
		#1 $display("%b - %b = %b   Deu 0? %b",x,w,y,a);
		
		x=6'b011011;	w=6'b000011; c=1'b1;	
		#2 $display("%b - %b = %b Deu 0? %b",x,w,y,a);
		x=6'b001111;	w=6'b010001; c=1'b0;	
		#3 $display("%b + %b = %b Deu 0? %b",x,w,y,a);
		
 
 // projetar testes do somador complete 
 
 end 
 
endmodule // test_c2 