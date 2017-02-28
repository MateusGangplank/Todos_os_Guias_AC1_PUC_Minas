// ------------------------- 
// Exemplo0025  
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
//  somador6b
// -------------------------
module somador6b (output[5:0] c,
										 input[5:0] a,
										 input[5:0] b);

 
		wire [5:0] x; 
      wire [5:0] y;      
      //wire [5:0] soma;
		wire carry;
		wire carry2;
		wire carry3;
		wire carry4;
		wire carry5;
		wire carry6;			
		meiaSoma soma0(c[0],carry,a[0],b[0]);
		fullAdder soma1(c[1],carry2,a[1],b[1],carry);
		fullAdder soma2(c[2],carry3,a[2],b[2],carry2);
		fullAdder soma3(c[3],carry4,a[3],b[3],carry3);
		fullAdder soma4(c[4],carry5,a[4],b[4],carry4);
		fullAdder soma5(c[5],carry6,a[5],b[5],carry5);	
		

										 
endmodule//somador6b



// ------------------------- 
//  c1 
// ------------------------- 
module c1 (output[5:0] s,  
                               input[5:0] a); 
 
// descrever por portas 
not(s[0],a[0]);
not(s[1],a[1]);
not(s[2],a[2]);
not(s[3],a[3]);
not(s[4],a[4]);
not(s[5],a[5]);
 
endmodule // c1

// ------------------------- 
//  c2 
// ------------------------- 
module c2 (output[5:0] s,  
                               input[5:0] a); 
 
// descrever por portas 
wire[5:0] x;
c1 c1(x,a);
somador6b somador(s,x,000001);

endmodule // c2 
 
 
module test_c2; 
// ------------------------- definir dados 
      reg[5:0] x;
		reg[5:0] w;
		
		wire[5:0] y;
		
		
		c2 c2 (y,x);
		
		
		
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0025 - Pedro Ballona - 427455"); 
      $display("Test ALU’s c1 (1-verdadeiro 0-falso)");
		x=6'b001011;		
		#1 $display("%b",y);
		
 
 // projetar testes do somador complete 
 
 end 
 
endmodule // test_c2 