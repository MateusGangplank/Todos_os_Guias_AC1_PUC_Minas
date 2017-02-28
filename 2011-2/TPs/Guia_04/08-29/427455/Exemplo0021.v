// ------------------------- 
// Exemplo0021 – FULL ADDER 
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
 
module test_fullAdder; 
// ------------------------- definir dados 
     
		reg [5:0] x; 
      reg [5:0] y; 
      //reg  carry;		 
      wire [5:0] soma;
		wire carry;
		wire carry2;
		wire carry3;
		wire carry4;
		wire carry5;
		wire carry6;		
		
		
		meiaSoma soma0(soma[0],carry,x[0],y[0]);
		fullAdder soma1(soma[1],carry2,x[1],y[1],carry);
		fullAdder soma2(soma[2],carry3,x[2],y[2],carry2);
		fullAdder soma3(soma[3],carry4,x[3],y[3],carry3);
		fullAdder soma4(soma[4],carry5,x[4],y[4],carry4);
		fullAdder soma5(soma[5],carry6,x[5],y[5],carry5);				
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0021 - Pedro Ballona - 427455"); 
      $display("Test ALU’s full adder");
		x = 6'b00111; y = 6'b00111;
 		#1 $display("%b",soma);
 
 // projetar testes do somador complete 
 
 end 
 
endmodule // test_fullAdder 